// Compiled using vm_translator.py
// push constant 3030
@3030
D=A

@SP
M=M+1
A=M-1
M=D
// pop pointer 0
@SP
M=M-1
A=M
D=M

@3
M=D
// push constant 3040
@3040
D=A

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
// push constant 32
@32
D=A

@SP
M=M+1
A=M-1
M=D
// pop this 2
@SP
M=M-1
A=M
D=M

@THIS
A=M+1
A=A+1
M=D
// push constant 46
@46
D=A

@SP
M=M+1
A=M-1
M=D
// pop that 6
@SP
M=M-1
A=M
D=M

@THAT
A=M+1
A=A+1
A=A+1
A=A+1
A=A+1
A=A+1
M=D
// push pointer 0
@3
D=M

@SP
M=M+1
A=M-1
M=D
// push pointer 1
@4
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
// push this 2
@THIS
A=M+1
A=A+1
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
// push that 6
@THAT
A=M+1
A=A+1
A=A+1
A=A+1
A=A+1
A=A+1
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
