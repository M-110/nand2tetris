// Compiled using vm_translator.py
// push constant 111
@111
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 333
@333
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 888
@888
D=A

@SP
M=M+1
A=M-1
M=D
// pop static 8
@SP
M=M-1
A=M
D=M

@static.8
M=D
// pop static 3
@SP
M=M-1
A=M
D=M

@static.3
M=D
// pop static 1
@SP
M=M-1
A=M
D=M

@static.1
M=D
// push static 3
@static.3
D=M

@SP
M=M+1
A=M-1
M=D
// push static 1
@static.1
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
M=M-1

@SP
A=M
M=M-D

@SP
M=M+1
// push static 8
@static.8
D=M

@SP
M=M+1
A=M-1
M=D

// add
@SP
M=M-1

@SP
A=M
D=M

@SP
M=M-1

@SP
A=M
M=M+D
