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

reg [2:0] count_one = 3'b0;
reg [2:0] count_zero = 3'b0;

always_comb
begin
count_one = 0;
count_zero = 0;

 count_zero = CODE[0] ? count_zero : (count_zero + 1'b1); 
 count_zero = CODE[1] ? count_zero : (count_zero + 1'b1); 
 count_zero = CODE[2] ? count_zero : (count_zero + 1'b1); 
 count_zero = CODE[3] ? count_zero : (count_zero + 1'b1); 
 count_zero = CODE[4] ? count_zero : (count_zero + 1'b1); 
 
 count_one = CODE[0] ? (count_one + 1'b1) : count_one;
 count_one = CODE[1] ? (count_one + 1'b1) : count_one;     
 count_one = CODE[2] ? (count_one + 1'b1) : count_one;    
 count_one = CODE[3] ? (count_one + 1'b1) : count_one; 
 count_one = CODE[4] ? (count_one + 1'b1) : count_one;
  
 if ((count_one == 3'd2 ) && (count_zero ==3'd3 ))
    DET = 1'b0;  
 else            
    DET = 1'b1;       //Error indication   

 end
endmodule
