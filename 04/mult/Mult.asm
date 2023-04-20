// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
//Multi(R0,R1):
// n = R0
// sum = 0
// while n != 0:
//      sum = sum+R1
//      n--
// return sum


// init n
@R0 // the A register point to R1 
D=M // put the val in the D register
@n // init new valriable - n
M=D // put the value of R1 in n

// init sum
@sum // init new valriable - sum
M = 0 // put the value 0 in sum

@i
M=0

//start loop
(LOOP)
    // if i==n stop the loop
    @i
    D=M // the value of i in the D register
    @n
    D=D-M // D = i - n -> for check if i<n
    @STOP
    D;JGE // if i-n >= 0 -> i>=n -> stop the loop - jump to stop

    //sum = sum + R1
    @R1 // point to R1
    D=M // get the value of R1 to D register
    @sum // point to sum
    M=M+D // smu = sum + R1

    // i++
    @i
    M=M+1

    // jump to loop
    @LOOP
    0;JMP // just jump, without condition

// return sun
(STOP)
    @sum // point to sum
    D=M  // put the value of sum to the D register
    @R2 // point to R2 register
    M=D // put the value of sum in the R2 register

// end of the function
(END)
    @END
    0;JMP
