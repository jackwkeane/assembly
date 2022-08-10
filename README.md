# Project Grade: 100.0/100.0
Completed Spring of 2022 as a part of Lehigh University's CSE 202: Computer Organization and Architecture.

# Note:
All programs were written and optimized for X86-64 machines with gcc module 7.10.

# CSE202-Assembly-SP2022
Assembly: A programming exercise to write, compile, and link assembly code

# Learning Objectives
1) Apply learning of X86-64 ISA assembly mnemonics and assembler "goto" style 
2) Understand how to compile assembly (.S) source files using the GNU AS(as) assembler
3) Understand how to link compiled assembly object files
4) Learn how to view the values in registers and the stack frame in gdb.

# Instructions
Use the C program named prog1.c to call externally defined functions that you will write in assembly. You do NOT need (nor should you) edit the prog1.c code. In prog1.c, you will see six function prototypes that are defined in separate assembly source code files: fn1arg.S, fn1argB.S, fn2args.S, fn3args.S, fn6args.S, and fn8args.S. Their named based on the number of arguments they are passed or they use, e.g., fn2args is the function that is passed two arguments.

Your task is to implement each function in X86-64 assembly. Because of this requirement, it is highly recommended you do your development work on the sunlab machines. You can connect from a remote machine using "ssh -J username@ssh.lehigh.edu username@sunlab.cse.lehigh.edu". (Replace "username" with your Lehigh email ID, which is the same as your sunlab ID.) 

The fn1arg function has already been implemented, so you have an example of what you are to do. Additionally, function shells have already been written in fn1argB.S, fn2args.S, fn3args.S, fn6args.S, and fn8args.S. 

# Listing of the purpose of the functions
1) fn1arg:  receive one integer and return its negated value.
2) fn1argB: receive one integer and return its decremented value; if decremented value is less than 0, return DEADBEEF.
3) fn2args: receive two integers and numerically sort them in ascending order.
4) fn3args: receives a pointer to the first of three integers (l, w, and h) and returns the volume of a rectangular pyramid; if the intermediate result has a fractional component, round up the result.
5) fn6args: receives six integers representing two, (x,y,z) coordinates in 3D space (x1, y1, z1, x2, y2, z2) and returns the distance in integer form. To calculate the integer square root, you are REQUIRED to use this bitwise function, (integer_sqrt)[https://en.wikipedia.org/wiki/Integer_square_root]; create a function in fn6args.S for this purpose and call it within fn6args.S.
6) << 10% BONUS >> fn8args: receives two arguments (the address of argc and the address of argv) and returns the sum of the ASCII values of the characters in the arguments passed to the function. While all the characters in all the arguments could be accumulated, the 4th and 5th arguments represent the lower-bound and upper-bound of the arguments to be accumulated.

  Here's an example:
  314 = fn(9, 8, 2, 7, 5, 3, 1, 4)  

  Explanation:
  The program is called as "./prog1 9 8 2 7 5 3 1 4". The 4th argument is 2, and the 5th argument is 7. These arguments "tell" the function to add the ASCII values of '8' (56), '2' (50), '7' (55), '5' (53), '3' (51), and '1' (49), which total 314. If the 4th argument is less than 1, or the 5th argument is greater than or equal to the value of argc, or if 4th argument is greater than the 5th argument, the function returns 0.

