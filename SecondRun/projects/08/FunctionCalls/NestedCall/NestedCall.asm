// function Sys.init 0
(Sys.init)
// push constant 4000
@4000
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
// push constant 5000
@5000
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
// call Sys.main
@RETURN_ADDRESS_CALL_1
D=A
@SP
M=M+1
A=M-1
M=D

@LCL
D=M
@SP
M=M+1
A=M-1
M=D

@ARG
D=M
@SP
M=M+1
A=M-1
M=D

@THIS
D=M
@SP
M=M+1
A=M-1
M=D

@THAT
D=M
@SP
M=M+1
A=M-1
M=D

@SP
D=M

@LCL
M=D
@Sys.main
0;JMP
(RETURN_ADDRESS_CALL_1)
// pop temp 1
@SP
M=M-1
A=M
D=M

@6
M=D
// label LOOP
(LOOP)
// goto LOOP
LOOP
0;JMP
// function Sys.main 5
(Sys.main)
@SP
M=M+1
A=M-1
M=0

@SP
M=M+1
A=M-1
M=0

@SP
M=M+1
A=M-1
M=0

@SP
M=M+1
A=M-1
M=0

@SP
M=M+1
A=M-1
M=0

// push constant 4001
@4001
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
// push constant 5001
@5001
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
// push constant 200
@200
D=A
@SP
M=M+1
A=M-1
M=D

// pop local 1
@SP
M=M-1
A=M
D=M

@LCL
A=M+1
M=D
// push constant 40
@40
D=A
@SP
M=M+1
A=M-1
M=D

// pop local 2
@SP
M=M-1
A=M
D=M

@LCL
A=M+1
A=A+1
M=D
// push constant 6
@6
D=A
@SP
M=M+1
A=M-1
M=D

// pop local 3
@SP
M=M-1
A=M
D=M

@LCL
A=M+1
A=A+1
A=A+1
M=D
// push constant 123
@123
D=A
@SP
M=M+1
A=M-1
M=D

// call Sys.add12
@RETURN_ADDRESS_CALL_2
D=A
@SP
M=M+1
A=M-1
M=D

@LCL
D=M
@SP
M=M+1
A=M-1
M=D

@ARG
D=M
@SP
M=M+1
A=M-1
M=D

@THIS
D=M
@SP
M=M+1
A=M-1
M=D

@THAT
D=M
@SP
M=M+1
A=M-1
M=D

@SP
D=M

@LCL
M=D
@Sys.add12
0;JMP
(RETURN_ADDRESS_CALL_2)
// pop temp 0
@SP
M=M-1
A=M
D=M

@5
M=D
// push local 0
@LCL
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push local 1
@LCL
A=M+1
D=M
@SP
M=M+1
A=M-1
M=D

// push local 2
@LCL
A=M+1
A=A+1
D=M
@SP
M=M+1
A=M-1
M=D

// push local 3
@LCL
A=M+1
A=A+1
A=A+1
D=M
@SP
M=M+1
A=M-1
M=D

// push local 4
@LCL
A=M+1
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
// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
// return
@LCL
D=M

@endFrame
M=D

@LCL
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
A=D
D=M

@retAddress
M=D

@SP
M=M-1
A=M
D=M

@ARG
A=M
M=D
@ARG
D=M+1

@SP
M=D
@endFrame
A=M-1
D=M

@THAT
M=D

@endFrame
D=M-1
A=D-1
D=M

@THIS
M=D

@endFrame
D=M-1
D=D-1
A=D-1
D=M

@ARG
M=D

@endFrame
D=M-1
D=D-1
D=D-1
A=D-1
D=M

@LCL
M=D

@retAddress
A=M
0;JMP
// function Sys.add12 0
(Sys.add12)
// push constant 4002
@4002
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
// push constant 5002
@5002
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
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// push constant 12
@12
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
// return
@LCL
D=M

@endFrame
M=D

@LCL
D=M-1
D=D-1
D=D-1
D=D-1
D=D-1
A=D
D=M

@retAddress
M=D

@SP
M=M-1
A=M
D=M

@ARG
A=M
M=D
@ARG
D=M+1

@SP
M=D
@endFrame
A=M-1
D=M

@THAT
M=D

@endFrame
D=M-1
A=D-1
D=M

@THIS
M=D

@endFrame
D=M-1
D=D-1
A=D-1
D=M

@ARG
M=D

@endFrame
D=M-1
D=D-1
D=D-1
A=D-1
D=M

@LCL
M=D

@retAddress
A=M
0;JMP
