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
D=M
M=D
// pop static 3
@SP
M=M-1
A=M
D=M

@static.3
D=M
M=D
// pop static 1
@SP
M=M-1
A=M
D=M

@static.1
D=M
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
// push static 8
@static.8
D=M

@SP
M=M+1
A=M-1
M=D
