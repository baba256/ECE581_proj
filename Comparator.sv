`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/17/2016 11:09:12 AM
// Design Name: Hiral Barot
// Module Name: Comparator
// Project Name: Project 1 -ECE 581 (Question 2.4)
// Description: N-bit  comparator  is  used  to  to  determine  
//whether  two  signals  have  equal  values
//Reference:Digital System Design with System Verilog Section 4.6 by Mark Zwolinski
//////////////////////////////////////////////////////////////////////////////////
module Comparator#(parameter N=3)
(output logic eqo,input logic [N-1:0]x,y);

logic eqi;
integer i;
always_comb
    begin
		eqi=1'b1;
		for(i =0;i<N;i=i+1) begin
			eqi=~(x[i]^y[i])& eqi;
		end	
		eqo=eqi;
    end          
endmodule
