

#include "DriverJeuLaser.h"
#include "ServiceJeuLaser.h"
#include "DFT.h"
#include "Signal_4_12.h"


extern void GestionSon_callback(void);
extern int PeriodeSonMicroSec;
extern int SortieSon; 

extern unsigned short int LeSignal[];

int output[64]; //global pour pouvoir l'observer

int main(void)
{
// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

/* Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers */
CLOCK_Configure();

/* Configuration du son (voir ServiceJeuLaser.h) 
 Insérez votre code d'initialisation des parties matérielles gérant le son ....*/	
ServJeuLASER_Son_Init(PeriodeSonMicroSec,0,GestionSon_callback); //PeriodeSonMicroSec est dans bruitverre.asm
	
	

//============================================================================	
	
for (int k = 0; k < 64; k++){
		output[k] = dft(LeSignal, k);
}

	
while	(1)
	{
		
	}
	
	
	
	
}


