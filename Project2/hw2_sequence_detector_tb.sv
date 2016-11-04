///////////////////////////////////////////////////////////////////
//TestBench
/*
==============================
Project 1
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw2_sequence_detector_tb
 Date:11/01/2016
 Description: This is Test Bench sequence detector to detect pattern "0111 0100"
------------------------------------------------------------------
*/
///////////////////////////////////////////////////////////////////
module hw2_sequence_detector_tb();
logic d_out, clk, reset, d_in;

//Pattern to be tested
logic [19:0] pattern_temp = 20'b0010100111010001101;

//DUT Instantiation
hw2_sequence_detector seq_detect(.*);

initial begin
		  clk   = 1'b0;
		  reset = 1'b1;
	#20   reset = 1'b0;
	#500  $stop;
end

always_ff @(posedge clk) begin
	pattern_temp = {pattern_temp[14:0],1'b0};
	//$display("%t MON1            d_in: %b d_out: %b", $time, d_in, d_out);
end

//Giving inputs to the DUT
assign d_in = pattern_temp [15];

always #20 clk = ~clk;
endmodule