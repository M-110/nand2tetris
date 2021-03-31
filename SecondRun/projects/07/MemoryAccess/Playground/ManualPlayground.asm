// push constant 2
@500
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 1
@300
D=A

@SP
M=M+1
A=M-1
M=D

// gt
@SP
M=M-1

@SP
A=M
D=M

@SP
A=M-1
D=M-D
M=1 // Set to True

@END_GT_1
D; JGT // If D is 0, then skip
       // else Set to False
@SP
A=M-1
M=0

(END_GT_1)
