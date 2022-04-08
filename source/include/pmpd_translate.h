//
//  pmpd_translate.h
//  pmpd
//
//  Created by vb on 08.04.22.
//

// vb
// convenience functions to translate from pd to max atom-stuff

#ifndef pmpd_translate_h
#define pmpd_translate_h


using namespace c74::max;

#define SETFLOAT(address, val) atom_setfloat(address, val)
#define SETSYMBOL(address, val) atom_setsym(address, val)
#define t_floatarg double
#define t_float double


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

#endif /* pmpd_translate_h */
