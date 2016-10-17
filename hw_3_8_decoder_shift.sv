///////////////////////////////////////////////////////////////////
//Design
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_3_8_decoder
 Date:10/10/2016
 Description: This is the design of 3:8 decoder using shift operator. [2.2]
---------------------------------------------------------------------
 
*/
//////////////////////////////////// ///////////////////////////////
module hw_3_8_decoder_shift(
					  input  logic EN,
					  input  logic [2:0] s,
					  output logic [7:0] q);
//Temporary value to hold q[0]
logic [7:0] q_temp = 8'b1; 
always_comb
   begin
		if(EN == 1) begin
			q = q_temp << s;
		end
		else
		q=8'b0;
	end
endmodule