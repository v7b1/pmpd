#include "c74_max.h"
#include "pmpd_translate.h"
//#include "math.h"

//#define max(a,b) ( ((a) > (b)) ? (a) : (b) )
//#define min(a,b) ( ((a) < (b)) ? (a) : (b) )

using namespace c74::max;


static t_class *mass2D_class;

struct t_mass2D {
  t_object  x_obj;
  double posX_old_1, posX_old_2, posY_old_1, posY_old_2, Xinit, Yinit;
  double forceX, forceY, VX, VY, dX, dY, onoff;
  double mass2D, seuil, damp;
  double minX, maxX, minY, maxY;
  t_atom  pos_new[2], vitesse[3], force[3];
  void *position2D_out, *vitesse_out, *force_out;
  t_symbol *x_sym; // receive
  unsigned int x_state; // random
  double x_f; // random
};

static int makeseed2D(void)
{
    static unsigned int random_nextseed = 1489853723;
    random_nextseed = random_nextseed * 435898247 + 938284287;
    return (random_nextseed & 0x7fffffff);
}

static float random_bang2D(t_mass2D *x)
{
    int nval;
    int range = 2000000;
	float rnd;
	unsigned int randval = x->x_state;
	x->x_state = randval = randval * 472940017 + 832416023;
    nval = ((double)range) * ((double)randval)
    	* (1./4294967296.);
    if (nval >= range) nval = range-1;

	rnd=nval;

	rnd-=1000000;
	rnd=rnd/1000000.;	//pour mettre entre -1 et 1;
    return (rnd);
}

void mass2D_seuil(t_mass2D *x, t_floatarg f1)
{
  x->seuil = f1;
}

void mass2D_on(t_mass2D *x)
{
  x->onoff = 1;
}

void mass2D_off(t_mass2D *x)
{
  x->onoff = 0;
}

void mass2D_minX(t_mass2D *x, t_floatarg f1)
{
  x->minX = f1;
}

void mass2D_maxX(t_mass2D *x, t_floatarg f1)
{
  x->maxX = f1;
}

void mass2D_minY(t_mass2D *x, t_floatarg f1)
{
  x->minY = f1;
}

void mass2D_maxY(t_mass2D *x, t_floatarg f1)
{
  x->maxY = f1;
}

void mass2D_force(t_mass2D *x, t_floatarg f1, t_floatarg f2)
{
  x->forceX = x->forceX+f1;
  x->forceY = x->forceY+f2;
}

void mass2D_displace(t_mass2D *x, t_floatarg f1, t_floatarg f2)
{
  x->dX += f1;
  x->dY += f2;
}

void mass2D_damp(t_mass2D *x, t_floatarg f1)
{
  x->damp = f1;
}

void mass2D_dX(t_mass2D *x, t_floatarg f1)
{
  x->dX += f1;
}

void mass2D_dY(t_mass2D *x, t_floatarg f1)
{
  x->dY += f1;
}

