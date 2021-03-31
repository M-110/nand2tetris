// Compiled using vm_translator.py
// push constant 2
@2
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 3
@3
D=A

@SP
M=M+1
A=M-1
M=D
// eq
@SP
M=M-1

@SP
A=M
D=M
@SP
A=M-1
D=M-D
M=1
@END_EQ_1
D; JEQ

@SP
A=M-1
M=0

(END_EQ_1)
// push constant 3
@3
D=A

@SP
M=M+1
A=M-1
M=D
// push constant 0
@0
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
M=1
@END_GT_1
D; JGT

@SP
A=M-1
M=0

(END_GT_1)
