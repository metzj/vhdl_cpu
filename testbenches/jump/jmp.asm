; Test JMP

	JMP	SUCCESS

ERROR:	LDC	R0	1
	STOP

SUCCESS:
	LDC	R0	0
	STOP