void mass2D_bang(t_mass2D *x)
{
  double posX_new, posY_new, vX=1, vY=1;
 if (x->onoff != 0)
 {

  if (x->seuil > 0)
  {
	if (x->posY_old_1 == x->minY) // si on est en dehors de la structure -> frottement sec sur les bords
	{
		if (fabs(x->forceX)<=(x->seuil * -(x->forceY)))
		vX = 0;		// on est a l'interieur du cone de frotement,  
	}

	if (x->posY_old_1 == x->maxY) // si on est en dehors de la structure -> frottement sec sur les bords
	{
		if (fabs(x->forceX)<=(x->seuil * (x->forceY)))
		vX = 0;		// on est a l'interieur du cone de frotement,  
	}

	if (x->posX_old_1 == x->minX) // si on est en dehors de la structure -> frottement sec sur les bords
	{
	    if (fabs(x->forceX)<=(x->seuil * -(x->forceY)))
		vY = 0;		// on est a l'interieur du cone de frotement,  
	}

	if (x->posX_old_1 == x->maxX) // si on est en dehors de la structure -> frottement sec sur les bords
	{
		if (fabs(x->forceX)<=(x->seuil * (x->forceY)))
		vY = 0;		// on est a l'interieur du cone de frotement,  
	}
  }

 	x->forceX += x->damp * ((x->posX_old_2)-(x->posX_old_1));
	x->forceY += x->damp * ((x->posY_old_2)-(x->posY_old_1)); // damping

  if (x->mass2D != 0)
  {
	  posX_new = x->forceX/x->mass2D + 2*x->posX_old_1 - x->posX_old_2;
  	  posY_new = x->forceY/x->mass2D + 2*x->posY_old_1 - x->posY_old_2;
  }
  else 
  {
	posX_new = x->posX_old_1;
	posY_new = x->posY_old_1;
  }

  if (vX==0)
    posX_new = x->posX_old_1;			// on n'a pas de mv qd on est a l'interieur du cone de frotement
  if (vY==0)
    posY_new = x->posY_old_1;

  posX_new = fmax(fmin(posX_new, x->maxX), x->minX);
  posY_new = fmax(fmin(posY_new, x->maxY), x->minY);

  posX_new += x->dX;
  posY_new += x->dY;

  x->posX_old_1 += x->dX;				// pour eviter l'inertie
  x->posY_old_1 += x->dY;

  SETFLOAT(&(x->pos_new[0]), posX_new );
  SETFLOAT(&(x->pos_new[1]), posY_new );
 
  x->posX_old_2 = x->posX_old_1;
  x->posX_old_1 = posX_new;

  x->posY_old_2 = x->posY_old_1;
  x->posY_old_1 = posY_new;

  SETFLOAT(&(x->force[0]), x->forceX );
  SETFLOAT(&(x->force[1]), x->forceY );
  SETFLOAT(&(x->force[2]), sqrt( (x->forceX * x->forceX) + (x->forceY * x->forceY) ));
 
//  x->forceX=0;
//  x->forceY=0;

  x->forceX = random_bang2D(x)*1e-25;
  x->forceY = random_bang2D(x)*1e-25; // avoiding denormal problem by adding low amplitude noise


  x->dX=0;
  x->dY=0;

  x->VX =  x->posX_old_1 -  x->posX_old_2;
  x->VY =  x->posY_old_1 -  x->posY_old_2;

  SETFLOAT(&(x->vitesse[0]), x->VX );
  SETFLOAT(&(x->vitesse[1]), x->VY );
  SETFLOAT(&(x->vitesse[2]), sqrt( (x->VX * x->VX) + (x->VY * x->VY) ));
 
//  outlet_anything(x->vitesse_out, gensym("velocity2D"), 3, x->vitesse);
//  outlet_anything(x->force_out, gensym("force2D"), 3, x->force);
//  outlet_anything(x->position2D_out, gensym("position2D"), 2, x->pos_new);
     
     outlet_anything(x->vitesse_out, ps_velocity2D, 3, x->vitesse);
     outlet_anything(x->force_out, ps_force2D, 3, x->force);
     outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
 }
}

void mass2D_reset(t_mass2D *x)
{
  x->posX_old_2 = x->Xinit;
  x->posX_old_1 = x->Xinit;
  x->forceX=0;

  x->posY_old_2 = x->Yinit;
  x->posY_old_1 = x->Yinit;
  x->forceY=0;

  x->VX = 0;
  x->VY = 0;

  x->dX=0;
  x->dY=0;

  x->seuil=0;

  x->onoff = 1;

  SETFLOAT(&(x->pos_new[0]), x->Xinit );
  SETFLOAT(&(x->pos_new[1]), x->Yinit );

  SETFLOAT(&(x->force[0]), 0 );
  SETFLOAT(&(x->force[1]), 0 );
  SETFLOAT(&(x->force[2]), 0 );
 
  SETFLOAT(&(x->vitesse[0]), 0 );
  SETFLOAT(&(x->vitesse[1]), 0 );
  SETFLOAT(&(x->vitesse[2]), 0 );

  outlet_anything(x->vitesse_out, ps_velocity2D, 3, x->vitesse);
  outlet_anything(x->force_out, ps_force2D, 3, x->force);
  outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
}

