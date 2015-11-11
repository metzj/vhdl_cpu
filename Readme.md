# VHDL CPU

## Spec
[Link](https://github.com/alxppp/vhdl_cpu/blob/master/spec.pdf)

## Aufteilung Befehle

### Implementierung

| OP   | Ersteller |
|------|-----------|
| LDC  | @alxppp   |
| LDD  | @alxppp   |
| LDR  | @alxppp   |
| STD  | @alxppp   |
| STR  | @maxcpu   |
| LDPC | @maxcpu   |
| STPC | @maxcpu   |
| JMP  | @maxcpu   |
| JZ   | @RobMa [x] |
| JC   | @RobMa [x] |
| JN   | @RobMa [x] |
| JO   | @RobMa [x] |
| JNZ  |@OrestisAlpos[x]|
| JNC  |@OrestisAlpos[x]|
| JNN  |@OrestisAlpos[x]|
| JNO  |@OrestisAlpos[x]|
| EXEC_ROL  | @maxcpu |
| EXEC_ROLC | @maxcpu |
| EXEC_ROR  | @maxcpu |
| EXEC_RORC | @maxcpu |
| EXEC_SUB  | @RobMa |
| EXEC_SUBC | @RobMa |
| set_flags_logic | @RobMa [x]|
| set_flags_load  | @RobMa [x]|
| EXEC_REA | @OrestisAlpos [x]|
| EXEC_REO | @OrestisAlpos [x]|
| EXEC_REX | @OrestisAlpos [x]|
| EXEC_SLL | @alxppp |
| EXEC_SRL | @alxppp |
| EXEC_SRA | @alxppp |
| IN | @OrestisAlpos |
| OUT | @OrestisAlpos |
| Trace_pack | @maxcpu |
| init_memory | @RobMa |

### Test

| OP	| Tester |
| NOP	| @RobMa |
| STOP	| @RobMa |
| ADD	| @maxcpu |
| ADDC	| @maxcpu |
| SUB	| @OrestisAlpos |
| SUBC	| @OrestisAlpos |
| NOT	| @alxppp |
| AND	| @alxppp |
| OR	| @alxppp |
| XOR	| @alxppp |
| REA	| @RobMa |
| REO	| @RobMa |
| REX	| @RobMa |
| SLL	| @maxcpu |
| SRL	| @maxcpu |
| SRA	| @maxcpu |
| ROL	| @RobMa |
| ROLC	| @RobMa |
| ROR	| @RobMa |
| RORC	| @RobMa |
| LDC	| @OrestisAlpos |
| LDD	| @OrestisAlpos |
| LDR	| @OrestisAlpos |
| STD	| @OrestisAlpos |
| STR	| @OrestisAlpos |
| IN	| @maxcpu |
| OUT	| @maxcpu |
| LDPC	| @alxppp |
| STPC	| @alxppp |
| JMP	| @alxppp |
| JZ	| @alxppp |
| JC	| @alxppp |
| JN	| @OrestisAlpos |
| JO	| @OrestisAlpos |
| JNZ	| @maxcpu |
| JNC	| @maxcpu |
| JNN	| @maxcpu |
| JNO	| @RobMa |

## Assembler documentation

### Usage
`maxcpu_asm [-o outfile] [options] filename`

maxcpu_asm reads assembly code from stdin and writes the resulting op code to stdout. You can redirect the output to a file with the -o option. Run `maxcpu_asm -h` for help.

### Installation
* **UNIX machines**

  Run `./maxcpu_asm`.

* **Windows**

  There are two ways to run the assembler on Windows.
  1. The easy way is to run `maxcpu_asm.exe` from the command line.
     Example to assemble sample_program.asm:
     ```
       cd C:\vhdl_cpu\assembler\
       .\maxcpu_asm.exe sample_program.asm
     ```

  2. The other way is to install the Ruby interpreter and run the program with `ruby maxcpu_asm`. This option allows you to modify the source code.

___

Hello! just a notice. It would be good if we all write the flag parameters always in the following order: Zero, Carry, Negative, Overflow.
I think this would be very useful in order to avoid mistakes later when calling the EXEC_functions. Do you agree?
	->Yes, good idea! (@RobMa)
	-> Good idea! changed my procedures (@maxcpu)
	-> Yup, nice! (@alxppp)
