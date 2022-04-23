#include "c74_max.h"
//#include "math.h"
#include "pmpd_translate.h"

using namespace c74::max;

static t_class *link2D_class;

typedef struct _link2D {
  t_object  x_obj;
  double raideur, viscosite, D2, longueur, distance_old;
  double position2Dx1, position2Dx2, posx_old1, posx_old2;
  double position2Dy1, position2Dy2, posy_old1, posy_old2;
  double Lmin, Lmax, muscle;
  void *force1;
  void *force2;
    void *m_proxy; // inlet proxy
  t_symbol *x_sym;  // receive
} t_link2D;



void link2D_position2D(t_link2D *x, double f1, double f2)
{
    long inlet = proxy_getinlet((t_object *)x);
    if (inlet == 0) {
        x->position2Dx1 = f1;
        x->position2Dy1 = f2;
    }
    else {
        x->position2Dx2 = f1;
        x->position2Dy2 = f2;
    }
}

void link2D_bang(t_link2D *x)
{
  double force, force2, forcex1, forcey1, forcex2, forcey2, distance;
  t_atom force1[2];

  distance = sqrt ( pow((x->position2Dx2-x->position2Dx1), 2) + pow((x->position2Dy2-x->position2Dy1), 2) );

  force = ( x->raideur*(distance-(x->longueur * x->muscle)) ) + (  x->viscosite*(distance-x->distance_old) );

  if (distance > x->Lmax) force=0;
  if (distance < x->Lmin) force=0;

  if (distance != 0)
  {
    forcex1 = force * (x->position2Dx2 - x->position2Dx1) / distance;
    forcey1 = force * (x->position2Dy2 - x->position2Dy1) / distance;
  }
  else
  {
   forcex1 = 0;
   forcey1 = 0 ;
  }

  forcex2 = -forcex1;
  forcey2 = -forcey1;

  forcex1 += (x->posx_old1 - x->position2Dx1)*x->D2;
  forcey1 += (x->posy_old1 - x->position2Dy1)*x->D2;
 
  forcex2 += (x->posx_old2 - x->position2Dx2)*x->D2;
  forcey2 += (x->posy_old2 - x->position2Dy2)*x->D2;

    atom_setfloat(&(force1[0]), forcex2 );
    atom_setfloat(&(force1[1]), forcey2 );

  outlet_anything(x->force2, ps_force2D, 2, force1);

    atom_setfloat(&(force1[0]), forcex1 );
    atom_setfloat(&(force1[1]), forcey1 );

  outlet_anything(x->force1, ps_force2D, 2, force1);
 
  x->posx_old2 = x->position2Dx2;
  x->posx_old1 = x->position2Dx1;

  x->posy_old2 = x->position2Dy2;
  x->posy_old1 = x->position2Dy1;

  x->distance_old = distance;
}

void link2D_reset(t_link2D *x)
{
  x->position2Dx1 = 0;
  x->position2Dx2 = 0;
  x->posx_old1 = 0;
  x->posx_old2 = 0;

  x->position2Dy1 = 0;
  x->position2Dy2 = 0;
  x->posy_old1 = 0;
  x->posy_old2 = 0;

  x->distance_old = x->longueur;
}

void link2D_resetF(t_link2D *x)
{

  x->posx_old1 = x->position2Dx1;
  x->posx_old2 = x->position2Dx2;

  x->posy_old1 = x->position2Dy1;
  x->posy_old2 = x->position2Dy2;

  x->distance_old = x->longueur;

}

void link2D_resetL(t_link2D *x)
{
  x->longueur = sqrt ( pow((x->position2Dx2-x->position2Dx1), 2) + pow((x->position2Dy2-x->position2Dy1), 2) );
}


void link2D_setK(t_link2D *x, double K)
{
  x->raideur = K;
}

void link2D_setL(t_link2D *x, double L)
{
  x->longueur = L;
}

void link2D_setD(t_link2D *x, double D)
{
  x->viscosite = D;
}

void link2D_setD2(t_link2D *x, double D)
{
  x->D2 = D;
}

void link2D_Lmin(t_link2D *x, double Lmin)
{
  x->Lmin = Lmin;
}

void link2D_Lmax(t_link2D *x, double Lmax)
{
  x->Lmax = Lmax;
}

void link2D_muscle(t_link2D *x, double muscle)
{
  x->muscle = muscle;
}

static void link2D_free(t_link2D *x)
{
//    pd_unbind(&x->x_obj.ob_pd, x->x_sym);
    object_unsubscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
    
    object_free(x->m_proxy);
    
}

