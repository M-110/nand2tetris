// function Sys.init 0(Sys.init)// push constant 4000@4000D=A@SPM=M+1A=M-1M=D// pop pointer 0@SPM=M-1A=MD=M@3M=D// push constant 5000@5000D=A@SPM=M+1A=M-1M=D// pop pointer 1@SPM=M-1A=MD=M@4M=D// call Sys.main@RETURN_ADDRESS_CALL_1D=A@SPM=M+1A=M-1M=D@LCLD=M@SPM=M+1A=M-1M=D@ARGD=M@SPM=M+1A=M-1M=D@THISD=M@SPM=M+1A=M-1M=D@THATD=M@SPM=M+1A=M-1M=D@SPD=M@LCLM=D@Sys.main0;JMP(RETURN_ADDRESS_CALL_1)// pop temp 1@SPM=M-1A=MD=M@6M=D// label LOOP(LOOP)// goto LOOPLOOP0;JMP// function Sys.main 5(Sys.main)@SPM=M+1A=M-1M=0@SPM=M+1A=M-1M=0@SPM=M+1A=M-1M=0@SPM=M+1A=M-1M=0@SPM=M+1A=M-1M=0// push constant 4001@4001D=A@SPM=M+1A=M-1M=D// pop pointer 0@SPM=M-1A=MD=M@3M=D// push constant 5001@5001D=A@SPM=M+1A=M-1M=D// pop pointer 1@SPM=M-1A=MD=M@4M=D// push constant 200@200D=A@SPM=M+1A=M-1M=D// pop local 1@SPM=M-1A=MD=M@LCLA=M+1M=D// push constant 40@40D=A@SPM=M+1A=M-1M=D// pop local 2@SPM=M-1A=MD=M@LCLA=M+1A=A+1M=D// push constant 6@6D=A@SPM=M+1A=M-1M=D// pop local 3@SPM=M-1A=MD=M@LCLA=M+1A=A+1A=A+1M=D// push constant 123@123D=A@SPM=M+1A=M-1M=D// call Sys.add12@RETURN_ADDRESS_CALL_2D=A@SPM=M+1A=M-1M=D@LCLD=M@SPM=M+1A=M-1M=D@ARGD=M@SPM=M+1A=M-1M=D@THISD=M@SPM=M+1A=M-1M=D@THATD=M@SPM=M+1A=M-1M=D@SPD=M@LCLM=D@Sys.add120;JMP(RETURN_ADDRESS_CALL_2)// pop temp 0@SPM=M-1A=MD=M@5M=D// push local 0@LCLA=MD=M@SPM=M+1A=M-1M=D// push local 1@LCLA=M+1D=M@SPM=M+1A=M-1M=D// push local 2@LCLA=M+1A=A+1D=M@SPM=M+1A=M-1M=D// push local 3@LCLA=M+1A=A+1A=A+1D=M@SPM=M+1A=M-1M=D// push local 4@LCLA=M+1A=A+1A=A+1A=A+1D=M@SPM=M+1A=M-1M=D// add@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D// add@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D// add@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D// add@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D// return@LCLD=M@endFrameM=D@LCLD=M-1D=D-1D=D-1D=D-1D=D-1A=DD=M@retAddressM=D@SPM=M-1A=MD=M@ARGA=MM=D@ARGD=M+1@SPM=D@endFrameA=M-1D=M@THATM=D@endFrameD=M-1A=D-1D=M@THISM=D@endFrameD=M-1D=D-1A=D-1D=M@ARGM=D@endFrameD=M-1D=D-1D=D-1A=D-1D=M@LCLM=D@retAddressA=M0;JMP// function Sys.add12 0(Sys.add12)// push constant 4002@4002D=A@SPM=M+1A=M-1M=D// pop pointer 0@SPM=M-1A=MD=M@3M=D// push constant 5002@5002D=A@SPM=M+1A=M-1M=D// pop pointer 1@SPM=M-1A=MD=M@4M=D// push argument 0@ARGA=MD=M@SPM=M+1A=M-1M=D// push constant 12@12D=A@SPM=M+1A=M-1M=D// add@SP
M=M-1
A=M
D=M

@SP
A=M-1
M=M+D// return@LCLD=M@endFrameM=D@LCLD=M-1D=D-1D=D-1D=D-1D=D-1A=DD=M@retAddressM=D@SPM=M-1A=MD=M@ARGA=MM=D@ARGD=M+1@SPM=D@endFrameA=M-1D=M@THATM=D@endFrameD=M-1A=D-1D=M@THISM=D@endFrameD=M-1D=D-1A=D-1D=M@ARGM=D@endFrameD=M-1D=D-1D=D-1A=D-1D=M@LCLM=D@retAddressA=M0;JMP