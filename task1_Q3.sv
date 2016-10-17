`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/15/2016 05:30:24 PM
// Design Name: Hiral Barot
// Module Name: task1
// Project Name: Project 1 ECE 581
// Description: Implementing sequential (always_comb) model of Two-out-of-Five 
//code word having a delay of 10ns
//////////////////////////////////////////////////////////////////////////////////
module task1
(input [4:0]CODE, output reg DET);

//wire [2:0] count;
wire out0,out1,out2,out3,out4;//negation of input 

wire op1,op2,op3,op4,op5,op6,op7,op8,op9,op10,op11;//output for combination of nand gates

wire  a,b,c,d,e,f,g,h,i,j; //not the o/p of nand gates

wire k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,k10; //op for nand gates

not u1(out0,CODE[0]);
not u2(out1,CODE[1]);
not u3(out2,CODE[2]);
not u4(out3,CODE[3]);
not u5(out4,CODE[4]);

//abc'd'e'+acb'd'e'.....
//creating AND Gate(two nand gates) using not and nand gates
nand x1(op1,CODE[0],CODE[1],out2,out3,out4);
nand x2(op2,CODE[0],CODE[2],out1,out3,out4);
nand x3(op3,CODE[0],CODE[3],out1,out2,out4);
nand x4(op4,CODE[0],CODE[4],out1,out2,out3);
nand x5(op5,CODE[1],CODE[2],out0,out3,out4);
nand x6(op6,CODE[1],CODE[3],out0,out2,out4);
nand x7(op7,CODE[1],CODE[4],out0,out2,out3);
nand x8(op8,CODE[2],CODE[3],out0,out1,out4);
nand x9(op9,CODE[2],CODE[4],out0,out1,out3);
nand x10(op10,CODE[3],CODE[4],out0,out1,out2);

nand x11(k0,op1,op1);
nand x12(k1,op2,op2);
nand x13(k2,op3,op3);
nand x14(k3,op4,op4);
nand x15(k4,op5,op5);
nand x16(k5,op6,op6);
nand x17(k6,op7,op7);
nand x18(k7,op8,op8);
nand x19(k8,op9,op9);
nand x20(k9,op10,op10);

//Creating OR Gate using not and nand gates
not u6(a,k0);
not u7(b,k1);
not u8(c,k2);
not u9(d,k3);
not u10(e,k4);
not u11(f,k5);
not u12(g,k6);
not u13(h,k7);
not u14(i,k8);
not u15(j,k9);

nand x21(op11,a,b,c,d,e,f,g,h,i,j);

assign DET = (op11 == 1'b1)? 1'b0:1'b1;

endmodule