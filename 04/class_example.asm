//put 10 in the D register
//D=10
@10
D=A

//D++
D=D+1

//D=RAM[17]
@17
D=M

//RAM[17]=D
@17
M=D

//RAM[17]=10
@10
D=A
@17
M=D

//RAM[17]=RAM[3]
@3
D=M
@17
M=D

//exercise 1 - compute: RAM[2]=RAM[0]+RAM[1]
@0 
D=M // get thr data from  RAM[0]
@1
D=D+M // get the data from RAM[1] and add it to what was in RAM[0]
@2
M=D // put the result in RAM[2] 



//exercise 2 - if R0>0 than R1=1 else R1=0
@R0
D=M

//if R0>0
@greater_than_zero
D;JGT

//else
@R1
M=0
@END
0;JMP

//R1=1
(greater_than_zero)
    @R1
    M=1
    @END
    0;JMP


//exercise 3 - compute RAM[1]=1+2+...+RAM[0]
// n=RAM[0]
@R0
D=M
@n
M=D

// init i=1, sum=0
@i
M=1

@sum
M=0

// start loop
(LOOP)
    // if i<n
    @n
    D=M
    @i
    D=D-M // n-i
    @END_LOOP
    D;JLT // if n-i<0 jump to END_LOOP

    // sum += i
    @i
    D=M
    @sum
    M=M+D

    // i++
    @i
    M=M+1
    
    //back to loop
    @LOOP
    0;JMP


(END_LOOP)
    //R1 = sum
    @sum
    D=M
    @R1
    M=D

//infinit loop
(END)
    @END
    0;JMP