#include <stdio.h>
#include "DFT.h"
#include "CosSin_Fract_1_15.h"




// Définition explicite de M_PI si elle n'est pas définie
#ifndef M
#define M 64

#endif

extern short int TabCos[];
extern short int TabSin[];


// Fonction qui calcule la DFT d'un signal d'entrée
int dft(unsigned short int * signal, int k) { //renvoie un int psq précision oké avc int et pas long
		long long real_part=0.0;
		long long imag_part=0.0;
		// N : nombre de points du signal
    for (int n = 0; n < M; n++) {

      // Calcul somme DFT
      real_part += TabCos[(k * n)%64] * signal[n];
      imag_part += TabSin[(k * n)%64] * signal[n];
    }
		long long res=(imag_part*imag_part + real_part*real_part); //là on est sur 10**27*10**27 => 10**54
		int resInt=res>>32; //on retourne sur 10**22
		return  resInt; //dcp on est sur 10**22
}
