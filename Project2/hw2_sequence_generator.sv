module hw2_sequence_generator(
						input  logic clk,
						input  logic start,
						output logic data_out);
typedef enum logic [3:0] {S0,S1,S2,S3,S4,S5,S6,S7,S8} statetype;
statetype state, nextstate;

//StateRegister logic
always_ff @(posedge clk)
	begin
		state <= nextstate;
	end
	
//Next state and output logic
always_comb
	begin
		data_out = 1'b0;
	case(state)
		S0:
		   if(start)
			    nextstate = S1;
		   else 
				nextstate = S0;
		S1:
		   if(start)
			    nextstate = S2;
		   else 
				nextstate = S0;
		S2:
		   if(start)
			    nextstate = S3;
		   else 
				nextstate = S0;
		S3:
		   if(start)
			    nextstate = S4;
		   else 
				nextstate = S0;
		S4:
		   if(start)
			    nextstate = S5;
		   else 
				nextstate = S0;
		S5:
		   if(start)
			    nextstate = S6;
		   else 
				nextstate = S0;
		S6:
		   if(start)
			    nextstate = S7;
		   else 
				nextstate = S0;
		S7:
		   begin
				data_out = 1'b1;
				if(start)
					nextstate = S8;
				else 
					nextstate = S0;
		   end
		S8:
		   if(start)
			    nextstate = S7;
		   else 
				nextstate = S0;
		default:
			nextstate = S0;
	endcase
	end
endmodule