#include <complex.h>
#include <stdio.h>
#include "DFT.h"
#include "CosSin_float.c"



// Définition explicite de M_PI si elle n'est pas définie
#ifndef N
#define N 64

#endif

// Fonction qui calcule la DFT d'un signal d'entrée
void dft(float* signal, float* output) {
	// N : nombre de points du signal
    for (int k = 0; k < N; k++) {
        output[k] = 0.0; // Initialisation de la sortie
        for (int n = 0; n < N; n++) {
            // Calcul somme DFT
            float real_part = TabCos[(k * n)%64];
						real_part *= real_part;
            float imag_part = TabSin[(k * n)%64];
						imag_part *= imag_part;
            output[k] += signal[n] * (real_part + imag_part);
        }
    }
}
