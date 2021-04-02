// push constant 2
@123
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 2
@343
D=A

@SP
M=M+1
A=M-1
M=D
// neg

@SP
A=M-1
M=-M


// push constant 2
@9
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 2
@44
D=A

@SP
M=M+1
A=M-1
M=D

// and
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M

// or
@SP
M=M-1
A=M
D=M
A=A-1
M=D|M

// not
@SP
A=M-1
M=!M