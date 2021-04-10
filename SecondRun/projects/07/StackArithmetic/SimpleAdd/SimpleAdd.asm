
        // Compiled using vm_translator.py
        // Bootstrap (Set SP to 256 and call Sys.init):
        @256
        D=A
        
        @SP
        M=D
        
        call Sys.init
        // push constant 7
@7
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

// add
@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D
