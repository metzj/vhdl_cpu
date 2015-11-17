; Test LDPC

TEST1:	LDC	R1	TEST1		; R1 = &TEST1
	LDPC	R2			; R2 = PC, R2 should be R1 + 3
	LDC	R3	3
	SUB	R3	R2	R3
	JNZ	ERROR

SUCCESS:
	LDC	R0	0
	STOP

ERROR:	LDC	R0	1
	STOP
