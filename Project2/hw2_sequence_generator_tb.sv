module hw2_sequence_generator_tb();
logic clk,start,data_out;

//Declaring sequence to be tested
logic [17:0] seq1 = 18'b11110001111111100;
logic [17:0] seq2 = 18'b11111111111111100;
logic [35:0] seq_app = {seq1,seq2};
//logic [16:0] next_seq1;

//DUT Instantiation
hw2_sequence_generator seq_DUT(.*);
initial begin
	clk 	  = 1'b0;
	#1000 $stop;
end
always_ff @(posedge clk) begin
	seq_app <= {seq_app[34:0],1'b0};
end

assign start = seq_app[35];

always #10 clk = ~clk; 

endmodule
