    
    // set location of pointer
    @100
    D=A

    @SP
    M=D
    

    // push constant 111
    
    @111
    D=A

    @SP
    A=M
    M=D

    @SP
    M=M+1

    // push constant 333

    @333
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1

    // push constant 888

    @888
    D=A
    
    @SP
    A=M
    M=D

    @SP
    M=M+1

    // pop static 8
   
    @SP
    M=M-1
    A=M
    D=M

    @static.8
    M=D

    // pop static 3
    
    @SP
    M=M-1
    A=M
    D=M

    @static.3
    M=D
    
    // pop static 1
    
    @SP
    M=M-1
    A=M
    D=M

    @static.1
    M=D

    // push static 3


    // push static 1


    

