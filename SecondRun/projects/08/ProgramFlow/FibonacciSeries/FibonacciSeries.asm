// Compiled using vm_translator.py

// <------------- START BOOTSTRAP ------------->

@256
D=A

@SP
M=D


// <------------- END BOOTSTRAP ------------->

// push argument 1
@ARG
A=M+1
D=M
@SP
M=M+1
A=M-1
M=D

// pop pointer 1
@SP
M=M-1
A=M
D=M

@4
M=D
// push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

// pop that 0
@SP
M=M-1
A=M
D=M

@THAT
A=M
M=D
// push constant 1
@1
D=A
@SP
M=M+1
A=M-1
M=D

// pop that 1
@SP
M=M-1
A=M
D=M

@THAT
A=M+1
M=D
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 2
@2
D=A
@SP
M=M+1
A=M-1
M=D

// sub
@SP
M=M-1

@SP
A=M
D=M

@SP
A=M-1
M=M-D
// pop argument 0
@SP
M=M-1
A=M
D=M

@ARG
A=M
M=D
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// if-goto COMPUTE_ELEMENT
@SP
M=M-1
A=M
D=M
@COMPUTE_ELEMENT
D;JGT
// goto END_PROGRAM
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@THAT
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push that 1
@THAT
A=M+1
D=M
@SP
M=M+1
A=M-1
M=D

// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
// pop that 2
@SP
M=M-1
A=M
D=M

@THAT
A=M+1
A=A+1
M=D
// push pointer 1
@4
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 1
@1
D=A
@SP
M=M+1
A=M-1
M=D

// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
// pop pointer 1
@SP
M=M-1
A=M
D=M

@4
M=D
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 1
@1
D=A
@SP
M=M+1
A=M-1
M=D

// sub
@SP
M=M-1

@SP
A=M
D=M

@SP
A=M-1
M=M-D
// pop argument 0
@SP
M=M-1
A=M
D=M

@ARG
A=M
M=D
// goto MAIN_LOOP_START
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM
(END_PROGRAM)
