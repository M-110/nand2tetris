// Compiled using vm_translator.py

// <------------- START BOOTSTRAP ------------->

@256
D=A

@SP
M=D


// <------------- END BOOTSTRAP ------------->

// push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

// pop local 0
@SP
M=M-1
A=M
D=M

@LCL
A=M
M=D
// label LOOP_START
(LOOP_START)
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push local 0
@LCL
A=M
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
// pop local 0
@SP
M=M-1
A=M
D=M

@LCL
A=M
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
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// if-goto LOOP_START
@SP
M=M-1
A=M
D=M
@LOOP_START
D;JGT
// push local 0
@LCL
A=M
D=M
@SP
M=M+1
A=M-1
M=D

