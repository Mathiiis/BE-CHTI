	PRESERVE8
	THUMB   
		

; ====================== zone de r�servation de donn�es,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly
		


;Section RAM (read write):
	area    maram,data,readwrite
		
;GestionSon_Index  DCD 0x0    ; Variable initialis�e � 0

	
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; �crire le code ici


dft proc

	bx lr

	endp
		
		
	END	