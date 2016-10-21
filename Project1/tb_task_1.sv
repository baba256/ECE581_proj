`timescale 1ns / 1ns
/////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/15/2016 05:30:24 PM
// Design Name: Hiral Barot
// Module Name: tb_task_1
// Project Name: Project 1 - Task1 testbench Task1
//////////////////////////////////////////////////////////////////////////////////
module tb_task_1;

wire simulated_DET;
reg [4:0] test_code;

task1 test_instantiate (.CODE(test_code), .DET(simulated_DET));

initial 
begin
$display("Time   Test_Code  simulated_DET  \n");
$monitor($time," %b  %b  ",test_code, simulated_DET);
end

initial 
begin
{test_code}= 5'b00000;
#15 {test_code}= 5'b11000;
#30 {test_code}= 5'b01100;
#45 {test_code}= 5'b00011;
#60 {test_code}= 5'b00101;
#75 {test_code}= 5'b10100;
#90 {test_code}= 5'b01010;
#105 {test_code}= 5'b11111;
#120 {test_code}= 5'b00000;
#135 {test_code}= 5'b11110;
#150 {test_code}= 5'b00001;
$stop;
end

endmodule
