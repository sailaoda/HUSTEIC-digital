`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 21:09:43
// Design Name: 
// Module Name: c6_sim
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


module c6_sim;

	// Inputs
	reg clk;
	reg cr;
	reg en;

	// Outputs
	wire rco;
	wire [3:0] bcd6;

	// Instantiate the Unit Under Test (UUT)
	c6 uut (
		.clk(clk), 
		.cr(cr), 
		.rco(rco), 
		.en(en), 
		.bcd6(bcd6)
	);
	parameter PERIOD =10;
	always begin
	clk=1'b0;
	#(PERIOD/2)clk=1'b1;
	#(PERIOD/2);
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		cr = 0;
		en = 0;

		// Wait 100 ns for global reset to finish
		#100;
		cr=0;
		en=1;
		#100;
		cr=1;//正常计数
      #100000;
		en=0;
        
		// Add stimulus here

	end
      
endmodule
