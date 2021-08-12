// Compiled using vm_translator.py

// <------------- START BOOTSTRAP ------------->
// Initialize pointer to 256
@256
D=A
@SP
M=D

// Set LCL, ARG, THIS and THAT to illegal values
@1
D=-A
@LCL
M=D

@2
D=-A
@ARG
M=D

@3
D=-A
@THIS
M=D

@4
D=-A
@THAT
M=D

// Bootstrap Calling Sys.init()
@RETURN_ADDRESS_CALL_1
D=A
@SP
M=M+1
A=M-1
M=D

@LCL
D=M
@SP
M=M+1
A=M-1
M=D

@ARG
D=M
@SP
M=M+1
A=M-1
M=D

@THIS
D=M
@SP
M=M+1
A=M-1
M=D

@THAT
D=M
@SP
M=M+1
A=M-1
M=D

@SP
D=M
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M

@LCL
M=D
@Sys.init
0;JMP
(RETURN_ADDRESS_CALL_1)

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
D;JLT
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
