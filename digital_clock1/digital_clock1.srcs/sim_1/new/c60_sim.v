`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 21:24:25
// Design Name: 
// Module Name: c60_sim
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


module c60_sim;

	// Inputs
	reg clk;
	reg en;
	reg cr;

	// Outputs
	wire rco;
	wire [3:0] bcd_t;
	wire [3:0] bcd_u;

	// Instantiate the Unit Under Test (UUT)
	c60 uut (
		.clk(clk), 
		.en(en), 
		.cr(cr), 
		.rco(rco), 
		.bcd_t(bcd_t),
		.bcd_u(bcd_u)
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
		en = 0;
		cr = 0;

		// Wait 100 ns for global reset to finish
		#100;
		en=1;
		cr=0;
		#100;
		cr=1;//正常计数
      #100000;
		en=0;
        
		// Add stimulus here

	end
      
endmodule