void mass2D_resetf(t_mass2D *x)
{
  x->dX=0;
  x->dY=0;

  x->forceX=0;
  x->forceY=0;
}

void mass2D_setXY(t_mass2D *x, double posX, double posY)
{
  x->posX_old_2 = posX;
  x->posX_old_1 = posX;
  x->forceX=0;

  x->posY_old_2 = posY;
  x->posY_old_1 = posY;
  x->forceY=0;

//  SETFLOAT(&(x->pos_new[0]), posX );
    atom_setfloat(x->pos_new, posX);
//  SETFLOAT(&(x->pos_new[1]), posY );
    atom_setfloat(x->pos_new+1, posY);

  outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
}

void mass2D_setX(t_mass2D *x, double posX)
{
  x->posX_old_2 = posX;
  x->posX_old_1 = posX;
  x->forceX=0;

//  SETFLOAT(&(x->pos_new[0]), posX );
    atom_setfloat(x->pos_new, posX);

  outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
}

void mass2D_setY(t_mass2D *x, double posY)
{
  x->posY_old_2 = posY;
  x->posY_old_1 = posY;
  x->forceY=0;
  
//  SETFLOAT(&(x->pos_new[1]), posY );
    atom_setfloat(x->pos_new+1, posY);

  outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
}

void mass2D_loadbang(t_mass2D *x)
{
  outlet_anything(x->position2D_out, ps_position2D, 2, x->pos_new);
}


void mass2D_set_mass2D(t_mass2D *x, double mass)
{
  x->mass2D=mass;
}

void mass2D_inter_ambient(t_mass2D *x, t_symbol *s, int argc, t_atom *argv)
{
	if (argc == 12) 
		// 0 : FX
		// 1 : FY
		// 2 : RndX
		// 3 : RndY
		// 4 : D2
		// 5 : rien
		// 6 : Xmin
		// 7 : Xmax
		// 8 : Ymin
		// 9 : Ymax
		// 10 : dX
		// 11 : dY
	{
		if (x->posX_old_1 > atom_getfloatarg(6, argc, argv))
		{
			if (x->posX_old_1 < atom_getfloatarg(7, argc, argv))
			{
				if (x->posY_old_1 > atom_getfloatarg(8, argc, argv))
				{
					if (x->posY_old_1 < atom_getfloatarg(9, argc, argv))
					{
						x->forceX += atom_getfloatarg(0, argc, argv);
						x->forceY += atom_getfloatarg(1, argc, argv); // constant

						x->forceX += random_bang2D(x)*atom_getfloatarg(2, argc, argv);
						x->forceY += random_bang2D(x)*atom_getfloatarg(3, argc, argv); // random
	
						x->forceX += atom_getfloatarg(4, argc, argv) * ((x->posX_old_2)-(x->posX_old_1));
						x->forceY += atom_getfloatarg(4, argc, argv) * ((x->posY_old_2)-(x->posY_old_1)); // damping

						x->dX += atom_getfloatarg(10, argc, argv);
						x->dY += atom_getfloatarg(11, argc, argv); // constant
					}
				}
			}
		}
	}
	else
	{
		error("bad ambient interraction message");
	}
}

