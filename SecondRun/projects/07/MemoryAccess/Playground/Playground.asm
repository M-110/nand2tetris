// Compiled using vm_translator.py
// push constant 2
@2
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 6
@6
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
// pop static 1
@SP
M=M-1
A=M
D=M

@static.1
M=D
