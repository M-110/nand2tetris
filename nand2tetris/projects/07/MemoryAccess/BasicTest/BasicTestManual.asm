@100
D=A

@SP
M=D

@110
D=A

@LCL
M=D

@120
D=A

@ARG
M=D

@130
D=A

@THIS
M=D

@140
D=A

@THAT
M=D


// push constant 10
    @10
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1

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
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1

// push constant 22

    @22
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1

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
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1


// pop this 6

// push constant 42
// push constant 45
// pop that 5
// pop that 2
// push constant 510
// pop temp 6
// push local 0
// push that 5
// add
// push argument 1
// sub
// push this 6
// push this 6
// add
// sub
// push temp 6
// add