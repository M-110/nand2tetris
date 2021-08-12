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

// label Sys.init
(Sys.init)
// push constant 10
@10
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 5
@5
D=A
@SP
M=M+1
A=M-1
M=D

// lt
@SP
M=M-1

@SP
A=M
D=M
@SP
A=M-1
D=M-D
M=-1
@END_LT_1
D; JLT

@SP
A=M-1
M=0

(END_LT_1)

// if-goto A
@SP
M=M-1
A=M
D=M
@A
D;JLT
// goto B
@B
0;JMP
// label A
(A)
// push constant 999
@999
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 999
@999
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 999
@999
D=A
@SP
M=M+1
A=M-1
M=D

// goto END
@END
0;JMP
// label B
(B)
// push constant 1
@1
D=A
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

// push constant 1
@1
D=A
@SP
M=M+1
A=M-1
M=D

// goto END
@END
0;JMP
// label END
(END)
// goto END
@END
0;JMP
