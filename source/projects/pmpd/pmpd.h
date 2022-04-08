/*
 *  pmpd.h
 *  
 */


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
