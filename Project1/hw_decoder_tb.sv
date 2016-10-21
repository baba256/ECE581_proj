///////////////////////////////////////////////////////////////////
//TestBench
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_decoder_tb
 Date:10/10/2016
 Description: This is the TestBench for verifying the all three decoder 
			implementation. [2.2]
---------------------------------------------------------------------
 
*/
///////////////////////////////////////////////////////////////////
module hw_decoder_tb();
logic clk;
logic [2:0] s;
logic EN;
logic [7:0] q1;
logic [7:0] q2;
logic [7:0] q3;

//Intstantiating the DUT with Boolean operators
hw_3_8_decoder hw_decoder_1(.s(s),.EN(EN),.q(q1));

//Intstantiating the DUT with conditional operators
hw_3_8_decoder_cond hw_decoder_2(.s(s),.EN(EN),.q(q2));

//Intstantiating the DUT with Shift operators
hw_3_8_decoder_shift hw_decoder_3(.s(s),.EN(EN),.q(q3));

initial begin
            clk = 1'b0;
			EN  = 1'd0;
	#30     s   = 3'd7;
	#30		EN  = 1'd1;
	#30		s   = 3'd0;
	#30	    s   = 3'd1;
	#30	    s   = 3'd2;
	#30	    s   = 3'd3;
	#30	    s   = 3'd4;
	#30	    s   = 3'd5;
	#30	    s   = 3'd6;
	#30	    s   = 3'd7;
	#100    $stop;
end

always #10 clk= ~clk;
endmodule