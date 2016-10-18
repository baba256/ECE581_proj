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
 Description: This is the design of priority encoder. [2.3]
---------------------------------------------------------------------
 
*/
//////////////////////////////////// ///////////////////////////////
module hw_priority_encoder#(parameter n)
						(
						output logic [n-1:0]	  enc_op,
						input  logic [(2**n)-1:0] enc_in
						);
integer i;
always_comb
	begin
	    if(enc_in == 0)
			enc_op= 'x;
		else
			for(i=0;i<2**n;i=i+1) begin
				if(enc_in[i] == 1'b1)
					enc_op = i;
			end
	end
endmodule