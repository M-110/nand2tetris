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

// function SimpleFunction.test 2
(SimpleFunction.test)
@SP
M=M+1
A=M-1
M=0

@SP
M=M+1
A=M-1
M=0

// push local 0
@LCL
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push local 1
@LCL
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
// not
@SP
A=M-1
M=!M
// push argument 0
@ARG
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
// push argument 1
@ARG
A=M+1
D=M
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
// return
@LCL
D=M

@endFrame
M=D

@LCL
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
A=D
D=M

@retAddress
M=D

@SP
M=M-1
A=M
D=M

@ARG
A=M
M=D
@ARG
D=M+1

@SP
M=D
@endFrame
A=M-1
D=M

@THAT
M=D

@endFrame
D=M-1
A=D-1
D=M

@THIS
M=D

@endFrame
D=M-1
D=D-1
A=D-1
D=M

@ARG
M=D

@endFrame
D=M-1
D=D-1
D=D-1
A=D-1
D=M

@LCL
M=D

@retAddress
A=M
0;JMP
