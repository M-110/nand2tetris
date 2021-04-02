// Compiled using vm_translator.py
// push constant 17
@17
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 17
@17
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
M=-1
@END_EQ_1
D; JEQ

@SP
A=M-1
M=0

(END_EQ_1)

// push constant 17
@17
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 16
@16
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
M=-1
@END_EQ_2
D; JEQ

@SP
A=M-1
M=0

(END_EQ_2)

// push constant 16
@16
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 17
@17
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
M=-1
@END_EQ_3
D; JEQ

@SP
A=M-1
M=0

(END_EQ_3)

// push constant 892
@892
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 891
@891
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

// push constant 891
@891
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 892
@892
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
@END_LT_2
D; JLT

@SP
A=M-1
M=0

(END_LT_2)

// push constant 891
@891
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 891
@891
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
@END_LT_3
D; JLT

@SP
A=M-1
M=0

(END_LT_3)

// push constant 32767
@32767
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 32766
@32766
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
M=-1
@END_GT_1
D; JGT

@SP
A=M-1
M=0

(END_GT_1)

// push constant 32766
@32766
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 32767
@32767
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
M=-1
@END_GT_2
D; JGT

@SP
A=M-1
M=0

(END_GT_2)

// push constant 32766
@32766
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 32766
@32766
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
M=-1
@END_GT_3
D; JGT

@SP
A=M-1
M=0

(END_GT_3)

// push constant 57
@57
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 31
@31
D=A

@SP
M=M+1
A=M-1
M=D

// push constant 53
@53
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
// push constant 112
@112
D=A

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
// neg
@SP
A=M-1
M=-M
// and
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M
// push constant 82
@82
D=A

@SP
M=M+1
A=M-1
M=D

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
