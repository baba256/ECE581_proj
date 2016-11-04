///////////////////////////////////////////////////////////////////
//Design
/*
==============================
Project 2
ECE 581 - ASIC Design 
==============================
 
------------------------------------------------------------------
 Author: Yadnesh Samant
 Module Name: hw2_fifo_controller
 Date:10/28/2016
 Description: This is the design for the FIFO Controller. [D3]
 Reference: http://www.asic-world.com/examples/verilog/syn_fifo.html
---------------------------------------------------------------------
 
*/
//////////////////////////////////// ///////////////////////////////
module hw2_fifo_controller(
			output logic 		wr_en, rd_en, full, emp,
			output logic [4:0] 	wr_ptr, rd_ptr,
			input  logic 		rst, clk, wr, rd			
);

logic [5:0] diff_count;

//Full and empty signals
emp  = (diff_count == 1'b0);
full = (diff_count == 6'd31); //As there are 32 locations, difference should not be more than 31

//synchronous FIFO Write Port
always_ff @(posedge clk) begin
		if (rst) begin
			wr_ptr <= 1'b0;
		end
		else begin
			if(wr == 1'b1 && full !=1'b1) begin
				wr_ptr <= wr_ptr + 1'b1;
				wr_en  <= 1'b1;
			end
			else begin
				wr_ptr <= wr_ptr;
				wr_en  <= 1'b0;
			end
		end
end


//synchronous FIFO Read Port
always_ff @(posedge clk) begin
		if(rst) begin
			rd_ptr <= 1'b0;
		end
		else begin
			if(rd == 1'b1 && emp != 1'b1) begin
				rd_ptr <= rd_ptr + 1'b1;
				rd_en  <= 1'b1;
			end
			else begin
				rd_ptr <= rd_ptr;
				rd_en  <= 1'b0;
			end
		end
end

//Counter to track the read and write differences
always_ff @(posedge clk) begin
		if(rst)
			diff_count <= '0;
		else if (rd && wr) 
				diff_count <= diff_count; //If read and write happens at same time, no change
		else if (rd && emp != 1'b1)
				diff_count <= diff_count -1'b1;
		else if (wr && full != 1'b1)
				diff_count <= diff_count +1'b1;
		end
end

endmodule