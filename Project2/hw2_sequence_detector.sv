///////////////////////////////////////////////////////////////////
//Design
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw2_sequence_detector
 Date:11/01/2016
 Description: This is sequence detector to detect pattern "0111 0100"
------------------------------------------------------------------
*/
///////////////////////////////////////////////////////////////////
module hw2_sequence_detector(
						output logic d_out,
						input  logic clk, reset, d_in
);
//Pattern for match: 0111 0100
enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6,S7} state, nextstate;

//State Register Logic
always_ff @(posedge clk) begin
        //$display("%t MON2            state: %b", $time, state);
		if(reset)
			state <= S0;
		else
			state <= nextstate;
end

//Output and Next State Logic
always_comb begin
	d_out = 1'b0;
	case(state)
			S0: nextstate = (d_in == 1'b0) ? S1: S0;
			S1: nextstate = (d_in == 1'b1) ? S2: S1;
			S2: nextstate = (d_in == 1'b1) ? S3: S0;
			S3: nextstate = (d_in == 1'b1) ? S4: S0;
			S4: nextstate = (d_in == 1'b0) ? S5: S0;
			S5: nextstate = (d_in == 1'b1) ? S6: S0;
			S6: nextstate = (d_in == 1'b0) ? S7: S0;
			S7: begin
					nextstate = S0;
					d_out     = (d_in == 1'b0) ? 1'b1:1'b0;
				end
			default : nextstate = S0;
	endcase
end

always @(posedge clk) begin
	if(d_out == 1'b1) 
		$display("%t The Sequence Matched",$time);
	else
		$display("%t The Sequence Non-Matched",$time);
end

endmodule