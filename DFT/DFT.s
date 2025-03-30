	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly
		


;Section RAM (read write):
	area    maram,data,readwrite
		
;GestionSon_Index  DCD 0x0    ; Variable initialisée à 0

	
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici


dft proc

	bx lr

	endp
		
		
	END	