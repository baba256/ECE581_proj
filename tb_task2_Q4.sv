`timescale 1ns / 1ns
/////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/15/2016 05:30:24 PM
// Design Name: Hiral Barot
// Module Name: tb_task_1
// Project Name: Project 1 - Task1 testbench Task1
//////////////////////////////////////////////////////////////////////////////////
module tb_task_1;

logic [2:0] x,y;
logic eqo;

Comparator test_instantiate (.*);

initial 
begin
x = 3'b000;
y = 3'b000;
#20;
x = 3'b001;
y = 3'b010;
#20;
x = 3'b100;
y = 3'b100;
end

endmodule