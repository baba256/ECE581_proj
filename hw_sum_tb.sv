///////////////////////////////////////////////////////////////////
//TestBench
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_sum_tb
 Date:10/10/2016
 Description: This is the TestBench for verifying the sum and carry opperation
			of full adder. [2.1]
---------------------------------------------------------------------
 
*/
///////////////////////////////////////////////////////////////////
`timescale 1ns /1ps
module hw_sum_tb();
logic clk;
logic S,Co;
logic A,B,C;
logic [1:0] sum_tb;
logic [1:0] actual;
integer i;

//Intstantiating the DUT
hw_sum test_sum(.*);

//Funtion declaration
function reg[1:0] exp_sum_tb;
   input a,b,c;
   begin
	exp_sum_tb = a + b + c;
   end
endfunction

initial 
	begin
	    clk=0;
		for(i=0;i<8;i=i+1)
			begin
			    #50{A,B,C} = i;
			    #10 sum_tb = exp_sum_tb(A,B,C);
				actual = {Co,S};
			    if(sum_tb == actual)
					$display("The test has been passed at time", $time);
			    else
					$display("Mismatch found at time",$time," Expected : %b, Calculated : %b",sum_tb, actual);
			end
		#100 $stop;
	end
always #10 clk = ~clk;
endmodule