#include "c74_max.h"
#include "pmpd_translate.h"

using namespace c74::max;

static t_class *link3D_class;

typedef struct _link3D {
  t_object  x_obj;
    double  raideur, viscosite, D2, longueur, distance_old;
    double  position3Dx1, position3Dx2, posx_old1, posx_old2;
    double  position3Dy1, position3Dy2, posy_old1, posy_old2;
    double  position3Dz1, position3Dz2, posz_old1, posz_old2;
    double  Lmin, Lmax, muscle;
    void    *force1;
    void    *force2;
    void    *m_proxy; // inlet proxy
    t_symbol *x_sym;  // receive
} t_link3D;

void link3D_position3D(t_link3D *x, t_floatarg f1, t_floatarg f2, t_floatarg f3)
{
    long inlet = proxy_getinlet((t_object *)x);
    if (inlet == 0) {
        x->position3Dx1 = f1;
        x->position3Dy1 = f2;
        x->position3Dz1 = f3;
    }
    else {
        x->position3Dx2 = f1;
        x->position3Dy2 = f2;
        x->position3Dz2 = f3;
    }
}

//void link3D_position3D2(t_link3D *x, t_floatarg f1, t_floatarg f2, t_floatarg f3)
//{
//  x->position3Dx2 = f1;
//  x->position3Dy2 = f2;
//  x->position3Dz2 = f3;
//}

void link3D_bang(t_link3D *x)
{
    double force, forcex1, forcey1, forcez1, forcex2, forcey2, forcez2, distance;
  t_atom force1[3];

  distance = sqrt ( pow((x->position3Dx2-x->position3Dx1), 2) + pow((x->position3Dy2-x->position3Dy1),2) + pow((x->position3Dz2-x->position3Dz1), 2) );

  force = ( x->raideur*(distance-(x->longueur * x->muscle)) ) + (  x->viscosite*(distance-x->distance_old) );

  if (distance > x->Lmax)  force=0;
  if (distance < x->Lmin)  force=0;

  if (distance != 0)
  {
    forcex1 = force * (x->position3Dx2 - x->position3Dx1) / distance;
    forcey1 = force * (x->position3Dy2 - x->position3Dy1) / distance;
    forcez1 = force * (x->position3Dz2 - x->position3Dz1) / distance;
  }
  else
  {
   forcex1 = 0;
   forcey1 = 0;
   forcez1 = 0;
  }

  forcex2 = -forcex1;
  forcey2 = -forcey1;
  forcez2 = -forcez1;

  forcex1 += (x->posx_old1 - x->position3Dx1)*x->D2;
  forcey1 += (x->posy_old1 - x->position3Dy1)*x->D2;
  forcez1 += (x->posz_old1 - x->position3Dz1)*x->D2;
 
  forcex2 += (x->posx_old2 - x->position3Dx2)*x->D2;
  forcey2 += (x->posy_old2 - x->position3Dy2)*x->D2;
  forcez2 += (x->posz_old2 - x->position3Dz2)*x->D2;

    atom_setfloat(&(force1[0]), forcex2 );
    atom_setfloat(&(force1[1]), forcey2 );
    atom_setfloat(&(force1[2]), forcez2 );

    outlet_anything(x->force2, ps_force3D, 3, force1);

    
    atom_setfloat(&(force1[0]), forcex1 );
    atom_setfloat(&(force1[1]), forcey1 );
    atom_setfloat(&(force1[2]), forcez1 );
    
    outlet_anything(x->force1, ps_force3D, 3, force1);
 
  
  x->posx_old2 = x->position3Dx2;
  x->posx_old1 = x->position3Dx1;

  x->posy_old2 = x->position3Dy2;
  x->posy_old1 = x->position3Dy1;

  x->posz_old2 = x->position3Dz2;
  x->posz_old1 = x->position3Dz1;

  x->distance_old = distance;
}

void link3D_reset(t_link3D *x)
{
  x->position3Dx1 = 0;
  x->position3Dx2 = 0;
  x->posx_old1 = 0;
  x->posx_old2 = 0;

  x->position3Dy1 = 0;
  x->position3Dy2 = 0;
  x->posy_old1 = 0;
  x->posy_old2 = 0;

  x->position3Dz1 = 0;
  x->position3Dz2 = 0;
  x->posz_old1 = 0;
  x->posz_old2 = 0;

  x->distance_old = x->longueur;

}

void link3D_resetF(t_link3D *x)
{

  x->posx_old1 = x->position3Dx1;
  x->posx_old2 = x->position3Dx2;
 
  x->posy_old1 = x->position3Dy1;
  x->posy_old2 = x->position3Dy2;
 
  x->posz_old1 = x->position3Dz1;
  x->posz_old2 = x->position3Dz2;
 
  x->distance_old = x->longueur;

}

