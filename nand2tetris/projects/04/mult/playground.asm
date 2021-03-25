    @SCREEN // 
    D=A

    @pixel // Start Pixel
    M=D

    @8192
    D=A

    @maxPixel // End Pixel
    M=D

    @i // Current Pixel
    M=0

(KEYBOARD)
    @KBD
    D=M

    @ON
    D;JGT

    @i // Check that screen isn't already white
    D=M

    @OFF
    D;JGE

    @KEYBOARD
    0;JMP


(ON)
    @i
    D=M

    @maxPixel 
    D=M-D

    @KEYBOARD // SKIP IF IT'S ALREADY FILLED
    D;JLE

    @pixel // RAM[pixel] = 1 
    D=M

    @i
    A=D+M
    M=-1
    
    @i
    M=M+1

    @KEYBOARD
    0;JMP

(OFF)
    @pixel // RAM[pixel] = 1 
    D=M
    @i
    A=D+M
    M=0
    
    @i
    M=M-1

    @KEYBOARD
    0;JMP

