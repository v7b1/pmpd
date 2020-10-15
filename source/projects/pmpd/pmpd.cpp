/*
 --------------------------  pmpd  ----------------------------------------
 
 
 pmpd = physical modeling for pure data
 Written by Cyrille Henry (ch@chnry.net)
 with help from Nicolas Mongermont
 
 Get sources on pd svn on sourceforge.
 
 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 Based on PureData by Miller Puckette and others.
 
 
 ----------------------------------------------------------------------------
 */

// porting to max8, october 2020, vb


//#include "c74_msp.h"
//#include "math.h"
//



#include "pmpd.h"


using namespace c74::max;



#include "pmpd_core.h"
#include "pmpd_set.h"
#include "pmpd_get.h"
#include "pmpd_list.h"
//#include "pmpd_tab.h"
#include "pmpd_test.h"
#include "pmpd_stat.h"
#include "pmpd_various.h"
#include "pmpd_deprecated.h"


//#include "pmpd_core.c"
//#include "pmpd_set.c"
//#include "pmpd_get.c"
//#include "pmpd_list.c"
//#include "pmpd_tab.c"
//#include "pmpd_test.c"
//#include "pmpd_stat.c"
//#include "pmpd_various.c"
//#include "pmpd_deprecated.c"




//static t_class *pmpd_class;


static void pmpd_free(t_pmpd *x)
{

}

//void post(const char* s)
//{
//    //object_post((t_object*)x, s);
//    object_post(NULL, s);
//}


//void link_notify(t_pmpd *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
//{
////    object_post((t_object *)x, "link_notify: %s", msg->s_name);
//    if (msg == ps_pmpd_sendmessage) { // pmpd.rr is calling with a message from 'pmpd.s'
//        t_atomarray *aa = (t_atomarray *)data;
//
//        long ac;
//        t_atom *av;
//        atomarray_getatoms(aa, &ac, &av);
//
////        object_post(NULL, "ac: %ld", ac);
//        if (atom_gettype(av) == A_SYM) {
//            t_symbol *arg = atom_getsym(av);
////            object_post(NULL, "arg: %s", arg->s_name);
//
//            object_method_typed((t_object *)x, arg, ac-1, av+1, NULL);
//        }
//    }
//    else if (msg == ps_pmpd_bang) {
//        pmpd_bang(x); // call it directly, we know it exists!
////        object_method((t_object *)x, ps_pmpd_bang);
//    }
//    else if (msg == gensym("free")) {
//        // pmpd.rr is disappearing, no more servers
//        // but we remain subscribed, so there's nothing to do here
//        // if a new master appears, we will be called with 'subscribe_attach'
//        // and automatically be attached.
//        object_post(NULL, "pmpd.rr free!");
//    }
//}


void pmpd_assist(t_pmpd *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"..."); break;
                
        }
    }
    else {
        switch(a) {
            case 0: sprintf (s,"..."); break;

        }
        
    }
}




