// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
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

