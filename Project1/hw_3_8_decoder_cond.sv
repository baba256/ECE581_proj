///////////////////////////////////////////////////////////////////
//Design
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw_3_8_decoder_cond
 Date:10/10/2016
 Description: This is the design of 3:8 decoder using conditional operators. [2.2]
---------------------------------------------------------------------
*/
///////////////////////////////////////////////////////////////////
module hw_3_8_decoder_cond(
					  input  logic EN,
					  input  logic [2:0] s,
					  output logic [7:0] q);
always_comb
   begin
		if(EN == 1)begin
			q[0] = (s == 3'd0) ? 1'b1 : 1'b0;
			q[1] = (s == 3'd1) ? 1'b1 : 1'b0;
			q[2] = (s == 3'd2) ? 1'b1 : 1'b0;
			q[3] = (s == 3'd3) ? 1'b1 : 1'b0;
			q[4] = (s == 3'd4) ? 1'b1 : 1'b0;
			q[5] = (s == 3'd5) ? 1'b1 : 1'b0;
			q[6] = (s == 3'd6) ? 1'b1 : 1'b0;
			q[7] = (s == 3'd7) ? 1'b1 : 1'b0;
		end
		else
		q=8'b0;
	end
endmodule