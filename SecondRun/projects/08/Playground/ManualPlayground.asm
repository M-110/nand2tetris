@256
D=A
@SP
M=D


// push constant 5
@5
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 10
@10
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
D;JEQ
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

// goto END
@END
0;JMP
// label B
(B)
// push constant 444
@444
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
