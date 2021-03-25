
// D: Data Register
// A: Address / Data Register
// M: current selected register, M=RAM[A]

    @R2 // C 
    M=0

(LOOP)
    @R1
    D=M

    @END
    D;JEQ // IF COUNT == 0, STOP

    @R0
    D = M

    @R2
    M = M + D // SUM = SUM + R0

    @R1
    M = M - 1 // COUNT -= 1

    @LOOP
    D;JMP // CONTINUE LOOP

(END)
    @END
    0;JMP