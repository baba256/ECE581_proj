///////////////////////////////////////////////////////////////////
//TestBench
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_priority_encoder_tb
 Date:10/10/2016
 Description: This is the TestBench for priority encoder. [2.3]
---------------------------------------------------------------------
 
*/
///////////////////////////////////////////////////////////////////
module hw_priority_encoder_tb();
parameter n=3;
logic 			   clk;
logic [n-1:0]  	   enc_op;
logic [(2**n)-1:0] enc_in;

//Initializing the DUT 
hw_priority_encoder #(.n(3)) hw_encoder(.*);

initial begin
         clk    = 1'b1;
		 enc_in = 8'd0;
	#50  enc_in = 8'b10000000;
	#50  enc_in = 8'b11000000;
	#50  enc_in = 8'b01000000;
	#50  enc_in = 8'b00100000;
	#50  enc_in = 8'b01001000;
	#50  enc_in = 8'b00010000;
	#50  enc_in = 8'b00001000;
	#50  enc_in = 8'b00000100;
	#50  enc_in = 8'b00000010;
	#50  enc_in = 8'd0;
	#50  enc_in = 8'b00101010;
	#100 $stop;
end

always #10 clk = ~clk;

endmodule