void mass2D_inter_seg(t_mass2D *x, t_symbol *s, int argc, t_atom *argv)
{
double a1, b1, c1, a2, b2, c2, a3, b3, c3, tmp;
double posx1, posx2, posy1, posy2;
double profondeur;

	if (argc == 12) 
		// 0 : posx1
		// 1 : posy1
		// 2 : posx2
		// 3 : posy2
		// 4 : profondeur max
		// 5 : F CT Normal
		// 6 : F CT Tengentiel
		// 7 : K normal
		// 8 : Damp2 normal 
		// 9 : Damp2 tan
		// 10 : displacement Normal
		// 11 : d Tan

	{
		posx1 = atom_getfloatarg(0, argc, argv);
		posy1 = atom_getfloatarg(1, argc, argv);
		posx2 = atom_getfloatarg(2, argc, argv);
		posy2 = atom_getfloatarg(3, argc, argv);

		b1 = posx2 - posx1;
		a1 = -posy2 + posy1;

		if (!((a1==0) & (b1==0)))
		{

		tmp = sqrt((a1*a1)+(b1*b1));			// = longueur du vecteur pour renormalisation
		if (tmp !=0)
		{
			a1 = a1/tmp;
			b1 = b1/tmp;
		}
		else
		{
			a1 = 0;
			b1 = 0;
		}

		c1 = a1*posx1+b1*posy1;

		profondeur = ( (a1 * x->posX_old_1)  + (b1 *   x->posY_old_1) )  - c1;

		if ( ( profondeur  < 0) & (profondeur > - atom_getfloatarg(4, argc, argv)) )
			{
			a2 = b1;
			b2 = -a1;
			c2 = a2*posx1+b2*posy1;
				if (( (a2 * x->posX_old_1)  + (b2 *   x->posY_old_1) )  > c2)
				{
				a3 = a2;
				b3 = b2;
				c3 = a3*posx2+b3*posy2;
					if (( (a3 * x->posX_old_1)  + (b3 *   x->posY_old_1) )  < c3)
					{
						 tmp = atom_getfloatarg(5, argc, argv); // force ct normal
						 x->forceX += tmp * a1;
						 x->forceY += tmp * b1;

						 tmp = atom_getfloatarg(6, argc, argv); // force ct normal
						 x->forceX -= tmp * b1;
						 x->forceY -= tmp * -a1;

						 tmp = atom_getfloatarg(7, argc, argv); // force K normal
						 tmp *= profondeur;
						 x->forceX -= tmp * a1;
						 x->forceY -= tmp * b1;

						 tmp = atom_getfloatarg(8, argc, argv); // damping2 normal
						 tmp *= ( x->VX * a1 + x->VY * b1 );
						 x->forceX -= tmp * a1 ;
						 x->forceY -= tmp * b1 ;

						 tmp = atom_getfloatarg(9, argc, argv); // damping2 tangentiel
						 tmp *= ( x->VX * b1 - x->VY * a1 );
						 x->forceX -= tmp * b1 ;
						 x->forceY -= tmp * -a1 ;

						 tmp = atom_getfloatarg(10, argc, argv); // displacement normal
						 x->dX += tmp * a1 ;
						 x->dY += tmp * b1 ;

						 tmp = atom_getfloatarg(11, argc, argv); // displacement tengentiel
						 x->dX -= tmp * b1 ;
						 x->dY -= tmp * -a1 ;
					}
				}
			}
		}
	}
	else
	{
		error("bad interact_2D_segment message");
	}
}

