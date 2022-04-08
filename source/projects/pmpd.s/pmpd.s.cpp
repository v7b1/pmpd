#include "c74_max.h"


using namespace c74::max;


static t_class *pmpd_s_class;
static t_class *rr_class;

struct t_pmpd_s {
    t_object  x_obj;
    
    
    t_symbol *x_sym;  // send address?
    t_object *rr;
};

typedef struct _rr
{
    t_object    ob;
    long        usagecount;
} t_rr;


static t_symbol *ps_nothing;
static t_symbol *ps_pmpd_rr;
static t_symbol *ps_pmpd_bang;
static t_symbol *ps_pmpd_sendmessage;




//void *pmpd_s_new(t_symbol *s, double L, double K, double D, double D2)
void *pmpd_s_new(t_symbol *s)
{
    t_pmpd_s *x = NULL;
    
    if(( x = (t_pmpd_s *)object_alloc(pmpd_s_class))) {
        
        t_object *rr;
        
        rr = (t_object *)object_findregistered(ps_pmpd_rr, s);
        if(!rr) {
            // let's create it and register
            object_new(CLASS_NOBOX, ps_pmpd_rr, s);
            rr = (t_object *)object_findregistered(ps_pmpd_rr, s);
        }
        if (rr) {
            x->rr = rr;
            // tell rr that we are using it
            object_method(rr, gensym("retain"));
        }
    }
    
    
    return x;
}



#pragma mark pmpd.rr object
//////////////////////////////////////////////////////////

void rr_retain(t_rr *x)
{
    x->usagecount++;
    printf("usagecount: %ld\n", x->usagecount);
}

void rr_release(t_rr *x)
{
    x->usagecount--;
    if (x->usagecount <= 0) { // commit suicide
        object_free(x);
    }
}

void rr_free(t_rr *x)
{
    printf("rr_free!\n");
    object_unregister(x);
}

void *rr_new(t_symbol *name)
{
    t_rr *x = NULL;
    
    printf("rr_new: name: %s\n", name->s_name);
    
    if (name && name != ps_nothing) {
        x = (t_rr *)object_alloc(rr_class);
        if (x) {
            x->usagecount = 0;
            object_register(ps_pmpd_rr, name, x);
            printf("rr_new: object registered\n");
        }
    }
    return x;
}


//////////////////////////////////////////////////////////


void pmpd_s_anything(t_pmpd_s *x, t_symbol *s, long ac, t_atom *av)
{
    t_atomarray *aa = NULL;
    t_atom *argv = NULL;
    long argc = 0;
    char alloc;
    
    if (atom_alloc_array(ac + 1, &argc, &argv, &alloc) == MAX_ERR_NONE) {
        atom_setsym(argv, s);
        sysmem_copyptr(av, argv + 1, sizeof(t_atom) * ac);
        aa = atomarray_new(argc, argv);
        if (aa) {
            object_notify(x->rr, ps_pmpd_sendmessage, aa);
            object_free(aa);
        }
        sysmem_freeptr(argv);
    }
}


void pmpd_s_float(t_pmpd_s *x, double f)
{
    t_atom a;
    
    atom_setfloat(&a, f);
    pmpd_s_anything(x, gensym("float"), 1, &a);
}


void pmpd_s_int(t_pmpd_s *x, long n)
{
    t_atom a;
    
    atom_setlong(&a, n);
    pmpd_s_anything(x, gensym("int"), 1, &a);
}


void pmpd_s_bang(t_pmpd_s *x)
{
//    pmpd_s_anything(x, gensym("bang"), 0, NULL);
    object_notify(x->rr, ps_pmpd_bang, NULL);
    
}


static void pmpd_s_free(t_pmpd_s *x)
{
    object_method(x->rr, gensym("release"));
}


void pmpd_s_assist(t_pmpd_s *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"..."); break;
                
        }
    }
}


void ext_main(void* r)
{
    pmpd_s_class = class_new("pmpd.s",
                             (method)pmpd_s_new,
                             (method)pmpd_s_free,
                             sizeof(t_pmpd_s),
                             0L, A_SYM, 0);
    
    class_addmethod(pmpd_s_class, (method)pmpd_s_int, "int", A_LONG, 0);
    class_addmethod(pmpd_s_class, (method)pmpd_s_float, "float", A_FLOAT, 0);
    class_addmethod(pmpd_s_class, (method)pmpd_s_bang, "bang", 0);
    class_addmethod(pmpd_s_class, (method)pmpd_s_anything, "anything", A_GIMME, 0);
    class_addmethod(pmpd_s_class, (method)pmpd_s_assist, "assist", A_CANT,0);

    
    class_register(CLASS_BOX, pmpd_s_class);
    
    
    // Create the "rr" class. This class is actually responsible for the communication
    // with the 'servant' objects, and we need it in order to support multiple 'master' objects
    // sending to one or several 'servant' objects.
    t_class *c = class_new("pmpd.rr", (method)rr_new, (method)rr_free, sizeof(t_rr), 0L, A_CANT, 0);
    
    class_addmethod(c, (method)rr_retain, "retain", 0);
    class_addmethod(c, (method)rr_release, "release", 0);
    
    class_register(CLASS_NOBOX, c);
    rr_class = c;
    
    ps_nothing = gensym("");
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    
    return 0;
    
}



