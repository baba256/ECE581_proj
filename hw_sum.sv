///////////////////////////////////////////////////////////////////
//Design
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_sum_tb
 Date:10/10/2016
 Description: This is the Design of full adder. [2.1]
---------------------------------------------------------------------
 
*/
///////////////////////////////////////////////////////////////////
module hw_sum(
	output logic S,Co,
	input  logic A,B,C);
always_comb
  begin
	Co = (A & B) | (B & C) | (A & C);
	S  = (~A & ~B & C) | (~A & B & ~C) | (A & ~B & ~C) | (A & B & C);
  end
endmodule