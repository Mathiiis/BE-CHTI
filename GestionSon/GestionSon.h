/**
 * Bibliotheque DriverJeuLaser (ancienne gassp72 adaptée 2021 - TR)
 *
 * GPIO - ADC - Sequenceur - System Timer - PWM - 72 MHz
 * Modifs :
 * enlèvement de tout ce qui est inutile dans le .h 
 * ajout de fonctions GPIO dans le .c pour utilisation en ASM ou en C :
 *  - GPIOA_Set(char Broche), GPIOB_Set(char Broche), GPIOC_Set(char Broche)
 *  - GPIOA_Clear(char Broche), GPIOB_Clear(char Broche), GPIOC_Clear(char Broche)
 * 
 * ajout d'une fonction qui impose une valeur de PWM (TIM3_CCR3)
 * PWM_Set_Value_On_TIM3_C3( int Val) 
 * permet en ASM ou en C de fixer la valeur de PWM 
 
 * Ajout de commentaires
 
 */

#ifndef GESTIONSON_H__
#define GESTIONSON_H__


void GestionSon_callback(void);

void GestionSon_Start(void);


#endif