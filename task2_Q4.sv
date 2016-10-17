`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/17/2016 11:09:12 AM
// Design Name: Hiral Barot
// Module Name: task2_Q4
// Project Name: Project 1 -ECE 581
// Description: N-bit  comparator  is  used  to  to  determine  
//whether  two  signals  have  equal  values
//Reference: Digital System Design with System Verilog Section 4.6 by Mark Zwolinski
//////////////////////////////////////////////////////////////////////////////////
module Comparator #(parameter N=3)
(output logic [N-1:0] eqo,input logic [N-1:0]x,y);

logic eqi;

always_comb
    begin
    eqi=1'b1;
    for(int i =0;i<N;i++)
        eqi=~(x[i]^y[i])& eqi;
    eqo=eqi;
    end          
endmodule
