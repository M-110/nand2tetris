
// Compiled using vm_translator_old.py
// Bootstrap (Set SP to 256 and call Sys.init):
@256
D=A

@SP
M=D

//call Sys.init

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
//Command(command_type=<CommandType.RETURN: 8>, arg1=None, arg2=None) not implemented.
