// תרגיל
//R2 צבעו פיקסלים בשחור על המסך, ככמות האוגרים הרשומה באוגר 

// init R2 register
@5000 
D=A // put the value of 5000 in D
@SCREEN
D=D+A // add the value of the screen start register
@R2 // put the start in R2
M=D

// addr 
@SCREEN
D=A
@addr
M=D

(paint_it_black)
    //addr<=R2
    @R2
    D=M
    @addr
    D=D-M
    @exit
    D;JEQ


    @addr
    A=M
    M=-1

    @addr
    M=M+1

    @paint_it_black
    0;JMP

(exit)
    @exit
    0;JMP