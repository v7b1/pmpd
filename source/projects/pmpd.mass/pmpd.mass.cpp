#include "c74_max.h"
#include "pmpd_translate.h"


using namespace c74::max;


static t_class *mass_class;


struct t_mass {
    t_object  x_obj;
    double pos_old_1, pos_old_2, Xinit;
    double force, mass, dX;
    double minX, maxX;
    void *position_out, *vitesse_out, *force_out;
    t_symbol *x_sym; // receive
    unsigned int x_state; // random
    double x_f; // random
};


static int makeseed(void)
{
    static unsigned int random_nextseed = 1489853723;
    random_nextseed = random_nextseed * 435898247 + 938284287;
    return (random_nextseed & 0x7fffffff);
}

// TODO: make 64bit
static double random_bang(t_mass *x)
{
    int nval;
    int range = 2000000;
    double rnd;
    unsigned int randval = x->x_state;
    x->x_state = randval = randval * 472940017 + 832416023;
    nval = ((double)range) * ((double)randval)
    * (1./4294967296.);
    if (nval >= range) nval = range-1;
    
    rnd=nval;
    
    rnd-=1000000;
    rnd=rnd/1000000.;    //pour mettre entre -1 et 1;
    return (rnd);
}


void *mass_new(t_symbol *s, int argc, t_atom *argv)
{
    t_mass *x = (t_mass *)object_alloc(mass_class);
    
    if (x) {
        x->x_sym = (argc && atom_gettype(argv) == A_SYM) ? atom_getsym(argv) : NULL;
        
        if (x->x_sym && x->x_sym != ps_nothing) {
            object_subscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
            argc--;
            argv++;
        }
        
        // create outlets;
        x->vitesse_out = outlet_new(x, NULL);
        x->force_out = outlet_new(x, NULL);
        x->position_out = outlet_new(x, NULL);
        
        x->mass = 0.;
        x->Xinit = x->pos_old_1 = x->pos_old_2 = 0.;
        x->force = 0.;
        x->minX = -100000;
        x->maxX = 100000;
        
        
        // check the other arguments
        if (argc > 0) {
            x->mass = atom_getfloat(argv);
        }
        if (argc > 1) {
            argv++;
            double X = atom_getfloat(argv);
            x->Xinit = X;
            x->pos_old_1 = X;
            x->pos_old_2 = X;
        }
        
        
        if (x->mass <= 0) x->mass = 1;
        
        makeseed();
    }
    
    return (x);
}


void mass_minX(t_mass *x, double f1)
{
    x->minX = f1;
}

void mass_maxX(t_mass *x, double f1)
{
    x->maxX = f1;
}

void mass_float(t_mass *x, double f1)
{
    x->force += f1;
}

void mass_int(t_mass *x, long f1)
{
    x->force += (double)f1;
}

void mass_bang(t_mass *x)
{
    double pos_new;
    
    if (x->mass > 0)
        pos_new = x->force/x->mass + 2*x->pos_old_1 - x->pos_old_2;
    else pos_new = x->pos_old_1;
    
    pos_new = fmax(fmin(x->maxX, pos_new), x->minX);
    
    pos_new += x->dX;
    
    x->pos_old_1 += x->dX; // pour ne pas avoir d'inertie suplementaire du a ce deplacement
    
    outlet_float(x->vitesse_out, x->pos_old_1 - x->pos_old_2);
    outlet_float(x->force_out, x->force);
    outlet_float(x->position_out, pos_new);
    
    x->pos_old_2 = x->pos_old_1;
    x->pos_old_1 = pos_new;
    
    //  x->force = 0;
    
    x->force = random_bang(x)*1e-25; // avoiding denormal problem by adding low amplitude noise
    
    x->dX = 0;
    
}

void mass_reset(t_mass *x)
{
    x->pos_old_2 = x->Xinit;
    x->pos_old_1 = x->Xinit;
    
    x->force=0;
    
    outlet_float(x->position_out, x->Xinit);
}

void mass_resetF(t_mass *x)
{
    x->force=0;
    
}

void mass_dX(t_mass *x, double posX)
{
    x->dX += posX;
}

void mass_setX(t_mass *x, double posX)
{
    x->pos_old_2 = posX;            // clear history for stability (instability) problem
    x->pos_old_1 = posX;
    
    x->force=0;
    
    outlet_float(x->position_out, posX);
}

void mass_loadbang(t_mass *x)
{
    outlet_float(x->position_out, x->Xinit);
}

void mass_set_mass(t_mass *x, double mass)
{
    x->mass=mass;
}


static void mass_free(t_mass *x)
{
//    pd_unbind(&x->x_obj.ob_pd, x->x_sym);
    object_unsubscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
}



void mass_notify(t_mass *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
{
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
        mass_bang(x); // call it directly, we know it exists!
    }

}




void mass_assist(t_mass *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"(int/float) adds force to this mass, (bang) compute and output new position"); break;
                
        }
    }
    else {
        switch(a) {
            case 0: sprintf (s,"(float) position of the mass"); break;
            case 1: sprintf (s,"(float) force applied to the mass"); break;
            case 2: sprintf (s,"(float) velocity of the mass"); break;
        }
        
    }
}


void ext_main(void* r)
{
   mass_class = class_new("pmpd.mass",
        (method)mass_new,
        (method)mass_free,
		sizeof(t_mass),
                         0L, A_GIMME, 0);

    class_addmethod(mass_class, (method)mass_float, "float", A_FLOAT, 0);
    class_addmethod(mass_class, (method)mass_int, "int", A_LONG, 0);
    class_addmethod(mass_class, (method)mass_bang, "bang", 0);
    class_addmethod(mass_class, (method)mass_set_mass, "setM", A_DEFFLOAT, 0);
    class_addmethod(mass_class, (method)mass_setX, "setX", A_DEFFLOAT, 0);
    class_addmethod(mass_class, (method)mass_dX, "dX", A_DEFFLOAT, 0);
    class_addmethod(mass_class, (method)mass_reset, "reset", 0);
    class_addmethod(mass_class, (method)mass_resetF, "resetF", 0);
    class_addmethod(mass_class, (method)mass_minX, "setXmin", A_DEFFLOAT, 0);
    class_addmethod(mass_class, (method)mass_maxX, "setXmax", A_DEFFLOAT, 0);
    class_addmethod(mass_class, (method)mass_loadbang, "loadbang", 0);
    class_addmethod(mass_class, (method)mass_notify, "notify", A_CANT, 0);
    class_addmethod(mass_class, (method)mass_assist, "assist", A_CANT,0);
    
    class_register(CLASS_BOX, mass_class);
    
    ps_nothing = gensym("");
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    

}
