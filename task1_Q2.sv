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

wire [2:0] count;

assign count=CODE[0]+CODE[1]+CODE[2]+CODE[3]+CODE[4];
  
assign  DET = (count == 3'd2)? 1'b0:1'b1;
 
endmodule