void link3D_resetL(t_link3D *x)
{
  x->longueur = sqrt ( pow((x->position3Dx2-x->position3Dx1), 2) + pow((x->position3Dy2-x->position3Dy1),2) + pow((x->position3Dz2-x->position3Dz1), 2) );
}

void link3D_setK(t_link3D *x, t_float K)
{
  x->raideur = K;
}

void link3D_setL(t_link3D *x, t_float L)
{
  x->longueur = L;
}

void link3D_setD(t_link3D *x, t_float D)
{
  x->viscosite = D;
}

void link3D_setD2(t_link3D *x, t_float D2)
{
  x->D2 = D2;
}

void link3D_Lmin(t_link3D *x, t_float Lmin)
{
  x->Lmin = Lmin;
}

void link3D_Lmax(t_link3D *x, t_float Lmax)
{
  x->Lmax = Lmax;
}

void link3D_muscle(t_link3D *x, t_float muscle)
{
  x->muscle = muscle;
}

static void link3D_free(t_link3D *x)
{
//    pd_unbind(&x->x_obj.ob_pd, x->x_sym);
    object_unsubscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
    
    object_free(x->m_proxy);
}


void link_notify(t_link3D *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
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
        link3D_bang(x); // call it directly, we know it exists!
    }
}


void link3D_assist(t_link3D *x, void *b, long m, long a, char *s) {
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


void *link3D_new(t_symbol *s, int argc, t_atom *argv)
{
  
    t_link3D *x = (t_link3D *)object_alloc(link3D_class);

    if (x) {
        x->m_proxy = proxy_new(x, 1, NULL);
        
        // two outlets
        x->force2 = outlet_new(x, NULL);
        x->force1 = outlet_new(x, NULL);

        x->position3Dx1 = 0;
        x->position3Dx2 = 0;
        x->position3Dy1 = 0;
        x->position3Dy2 = 0;
        x->position3Dz1 = 0;
        x->position3Dz2 = 0;
        
        double K, D, L, D2 = 0.0;
        
        x->x_sym = (argc && atom_gettype(argv) == A_SYM) ? atom_getsym(argv) : NULL;
        
        if (x->x_sym && x->x_sym != ps_nothing) {
            object_subscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
            
            // check the other arguments
            if (argc > 1)
                L = atom_getfloat(argv+1);
            if (argc > 2)
                K = atom_getfloat(argv+2);
            if (argc > 3)
                D = atom_getfloat(argv+3);
            if (argc > 4)
                D2 = atom_getfloat(argv+4);
            
        } else {
            // check the other arguments
            if (argc > 0)
                L = atom_getfloat(argv);
            if (argc > 1)
                K = atom_getfloat(argv+1);
            if (argc > 2)
                D = atom_getfloat(argv+2);
            if (argc > 3)
                D2 = atom_getfloat(argv+3);
        }

        x->raideur = K;
        x->viscosite = D;
        x->longueur = L;
       
        x->D2 = D2;

        x->Lmin= 0;
        x->Lmax= 10000;

        x->distance_old = x->longueur;

        x->muscle = 1;
    }

    return x;
}


void ext_main(void* r)
{

  link3D_class = class_new("pmpd.link3D",
        (method)link3D_new,
        (method)link3D_free,
		sizeof(t_link3D),
        0L, A_GIMME, 0L);


    class_addmethod(link3D_class, (method)link3D_bang, "bang", 0);
  class_addmethod(link3D_class, (method)link3D_reset,  "reset", 0);
  class_addmethod(link3D_class, (method)link3D_resetL, "resetL", 0);
  class_addmethod(link3D_class, (method)link3D_resetF,  "resetF", 0);
  class_addmethod(link3D_class, (method)link3D_setD,  "setD", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_setD2,  "setD2", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_setK,  "setK", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_setL,  "setL", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_Lmin,  "setLmin", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_Lmax,  "setLmax", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_muscle,  "setM", A_DEFFLOAT, 0);
  class_addmethod(link3D_class, (method)link3D_position3D,  "position3D", A_DEFFLOAT, A_DEFFLOAT, A_DEFFLOAT, 0);
    class_addmethod(link3D_class, (method)link_notify, "notify", A_CANT, 0);
    class_addmethod(link3D_class, (method)link3D_assist, "assist", A_CANT, 0);
    
    class_register(CLASS_BOX, link3D_class);
    
    ps_nothing = gensym("");
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    
    ps_force3D = gensym("force3D");

}
