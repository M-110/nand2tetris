// Compiled using vm_translator.py

// <------------- START BOOTSTRAP ------------->

@256
D=A

@SP
M=D


// <------------- END BOOTSTRAP ------------->

// function Sys.init 0
(Sys.init)
// push constant 6
@6
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 8
@8
D=A
@SP
M=M+1
A=M-1
M=D

// call Class1.set 2
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
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M

@LCL
M=D
@Class1.set
0;JMP
(RETURN_ADDRESS_CALL_1)
// pop temp 0
@SP
M=M-1
A=M
D=M

@5
M=D
// push constant 23
@23
D=A
@SP
M=M+1
A=M-1
M=D

// push constant 15
@15
D=A
@SP
M=M+1
A=M-1
M=D

// call Class2.set 2
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
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M

@LCL
M=D
@Class2.set
0;JMP
(RETURN_ADDRESS_CALL_2)
// pop temp 0
@SP
M=M-1
A=M
D=M

@5
M=D
// call Class1.get 0
@RETURN_ADDRESS_CALL_3
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
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M

@LCL
M=D
@Class1.get
0;JMP
(RETURN_ADDRESS_CALL_3)
// call Class2.get 0
@RETURN_ADDRESS_CALL_4
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
D=D-1
D=D-1
D=D-1
D=D-1
D=D-1
@ARG
M=D
@SP
D=M

@LCL
M=D
@Class2.get
0;JMP
(RETURN_ADDRESS_CALL_4)
// label WHILE
(WHILE)
// goto WHILE
@WHILE
0;JMP
// function Class1.set 0
(Class1.set)
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// pop static 0
@SP
M=M-1
A=M
D=M

@static.0
M=D
// push argument 1
@ARG
A=M+1
D=M
@SP
M=M+1
A=M-1
M=D

// pop static 1
@SP
M=M-1
A=M
D=M

@static.1
M=D
// push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

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
// function Class1.get 0
(Class1.get)
// push static 0
@static.0
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

// sub
@SP
M=M-1

@SP
A=M
D=M

@SP
A=M-1
M=M-D
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
// function Class2.set 0
(Class2.set)
// push argument 0
@ARG
A=M
D=M
@SP
M=M+1
A=M-1
M=D

// pop static 0
@SP
M=M-1
A=M
D=M

@static.0
M=D
// push argument 1
@ARG
A=M+1
D=M
@SP
M=M+1
A=M-1
M=D

// pop static 1
@SP
M=M-1
A=M
D=M

@static.1
M=D
// push constant 0
@0
D=A
@SP
M=M+1
A=M-1
M=D

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
// function Class2.get 0
(Class2.get)
// push static 0
@static.0
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

// sub
@SP
M=M-1

@SP
A=M
D=M

@SP
A=M-1
M=M-D
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
