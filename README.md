# VerilogHDL-32bit_ALU
Realization of 32-bit ALU performing 15 different arithmetic/logical operations.

Author: Vinh TA

Description: This ALU takes 32-bit inputs A and B, 4-bit operation selector and 1-bit Cin. Outputs 32-bit result and a Cout.

List of operation selected by S signal:

0000: no op;
0001: A+B+Cin;
0010: A-B+Cin;
0011: A * B 
0100: A / B
0101: Shift left by 1 of input A
0110: Shift right by 1 of input A
0111: Shift left by 1 with wrap-around of last bit
1000: Shift right by 1 with wrap-around of first bit
1001: A & B (AND logical)
1010: A | B (OR logical)
1011: A ^ B (XOR logical)
1100: ~(A & B) (NAND logical)
1101: ~(A | B) (NOR logical)
1110: Assert if A < B
1111: Assert if A != B

Notes: Compile using Icarus Verilog (iverilog).
