	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly
		


;Section RAM (read write):
	area    maram,data,readwrite
		
GestionSon_Index  DCD 0x0    ; Variable initialisée à 0
SortieSon DCW 0x0 ;le compilateur nous demande de l'initialiser
	
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici
	EXPORT GestionSon_callback
	EXPORT GestionSon_Index
	EXPORT SortieSon
	IMPORT LongueurSon
	IMPORT Son
	IMPORT ServJeuLASER_WritePWMSoundVal;

;IMPORT LongueurSon et la tableau Son de bruitverre.asm

;initialiser GestionSon_Index à 0 

;if GestionSon_Index=!LongueurSon (LongueurSon est la taille du tableau Son)
	;récupérer la valeur de Son[GestionSon_Index]
	;on multiple cete valeur par 360 puis on la divise par 32768 en décalant les bits => plus efficace
	;stocker cette variable dans SortieSon
	;GestionSon_Index++



GestionSon_callback proc
	
	LDR R12, =Son ;première adresse de Son 
	
	LDR R2, =LongueurSon ;if GestionSon_Index=!LongueurSon 
	LDR R0,[R2]
	LDR R1,  =GestionSon_Index
	LDR R3,[R1]
	CMP R0,R3
	BEQ fin_prgm
	
	
	;ADD R3, R12,R3,LSL #1 ;on met dans R3 l'adresse de la case que l'on a en mémoire (on fait R12 @de la première case + Index*2 (car des short donc chaque case = 2 octets))
	LDRSH R1,[R12,R3,LSL #1] ;
	MOV R3, #360;
	MUL R2, R1, R3 ; On multiplie par 360 (on a mis 360 ds R3 sinon le compilateur pas content)
	ASR R3, R2,#15 ;on divise par 32768 en décalant les bits de 15 sur la droite (32768 = 2**15) ASR pour le signe sinon LSR prend pas le bon signe
	ADD R3, R3, #360 ; on rajoute 360 pour passer de -360 à +360 à 0-719 pour le côté positif
	LDR R0, =SortieSon ; <!> il veut pas de LDRSH ici ptêtre problème de signe DCP
	STRH R3, [R0] ;on met cette nouvelle valeur dans SortieSon 
	
	MOV R0, R3 ;on met la valeur de SortieSon dans R0 pour le passer en argument de la fonction
	PUSH {LR} ;sinon on zigouille LR avc un BL qui enregistre LR
	BL ServJeuLASER_WritePWMSoundVal  ; Appeler la fonction C
	POP {LR}
	
	LDR R1, =GestionSon_Index
	LDR R0, [R1] 
	ADD R0, #1  
	STR R0, [R1]  ; GestionSon_Index++
	
	;B boucle ya pas de boucle callback est appelé plusieurfs fois à intervalle régulier
	
fin_prgm 
	bx lr

	endp
		
		
GestionSon_Start proc

	LDR R1, =GestionSon_Index  
	MOV R0, #0  
	STR R0, [R1]  ; on remet GestionSon_Index à 0
	BX LR
	
	endp
		
		
	END	