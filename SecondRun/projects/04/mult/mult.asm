// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


    @R2 // C = 0
    M=0

(LOOP)
    @R1 // GET COUNT
    D=M

    @END
    D; JEQ // IF COUNT == 0 -> END

    @R0 // GET MULTIPLIER
    D=M

    @R2 // C += MULTIPLIER
    M=M+D

    @R1 // COUNT -= 1
    M=M-1

    @LOOP // REPEAT LOOP
    0;JMP

(END)
    @END // REPEAT END LOOP
    0;JMP


