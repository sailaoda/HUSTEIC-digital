`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/15 10:32:22
// Design Name: 
// Module Name: clk_div_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div_sim;

	// Inputs
	reg clk_100m;
	reg cr;

	// Outputs
	wire clk_1k;
	wire clk_5h;
	wire clk_1hz;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk_100m(clk_100m), 
		.clk_1k(clk_1k), 
		.clk_5h(clk_5h), 
		.clk_1hz(clk_1hz), 
		.cr(cr)
	);
	parameter PERIOD =10;
	always begin
	clk_100m=1'b0;
	#(PERIOD/2)clk_100m=1'b1;
	#(PERIOD/2);
	end
	initial begin
		// Initialize Inputs
		clk_100m = 0;
		cr = 0;
		// Wait 100 ns for global reset to finish
	 forever
    begin
		#10000000;
      cr=0;
		#1000;
		cr=1;
		end
		// Add stimulus here

	end
      
endmodule
