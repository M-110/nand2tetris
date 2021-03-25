// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// D: Data Register
// A: Address / Data Register
// M: current selected register, M=RAM[A]

    @sum // C 
    M=0

    @R1  // B = R1
    D=M 

    @count // COUNTER
    M=D

(LOOP)
    @count
    D=M

    @STOP 
    D;JEQ // IF COUNT == 0, STOP

    @R0
    D = M

    @sum
    M = M + D // SUM = SUM + R0

    @count
    M = M - 1 // COUNT -= 1

    @LOOP
    D;JMP // CONTINUE LOOP

(STOP)
    @sum
    D = M

    @R2
    M = D

(END)
    @END
    0;JMP