void mass2D_inter_line(t_mass2D *x, t_symbol *s, int argc, t_atom *argv)
{
double a1, b1, c1, tmp;
double posx1, posx2, posy1, posy2;
double profondeur;

	if (argc == 12) 
		// 0 : posx1
		// 1 : posy1
		// 2 : posx2
		// 3 : posy2
		// 4 : profondeur max
		// 5 : F CT Normal 
		// 6 : F CT Tengentiel
		// 7 : K normal
		// 8 : Damp2 normal 
		// 9 : Damp2 tan
		// 10 : d normal
		// 11 : d tengential
	{
		posx1 = atom_getfloatarg(0, argc, argv);
		posy1 = atom_getfloatarg(1, argc, argv);
		posx2 = atom_getfloatarg(2, argc, argv);
		posy2 = atom_getfloatarg(3, argc, argv);

		b1 = posx2 - posx1;
		a1 = -posy2 + posy1;

		if (!((a1==0) & (b1==0)))
		{
		tmp = sqrt((a1*a1)+(b1*b1));			// = longueur du vecteur pour renormalisation
		a1 = a1/tmp;							// composante X de la normal
		b1 = b1/tmp;							// composante Y de la normal
		c1 = a1*posx1+b1*posy1;					// 

		profondeur = ( (a1 * x->posX_old_1)  + (b1 *   x->posY_old_1) )  - c1;
		if ( ( profondeur  < 0) & (profondeur >  - atom_getfloatarg(4, argc, argv)) )
			{
				 tmp = atom_getfloatarg(5, argc, argv); // force ct normal
				 x->forceX += tmp * a1;
				 x->forceY += tmp * b1;

				 tmp = atom_getfloatarg(6, argc, argv); // force ct tengentiel
				 x->forceX -= tmp * b1;
				 x->forceY -= tmp * -a1;

				 tmp = atom_getfloatarg(7, argc, argv); // force K normal
				 tmp *= profondeur ;
				 x->forceX -= tmp * a1;
				 x->forceY -= tmp * b1;

				 tmp = atom_getfloatarg(8, argc, argv); // damping2 normal
				 tmp *= ( x->VX * a1 + x->VY * b1 ) ;
				 x->forceX -= tmp * a1 ;
				 x->forceY -= tmp * b1 ;

				 tmp = atom_getfloatarg(9, argc, argv); // damping2 tangentiel
				 tmp *= ( x->VX * b1 - x->VY * a1 );
				 x->forceX -= tmp * b1 ;
				 x->forceY -= tmp * -a1 ;

				 tmp = atom_getfloatarg(10, argc, argv); // d normal
				 x->dX += tmp * a1;
				 x->dY += tmp * b1;

				 tmp = atom_getfloatarg(11, argc, argv); // d tangentiel
				 x->dX -= tmp * b1;
				 x->dY -= tmp * -a1;
			}
		}
	}
	else
	{
		error("bad interact_2D_line message");
	}
}

