/*
 *  pmpd.h
 *  
 */

//#include "c74_msp.h"
//#include "c74_max.h"

using namespace c74::max;

#define nb_max_link   100000
#define nb_max_mass   100000

#define max(a,b) ( ((a) > (b)) ? (a) : (b) ) 
#define min(a,b) ( ((a) < (b)) ? (a) : (b) ) 

static t_class *pmpd_class;

typedef struct _mass {
    t_symbol *Id;
    int mobile;
    double invM;
    double speedX;
    double posX;
    double forceX;
    double D2;
    double overdamp;
    int num;
} foo;

typedef struct _link {
    t_symbol *Id;
    int lType;
    struct _mass *mass1;
    struct _mass *mass2;
    t_int active;
    double K;
    double D;
    double L;
    double Pow;
    double Lmin;
    double Lmax;
    double distance;
    t_symbol *arrayK;
    t_symbol *arrayD;
    double K_L; // longeur du tabeau K
    double D_L; // longeur du tabeau D
    double forceX;
} foo1 ;

typedef struct _pmpd {
     t_object  x_obj;
    struct _link link[nb_max_link];
    struct _mass mass[nb_max_mass];

    void *main_outlet;
    void *info_outlet;
    
    int nb_link;
    int nb_mass;
    double minX, maxX;
    t_int grab; // si on grab une mass ou pas
    t_int grab_nb; // la masse grabé
} t_pmpd;


// vb
// convenience functions to translate from pd to max atom-stuff
t_symbol* atom_getsymbolarg(int offset, long argc, t_atom *argv)
{
    return atom_getsym(argv+offset);
}

t_atom_float atom_getfloatarg(int offset, long argc, t_atom *argv)
{
    return atom_getfloat(argv+offset);
}

bool atom_isNumber(t_atom *argv)
{
    long type = atom_gettype(argv);
    return (type == A_FLOAT || type == A_LONG);
}

t_atom_float atom_getNumber(t_atom *a)
{
    t_atom_float res;
//    t_atom *a = argv+offset;
    switch (atom_gettype(a)) {
        case A_FLOAT:
            res = atom_getfloat(a);
            break;
        case A_LONG:
            res = atom_getlong(a);
            break;
        default:
            res = 0.0;
    }
    
    return res;
}


#define SETFLOAT(address, val) atom_setfloat(address, val)
#define SETSYMBOL(address, val) atom_setsym(address, val)


