// push constant 10
@10
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// pop local 0
@SP
M=M-1
A=M
D=M

@LCL
A=M
M=D
// push constant 21
@21
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// push constant 22
@22
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// pop argument 2
@SP
M=M-1
A=M
D=M

@ARG
A=M+1
A=A+1
M=D
// pop argument 1
@SP
M=M-1
A=M
D=M

@ARG
A=M+1
M=D
// push constant 36
@36
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// pop this 6
@SP
M=M-1
A=M
D=M

@THIS
A=M+1
A=A+1
A=A+1
A=A+1
A=A+1
A=A+1
M=D
// push constant 42
@42
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// push constant 45
@45
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// pop that 5
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
M=D
// pop that 2
@SP
M=M-1
A=M
D=M

@THAT
A=M+1
A=A+1
M=D
// push constant 510
@510
D=M
D=M

@SP
M=M+1
A=M-1
M=D
// pop temp 6
@SP
M=M-1
A=M
D=M

@TEMP
A=M+1
A=A+1
A=A+1
A=A+1
A=A+1
A=A+1
M=D
// push local 0
@LCL
A=M
D=M

@SP
M=M+1
A=M-1
M=D
// push that 5
@THAT
A=M+1
A=A+1
A=A+1
A=A+1
A=A+1
D=M

@SP
M=M+1
A=M-1
M=D
// push argument 1
@ARG
A=M+1
D=M

@SP
M=M+1
A=M-1
M=D
// push this 6
@THIS
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
// push this 6
@THIS
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
// push temp 6
@TEMP
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