void mass2D_inter_circle(t_mass2D *x, t_symbol *s, int argc, t_atom *argv)
{
double posx1, posy1, Nx, Ny, distance, Dmax, tmp;
double deltaX_old, deltaY_old, distance_old ;
double fnx=0;
double ftx=0;

	if (argc == 20) 
		// 0 : Xcentre
		// 1 : Ycendre
		// 2 : Rmin
		// 3 : Rmax
		// 4 : F normal
		// 5 : F tangentiel
		// 6 : K normal
		// 7 : K tengentiel
		// 8 : F normal proportionel a 1/R
		// 9 : F tengentiel proportionel a 1/R
		// 10 : Damp2 normal 
		// 11 : Damp2 tan
		// 12 : deplacement N proportionel a 1/R
		// 13 : deplacement tengentiel proportionel a 1/R
		// 14 : position ancienne de l'interacteur en X
		// 15 : position abcienne de l'interacteur en Y
		// 16 : damping de liaison
		// 17 : F normal proportionel a 1/R*R
		// 18 : normal displacement
		// 19 : tengential displacement

	{
		posx1 = atom_getfloatarg(0, argc, argv);
		posy1 = atom_getfloatarg(1, argc, argv);
		Nx = (x->posX_old_1)-posx1;					// vecteur deplacement X
		Ny = (x->posY_old_1)-posy1;					// vecteur deplacement Y

		distance = sqrt((Nx * Nx)+(Ny * Ny));		// distance entre le centre de l'interaction, et le pts

		Dmax= atom_getfloatarg(3, argc, argv);		// distance max de l'interaction
		if ( (distance > atom_getfloatarg(2, argc, argv)) & (distance < Dmax) )
		{
			Nx = Nx/distance;							// composante X de la normal (normalisé)
			Ny = Ny/distance;							// composante Y de la normal.

			tmp = atom_getfloatarg(4, argc, argv); // force constante normal
//			x->forceX += tmp * Nx;
//			x->forceY += tmp * Ny;
			fnx +=tmp;
//			fny +=tmp;

			tmp = atom_getfloatarg(5, argc, argv); // force constante tengentiel
//			x->forceX += tmp * Ny;
//			x->forceY += tmp * -Nx;
			ftx +=tmp;
//			fty +=tmp;

			tmp = atom_getfloatarg(6, argc, argv); // force variable (K) normal
			tmp *= ( Dmax-distance );
//			x->forceX += tmp * Nx ;
//			x->forceY += tmp * Ny ;
			fnx +=tmp;
//			fny +=tmp;

			tmp = atom_getfloatarg(7, argc, argv); // force variable (K) tengentiel
			tmp  *= ( Dmax-distance );
//			x->forceX += tmp * Ny ;
//			x->forceY += tmp * -Nx ;
			ftx +=tmp;
//			fty +=tmp;

		    tmp = atom_getfloatarg(8, argc, argv); // force normal proportionel a 1/r
			if (distance != 0)
			{
				tmp /= distance;
//				x->forceX += tmp * Nx ;
//				x->forceY += tmp * Ny ;
				fnx +=tmp;
//				fny +=tmp;
			}

		    tmp = atom_getfloatarg(9, argc, argv); // force tengentiel proportionel a 1/r
			if (distance != 0)
			{
				tmp /= distance;
//				x->forceX -= tmp * Ny ;
//				x->forceY -= tmp * -Nx ;
				ftx -=tmp;
//				fty -=tmp;
			}

			tmp = atom_getfloatarg(10, argc, argv); // damping2 normal
			tmp *= ( x->VX * Nx + x->VY * Ny );
//			x->forceX -= tmp * Nx ;
//			x->forceY -= tmp * Ny ;
			fnx -=tmp;
//			fny -=tmp;

			tmp = atom_getfloatarg(11, argc, argv); // damping2 tangentiel
			tmp *= ( x->VX * Ny - x->VY * Nx );
//			x->forceX -= tmp * Ny ;
//			x->forceY -= tmp * -Ny ;
			ftx -=tmp;
//			fty -=tmp;

			tmp = atom_getfloatarg(12, argc, argv); // d normal
			if (distance != 0)
			{
			tmp /= distance;
			x->dX += tmp * Nx ;
			x->dY += tmp * Ny ;
			}

			tmp = atom_getfloatarg(13, argc, argv); // d tangentiel
			if (distance != 0)
			{
			tmp /= distance;

			x->dX -= tmp * Ny ;
			x->dY -= tmp * -Nx ;
			}

			tmp = atom_getfloatarg(16, argc, argv); // damping de liaison
			if (tmp!= 0)
			{
				deltaX_old = atom_getfloatarg(14, argc, argv) - x->posX_old_2;
				deltaY_old = atom_getfloatarg(15, argc, argv) - x->posY_old_2;
				distance_old = sqrt( (deltaX_old * deltaX_old) + (deltaY_old * deltaY_old));

//				x->forceX -= Nx * tmp * (distance - distance_old);
//				x->forceY -= Ny * tmp * (distance - distance_old);	

				tmp *= (distance - distance_old);
				fnx -=tmp;
//				fny -=tmp;
			}

			tmp = atom_getfloatarg(17, argc, argv); // force normal proportionel a 1/r2
			if (distance != 0)
			{
			tmp /= (distance*distance);
//		    x->forceX -= tmp * Nx;
//		    x->forceY -= tmp * Ny;
			fnx +=tmp;
//			fny +=tmp;
			}
			
			tmp = atom_getfloatarg(18, argc, argv); // deplacement constante normal
			x->dX += tmp * Nx;
			x->dY += tmp * Ny;

			tmp = atom_getfloatarg(19, argc, argv); // deplacement constante tengentiel
			x->dX -= tmp * Ny;
			x->dY -= tmp * -Nx;

		    x->forceX += fnx * Nx + ftx * Ny;  // optimisation, but does not change anything...
		    x->forceY += fnx * Ny - ftx * Nx;
		}
	}
	else
	{
		error("bad interact_2D_circle message");
	}
}

