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
 Description: This is the design of 3:8 decoder using Boolean operators. [2.2]
---------------------------------------------------------------------
 
*/
///////////////////////////////////////////////////////////////////
module hw_3_8_decoder(
					  input  logic EN,
					  input  logic [2:0] s,
					  output logic [7:0] q);
always_comb
   begin
		if(EN == 1)begin
			q[0] = (~s[2] && ~s[1] && ~s[0]);
			q[1] = (~s[2] && ~s[1] &&  s[0]);
			q[2] = (~s[2] &&  s[1] && ~s[0]);
			q[3] = (~s[2] &&  s[1] &&  s[0]);
			q[4] = ( s[2] && ~s[1] && ~s[0]);
			q[5] = ( s[2] && ~s[1] &&  s[0]);
			q[6] = ( s[2] &&  s[1] && ~s[0]);
			q[7] = ( s[2] &&  s[1] &&  s[0]);
		end
		else
		q=8'b0;
	end
endmodule