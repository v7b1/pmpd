#include "c74_max.h"
#include "pmpd_translate.h"


using namespace c74::max;


static t_class *linkKD_class;

struct t_linkKD {
    t_object  x_obj;
    double raideur, viscosite, D2, longueur, distance_old, position1,  position2, position_old1, position_old2;
    void *force1;
    void *force2;
    double Lmin, Lmax;
    t_symbol *x_sym;  // receive
    void *m_proxy;
    long    id;
};



void *linkKD_new(t_symbol *s, int argc, t_atom *argv)
{
    t_linkKD *x = (t_linkKD *)object_alloc(linkKD_class);
    double K, D, L, D2 = 0.0;
    
    if (x)
    {
        x->m_proxy = proxy_new(x, 1, NULL);
        
        x->force2 = outlet_new(x, NULL);
        x->force1 = outlet_new(x, NULL);
        
        
        x->x_sym = (argc && atom_gettype(argv) == A_SYM) ? atom_getsym(argv) : NULL;
    
        if (x->x_sym && x->x_sym != ps_nothing) {
            object_subscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
            argc--;
            argv++;
        }
        
        // check the other arguments
        if(argc > 0) {
//            argv++;
            L = atom_getfloat(argv);
//                object_post(NULL, "L: %f", L);
        }
        if(argc > 1) {
            argv++;
            K = atom_getfloat(argv);
//                object_post(NULL, "K: %f", K);
        }
        if(argc > 2) {
            argv++;
            D = atom_getfloat(argv);
//                object_post(NULL, "D: %f", D);
        }
        if(argc > 3) {
            argv++;
            D2 = atom_getfloat(argv);
//                object_post(NULL, "D2: %f", D2);
        }
        
        x->position1 = 0;
        x->position2 = 0;
            
        x->raideur=K;
        x->viscosite=D;
        x->D2=D2;
        
        x->Lmin= 0;
        x->Lmax= 10000;
        
        x->longueur = L;
            
    }

    return x;
}



void linkKD_float(t_linkKD *x, double f1)
{
    long inlet = proxy_getinlet((t_object *)x);
    if (inlet == 0)
        x->position1 = f1;
    else x->position2 = f1;
}


void linkKD_bang(t_linkKD *x)
{
    double force1, force2, distance;
    
    distance = (x->position2 - x->position1);
    //distance = abs(x->position2 - x->position1);
    if (distance<0) distance = -distance;
    
    force1 = x->raideur*(distance-(x->longueur)) + x->viscosite*(distance - x->distance_old) ;
    
    x->distance_old = distance;
    
    if (distance > x->Lmax) force1=0;
    if (distance < x->Lmin) force1=0;
    
    if (distance != 0)
    {
        force1 = force1 * (x->position2 - x->position1) / distance;
    }
    
    force2 = -force1 + (x->position_old2 - x->position2)*x->D2;
    force1 += (x->position_old1 - x->position1)*x->D2;
    // masse damping
     
    outlet_float(x->force2, force2);
    outlet_float(x->force1, force1);
    
    x->position_old1 = x->position1;
    x->position_old2 = x->position2;
    
}

void linkKD_reset(t_linkKD *x)
{
    x->position1 = 0;
    x->position2 = 0;
    
    x->position_old1 = 0;
    x->position_old2 = 0;
    
    x->distance_old = x->longueur;
}

void linkKD_resetF(t_linkKD *x)
{
    x->position_old1 = x->position1;
    x->position_old2 = x->position2;
    
    x->distance_old = x->longueur;
}

void linkKD_resetl(t_linkKD *x)
{
    x->longueur = (x->position1 - x->position2);
}

void linkKD_setL(t_linkKD *x, double L)
{
    x->longueur = L;
}

void linkKD_setK(t_linkKD *x, double K)
{
    x->raideur = K;
}

void linkKD_setD(t_linkKD *x, double D)
{
    x->viscosite = D;
}

void linkKD_setD2(t_linkKD *x, double D2)
{
    x->D2 = D2;
}

void linkKD_Lmin(t_linkKD *x, double Lmin)
{
    x->Lmin = Lmin;
}

void linkKD_Lmax(t_linkKD *x, double Lmax)
{
    x->Lmax = Lmax;
}

static void linkKD_free(t_linkKD *x)
{
//    pd_unbind(&x->x_obj.ob_pd, x->x_sym);
    object_unsubscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
    object_free(x->m_proxy);
}


void link_notify(t_linkKD *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
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
        linkKD_bang(x); // call it directly, we know it exists!
    }
}


void linkKD_assist(t_linkKD *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"..."); break;
                
        }
    }
    else {
        switch(a) {
            case 0: sprintf (s,"(float) force to apply to mass 1"); break;
            case 1: sprintf (s,"(float) force to apply to mass 2"); break;
        }
        
    }
}




void ext_main(void* r)
{

    linkKD_class = class_new("pmpd.link",
                             (method)linkKD_new,
                             (method)linkKD_free,
                             sizeof(t_linkKD),
                             0L, A_GIMME, 0);
    
    class_addmethod(linkKD_class, (method)linkKD_float, "float", A_FLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_bang, "bang", 0);
    class_addmethod(linkKD_class, (method)linkKD_reset, "reset", 0);
    class_addmethod(linkKD_class, (method)linkKD_resetl, "resetL", 0);
    class_addmethod(linkKD_class, (method)linkKD_resetF, "resetF", 0);
    class_addmethod(linkKD_class, (method)linkKD_setD, "setD", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_setD2, "setD2", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_setK, "setK", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_setL, "setL", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_Lmin, "setLmin", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_Lmax, "setLmax", A_DEFFLOAT, 0);
    class_addmethod(linkKD_class, (method)linkKD_assist, "assist", A_CANT,0);
    class_addmethod(linkKD_class, (method)link_notify, "notify", A_CANT, 0);
    
    class_register(CLASS_BOX, linkKD_class);
    
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    
    
}