void mass_notify(t_mass2D *x, t_symbol *s, t_symbol *msg, void *sender, void *data)
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
        mass2D_bang(x); // call it directly, we know it exists!
    }

}

void mass2D_assist(t_mass2D *x, void *b, long m, long a, char *s) {
    if (m==ASSIST_INLET) {
        switch(a) {
            case 0: sprintf (s,"(int/float) adds force to this mass, (bang) compute and output new position"); break;
                
        }
    }
    else {
        switch(a) {
            case 0: sprintf (s,"(list) x/y position of the mass"); break;
            case 1: sprintf (s,"(list) x/y and total force applied to the mass"); break;
            case 2: sprintf (s,"(list) x/y and total velocity of the mass"); break;
        }
        
    }
}



void *mass2D_new(t_symbol *s, int argc, t_atom *argv)
{
 
  t_mass2D *x = (t_mass2D *)object_alloc(mass2D_class);
    
    if (x) {
        long offset = attr_args_offset(argc, argv);

        x->x_state = makeseed2D();
          
        // create outlets
        x->vitesse_out = outlet_new((t_object *)x, NULL);
        x->force_out = outlet_new((t_object *)x, NULL);
        x->position2D_out = outlet_new((t_object *)x, NULL);
          

        x->forceX=0;
        x->forceY=0;
        x->onoff = 1;
        x->VX = 0;
        x->VY = 0;

        x->dX=0;
        x->dY=0;
        x->mass2D = 1;
        x->Xinit = x->Yinit = 0;
        
        x->minX = x->minY = -100000;
        x->maxX = x->maxY = 100000;
        x->seuil = x->damp = 0;
        
        x->x_sym = NULL;
        

        if (offset > 0) {
            // process arguments
            
            if (atom_gettype(argv) == A_SYM)
            {
                x->x_sym = atom_getsym(argv);
                if (x->x_sym != ps_nothing) {
                    object_subscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
                } else {
                    x->x_sym = NULL;
                }
                
                if (offset > 1) {
                    x->mass2D = atom_getfloat(argv+1);
                }
                
                if (offset > 2) {
                    x->Xinit = atom_getfloat(argv+2);
                }
                if (offset > 3) {
                    x->Yinit = atom_getfloat(argv+3);
                }
            }
            
            else {      // no receive address
                x->mass2D = atom_getfloat(argv);
                
                if (offset > 1) {
                    x->Xinit = atom_getfloat(argv+1);
                }
                if (offset > 2) {
                    x->Yinit = atom_getfloat(argv+2);
                }
            }
            
        }
        
        x->posX_old_1 = x->Xinit;
        x->posX_old_2 = x->Xinit;
        SETFLOAT(&(x->pos_new[0]),  x->Xinit);
        
        x->posY_old_1 = x->Yinit;
        x->posY_old_2 = x->Yinit;
        SETFLOAT(&(x->pos_new[1]),  x->Yinit);
        
        
        attr_args_process(x, (short)argc, argv+offset);
        

//        if (argc >= 5)
//          x->minX = atom_getfloatarg(4, argc, argv);
//
//        if (argc >= 6)
//          x->maxX = atom_getfloatarg(5, argc, argv);
//
//        if (argc >= 7)
//          x->minY = atom_getfloatarg(6, argc, argv);
//
//        if (argc >= 8)
//          x->maxY = atom_getfloatarg(7, argc, argv);
//
//        if (argc >= 9)
//          x->seuil = atom_getfloatarg(8, argc, argv);
//
//        if (argc >= 10)
//          x->damp = atom_getfloatarg(9, argc, argv);
          
    }

  return (x);
}