void link_notify(t_link2D *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
//    object_post((t_object *)x, "link_notify: %s", msg->s_name);
    if (msg == ps_pmpd_sendmessage) { // pmpd.rr is calling with a message from 'pmpd.s'
        t_atomarray *aa = (t_atomarray *)data;
        
        long ac;
        t_atom *av;
        atomarray_getatoms(aa, &ac, &av);
        
        if (atom_gettype(av) == A_SYM) {
            t_symbol *arg = atom_getsym(av);
            object_method_typed((t_object *)x, arg, ac-1, av+1, NULL);
        }
    }
    else if (msg == ps_pmpd_bang) {
        link2D_bang(x); // call it directly, we know it exists!
//        object_method((t_object *)x, ps_pmpd_bang);
    }
//    else if (msg == gensym("free")) {
//        // pmpd.rr is disappearing, no more servers
//        // but we remain subscribed, so there's nothing to do here
//        // if a new master appears, we will be called with 'subscribe_attach'
//        // and automatically be attached.
//        object_post(NULL, "pmpd.rr free!");
//    }
}

void link2D_assist(t_link2D *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"(bang) computes and outputs forces, according to the last masses positions"); break;
                
        }
    }
    else {
        switch(a) {
            case 0: sprintf (s,"(list) force2D to apply to mass 1"); break;
            case 1: sprintf (s,"(list) force2D to apply to mass 2"); break;
        }
        
    }
}

//void *link2D_new(t_symbol *s, double L, double K, double D, double D2)
void *link2D_new(t_symbol *s, int argc, t_atom *argv)
{
  
  t_link2D *x = (t_link2D *)object_alloc(link2D_class);

  x->x_sym = s;
//  pd_bind(&x->x_obj.ob_pd, s);

//  inlet_new(&x->x_obj, &x->x_obj.ob_pd, gensym("position2D"), gensym("position2D2"));

    x->m_proxy = proxy_new(x, 1, NULL);
 
    // two outlets
    x->force2 = outlet_new(x, NULL);
    x->force1 = outlet_new(x, NULL);
    

  x->position2Dx1 = 0;
  x->position2Dx2 = 0;
  x->position2Dy1 = 0;
  x->position2Dy2 = 0;
    
    double K, D, L, D2 = 0.0;
    
    x->x_sym = (argc && atom_gettype(argv) == A_SYM) ? atom_getsym(argv) : NULL;
    
    if (x->x_sym) {
        object_subscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
    }
    
    // check the other arguments
    if(argc > 0) {
        argv++;
        if(atom_gettype(argv) == A_FLOAT)
            L = atom_getfloat(argv);
        else if(atom_gettype(argv) == A_LONG)
            L = atom_getlong(argv);
    }
    if(argc > 1) {
        argv++;
        if(atom_gettype(argv) == A_FLOAT)
            K = atom_getfloat(argv);
        else if(atom_gettype(argv) == A_LONG)
            K = atom_getlong(argv);
    }
    if(argc > 2) {
        argv++;
        if(atom_gettype(argv) == A_FLOAT)
            D = atom_getfloat(argv);
        else if(atom_gettype(argv) == A_LONG)
            D = atom_getlong(argv);
    }
    if(argc > 3) {
        argv++;
        if(atom_gettype(argv) == A_FLOAT)
            D2 = atom_getfloat(argv);
        else if(atom_gettype(argv) == A_LONG)
            D2 = atom_getlong(argv);
    }

  x->raideur = K;
  x->viscosite = D;
  x->longueur = L;

  x->D2 = D2;

  x->Lmin = 0;
  x->Lmax = 10000;
  x->muscle = 1;

  x->distance_old = x->longueur;

  return (x);
}


void ext_main(void* r)
{

  link2D_class = class_new("pmpd.link2D",
        (method)link2D_new,
        (method)link2D_free,
		sizeof(t_link2D),
        0L, A_GIMME, 0L);
//                           A_DEFSYM, A_DEFFLOAT, A_DEFFLOAT, A_DEFFLOAT, A_DEFFLOAT, 0);


    class_addmethod(link2D_class, (method)link2D_bang, "bang", 0);
  class_addmethod(link2D_class, (method)link2D_reset,  "reset", 0);
  class_addmethod(link2D_class, (method)link2D_resetL,  "resetL", 0);
  class_addmethod(link2D_class, (method)link2D_resetF,  "resetF", 0);
  class_addmethod(link2D_class, (method)link2D_setD,  "setD", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_setD2,  "setD2", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_setK,  "setK", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_setL,  "setL", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_Lmin,  "setLmin", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_Lmax,  "setLmax", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_muscle,  "setM", A_DEFFLOAT, 0);
  class_addmethod(link2D_class, (method)link2D_position2D,  "position2D", A_DEFFLOAT, A_DEFFLOAT, 0);
    class_addmethod(link2D_class, (method)link_notify, "notify", A_CANT, 0);
    class_addmethod(link2D_class, (method)link2D_assist, "assist", A_CANT, 0);

    
    class_register(CLASS_BOX, link2D_class);
    
    ps_nothing = gensym("");
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    
    ps_force2D = gensym("force2D");

}