void ext_main(void* r)
{

    pmpd_class = class_new("pmpd",
                             (method)pmpd_new,
                             (method)pmpd_free,
                             sizeof(t_pmpd),
                             0L, A_GIMME, 0);
    
    /*
     pmpd_core
     --
     Basic functions for creation of the structure
     */
    class_addmethod(pmpd_class, (method)pmpd_bang, "bang", 0);
    class_addmethod(pmpd_class, (method)pmpd_reset, "reset", 0);
    class_addmethod(pmpd_class, (method)pmpd_mass, "mass", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_link, "link", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_tabLink, "tabLink", A_GIMME, 0);

    // ??
    //class_addmethod(pmpd_class, (method)pmpd_float, "float", A_FLOAT, 0);

    /*
     pmpd_set
     --
     Functions to modify the internal state of the pmpd object
     */
    class_addmethod(pmpd_class, (method)pmpd_setK, "setK", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setD, "setD", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setD2, "setDEnv", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setL, "setL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setLCurrent, "setLCurrent", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setLDTab, "setLDTab", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setLinkId, "setLinkId", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setMassId, "setMassId", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setFixed, "setFixed", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setMobile, "setMobile", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setSpeedX, "setSpeed", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setSpeedX, "setSpeedX", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setForceX, "setForce", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setForceX, "setForceX", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_posX, "pos", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_posX, "posX", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_posX, "setPos", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_posX, "setPosX", A_GIMME, 0);

    
    class_addmethod(pmpd_class, (method)pmpd_overdamp, "setOverdamp", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setEnd1, "setEnd1", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setEnd2, "setEnd2", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_setEnd, "setEnd", A_GIMME, 0);
    
    /*
     pmpd_get
     --
     Basic functions to output internal state of the object
     Output syntax : 1 line by element (mass/link)
     */
    class_addmethod(pmpd_class, (method)pmpd_get,             "get", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massPos,           "massPos", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massSpeed,        "massSpeed", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massForce,        "massForce", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPos,         "linkPos", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkEnd,            "linkEnd", A_GIMME, 0);
    
    /*
     pmpd_list
     --
     Fucntions to output internal state of the object in lists
     Output Syntax : 1 list with all elements
     */
    
    class_addmethod(pmpd_class, (method)pmpd_massPosXL,                  "massPosL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massSpeedXL,               "massSpeedL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massForceXL,               "massForceL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massPosXL,                 "massPosXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massSpeedXL,              "massSpeedXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massForceXL,              "massForceXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosXL,               "linkPosL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthXL,            "linkLengthL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosSpeedXL,          "linkPosSpeedL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthSpeedXL,       "linkLengthSpeedL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosXL,               "linkPosXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthXL,            "linkLengthXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosSpeedXL,          "linkPosSpeedXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthSpeedXL,       "linkLengthSpeedXL", A_GIMME, 0);
    
    /*
     pmpd_tab
     --
     Functions to copy the internal state of the object in arrays
     Output Syntax : none
     */
//    class_addmethod(pmpd_class, (method)pmpd_massesPosT,      "massesPosT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsT,   "massesSpeedsT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesForcesT,   "massesForcesT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesPosT,      "massesPosXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsT,   "massesSpeedsXT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesForcesT,   "massesForcesXT",A_GIMME, 0);
    
//    class_addmethod(pmpd_class, (method)pmpd_massesPosT,      "massPosT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsT,   "massSpeedT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesForcesT,   "massForceT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesPosT,      "massPosXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsT,   "massSpeedXT",A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_massesForcesT,   "massForceXT",A_GIMME, 0);
    
//    class_addmethod(pmpd_class, (method)pmpd_linksPosT,               "linksPosT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthT,           "linksLengthT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedT,        "linksPosSpeedT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedT,    "linksLengthSpeedT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosT,               "linksPosXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthT,           "linksLengthXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedT,        "linksPosSpeedXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedT,    "linksLengthSpeedXT", A_GIMME, 0);
//
//    class_addmethod(pmpd_class, (method)pmpd_linksPosT,               "linkPosT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthT,           "linkLengthT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedT,        "linkPosSpeedT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedT,    "linkLengthSpeedT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosT,               "linkPosXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthT,           "linkLengthXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedT,        "linkPosSpeedXT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedT,    "linkLengthSpeedXT", A_GIMME, 0);
//
//    class_addmethod(pmpd_class, (method)pmpd_linkEndT,               "linksEndT",   A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linkEnd1T,              "linkEnd1T",  A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linkEnd2T,              "linkEnd2T",  A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linkEndT,               "linkEndXT",  A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linkEnd1T,              "linkEnd1XT", A_GIMME, 0);
//    class_addmethod(pmpd_class, (method)pmpd_linkEnd2T,              "linkEnd2XT", A_GIMME, 0);
    
    /*
     pmpd_test
     --
     Functions to list all elements that fit specific conditions
     Output syntax : depends of the function
     */
    class_addmethod(pmpd_class, (method)pmpd_testMass,                   "testMass", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_testLink,                   "testLink", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_testMassT,               "testMassT", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_testLinkT,               "testLinkT", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_testMassL,               "testMassL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_testLinkL,               "testLinkL", A_GIMME, 0);
    
    /*
     pmpd_stat
     --
     Functions to get global stats
     */
    class_addmethod(pmpd_class, (method)pmpd_massPosMean,               "massPosMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massPosStd,                "massPosStd",A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massForceMean,            "massForceMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massForceStd,             "massForceStd",A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massSpeedMean,            "massSpeedMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massSpeedStd,             "massSpeedStd",A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosMean,                "linkPosMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthMean,             "linkLengthMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosSpeedMean,           "linkPosSpeedMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthSpeedMean,        "linkLengthSpeedMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosStd,                 "linkPosStd", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthStd,              "linkLengthStd", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkPosSpeedStd,            "linkPosSpeedStd", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linkLengthSpeedStd,        "linkLengthSpeedStd", A_GIMME, 0);
    
    
    /*
     pmpd_various
     --
     Others
     */
    class_addmethod(pmpd_class, (method)pmpd_infosL,          "infosL", 0);
    class_addmethod(pmpd_class, (method)pmpd_infosL,          "print", 0);
    class_addmethod(pmpd_class, (method)pmpd_forceX,          "force", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_forceX,          "forceX", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_minX,            "Xmin", A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_minX,            "min", A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_minX,            "minX", A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_maxX,            "Xmax", A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_maxX,            "max", A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_maxX,            "maxX", A_DEFFLOAT, 0);
    
    class_addmethod(pmpd_class, (method)pmpd_addPosX,         "addPos", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_addPosX,         "addPosX", A_GIMME, 0);
    
    class_addmethod(pmpd_class, (method)pmpd_grabMass,        "grabMass", A_DEFFLOAT, A_DEFFLOAT, 0);
    class_addmethod(pmpd_class, (method)pmpd_closestMass,     "closestMass", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massDistances,    "massDistance", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_forcesXT,        "forceXT", A_GIMME, 0);
    
    /*
     pmpd_deprecated
     --
     Functions in which the output selector has been modified
     It is now the same as the input slector : all singular
     */
    class_addmethod(pmpd_class, (method)pmpd_massesPosL,      "massesPosL", 0);
    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsL,   "massesSpeedsL", 0);
    class_addmethod(pmpd_class, (method)pmpd_massesForcesL,   "massesForcesL", 0);
    class_addmethod(pmpd_class, (method)pmpd_massesPosL,      "massesPosXL", 0);
    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsL,   "massesSpeedsXL", 0);
    class_addmethod(pmpd_class, (method)pmpd_massesForcesL,   "massesForcesXL", 0);

    class_addmethod(pmpd_class, (method)pmpd_linksPosL,               "linksPosL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksLengthL,           "linksLengthL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedL,        "linksPosSpeedL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedL,    "linksLengthSpeedL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksPosL,               "linksPosXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksLengthL,           "linksLengthXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksPosSpeedL,        "linksPosSpeedXL", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_linksLengthSpeedL,    "linksLengthSpeedXL", A_GIMME, 0);

    class_addmethod(pmpd_class, (method)pmpd_massesPosMean,   "massesPosMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massesPosStd,    "massesPosStd",A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massesForcesMean,"massesForcesMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massesForcesStd, "massesForcesStd",A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsMean,"massesSpeedsMean", A_GIMME, 0);
    class_addmethod(pmpd_class, (method)pmpd_massesSpeedsStd, "massesSpeedsStd",A_GIMME, 0);

    
    // TODO: do we need notify?
//    class_addmethod(pmpd_class, (method)link_notify, "notify", A_CANT, 0);
    
    class_register(CLASS_BOX, pmpd_class);
    
    
    return 0;
    
}