static void mass2D_free(t_mass2D *x)
{
//    pd_unbind(&x->x_obj.ob_pd, x->x_sym);
    object_unsubscribe(ps_pmpd_rr, x->x_sym, ps_pmpd_rr, x);
}


void ext_main(void* r)
{

  mass2D_class = class_new("pmpd.mass2D",
        (method)mass2D_new,
        (method)mass2D_free, sizeof(t_mass2D),
        0, A_GIMME, 0);


    class_addmethod(mass2D_class, (method)mass2D_bang, "bang", 0L);

  class_addmethod(mass2D_class, (method)mass2D_force,  "force2D", A_DEFFLOAT, A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_displace,  "dXY", A_DEFFLOAT, A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_dX,  "dX",A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_dY,  "dY",A_DEFFLOAT, 0);

  class_addmethod(mass2D_class, (method)mass2D_inter_ambient,  "interactor_ambient_2D", A_GIMME, 0);
  class_addmethod(mass2D_class, (method)mass2D_inter_line,  "interactor_line_2D", A_GIMME, 0);
  class_addmethod(mass2D_class, (method)mass2D_inter_seg,  "interactor_segment_2D", A_GIMME, 0);
  class_addmethod(mass2D_class, (method)mass2D_inter_circle,  "interactor_circle_2D", A_GIMME, 0);

  class_addmethod(mass2D_class, (method)mass2D_seuil,  "setT", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_set_mass2D,  "setM", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_setX,  "setX", A_DEFFLOAT, 0);
    class_addmethod(mass2D_class, (method)mass2D_setY,  "setY", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_minX,  "setXmin", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_minY,  "setYmin", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_maxX,  "setXmax", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_maxY,  "setYmax", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_setXY,  "setXY", A_DEFFLOAT, A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_damp,  "setD", A_DEFFLOAT, 0);
  class_addmethod(mass2D_class, (method)mass2D_on,  "on", 0);
  class_addmethod(mass2D_class, (method)mass2D_off,  "off", 0);
  class_addmethod(mass2D_class, (method)mass2D_reset,  "reset", 0);
  class_addmethod(mass2D_class, (method)mass2D_resetf,  "resetF", 0);
  class_addmethod(mass2D_class, (method)mass2D_loadbang,  "loadbang", 0);
    class_addmethod(mass2D_class, (method)mass_notify, "notify", A_CANT, 0);
    class_addmethod(mass2D_class, (method)mass2D_assist, "assist", A_CANT,0);
    
    class_register(CLASS_BOX, mass2D_class);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "minX", 0, t_mass2D, minX);
    CLASS_ATTR_SAVE(mass2D_class, "minX", 0);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "minY", 0, t_mass2D, minY);
    CLASS_ATTR_SAVE(mass2D_class, "minY", 0);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "maxX", 0, t_mass2D, maxX);
    CLASS_ATTR_SAVE(mass2D_class, "maxX", 0);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "maxY", 0, t_mass2D, maxY);
    CLASS_ATTR_SAVE(mass2D_class, "maxY", 0);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "seuil", 0, t_mass2D, seuil);
    CLASS_ATTR_SAVE(mass2D_class, "seuil", 0);
    
    CLASS_ATTR_DOUBLE(mass2D_class, "damp", 0, t_mass2D, damp);
    CLASS_ATTR_SAVE(mass2D_class, "damp", 0);
    

    ps_nothing = gensym("");
    ps_pmpd_rr = gensym("pmpd.rr");
    ps_pmpd_bang = gensym("bang");
    ps_pmpd_sendmessage = gensym("sendmessage");
    
    
    
    ps_velocity2D = gensym("velocity2D");
    ps_force2D = gensym("force2D");
    ps_position2D = gensym("position2D");

}
