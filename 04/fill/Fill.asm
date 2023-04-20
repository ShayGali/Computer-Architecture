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

// listen_white():
//     if kbd!=0:
//         paint_black()
//     listen_white()

// paint_black():
//     addr = screen
//     n = kbd

//     while addr < n:
//         mem[addr++] = -1
        
//     listen_black()

// listen_black():
//     if kbd==0:
//         paint_white()
//     listen_black()

// paint_white():
//     addr = screen
//     n = kbd

//     while addr < n:
//         mem[addr++] = 0
        
//     listen_white()z

// Put your code here.
(listen_white) // listen to the keyboard until key is pressed
    @KBD 
    D=M // get the keyboard vlaue

    @listen_white // if no key is pressed
    D;JEQ
    @paint_black_func //if key is pressed
    D;JNE

(paint_black_func)
    //addr=screen
    @SCREEN // point to the start of the screen
    D=A // get the adress of the register of the screen

    @addr
    M=D // put the adress of the screen in the addr var
    
   //while - until we reaches to the KBD register - the end
    (paint_black)
        //addr<n  
        @KBD
        D=A // put in D 24576 - the end
        @addr
        D=D-M
        @listen_black
        D;JEQ

        //mem[addr]=-1
        @addr
        A=M
        M=-1

        //addr++
        @addr
        M=M+1

        @paint_black
        0;JMP

(listen_black) // listen to the kebord until the key is released
    @KBD
    D=M // get the keyboard vlaue

    @listen_black // loop
    D;JNE
    @paint_white_func // if the key is released go to paint_white
    D;JEQ

(paint_white_func)
    //addr=screen
    @SCREEN
    D=A
    @addr
    M=D
    
   //while
    (paint_white)
        //addr<n  
        @KBD
        D=A
        @addr
        D=D-M
        @listen_white
        D;JEQ

        //mem[addr]=0
        @addr
        A=M
        M=0

        @addr
        M=M+1

        @paint_white
        0;JMP