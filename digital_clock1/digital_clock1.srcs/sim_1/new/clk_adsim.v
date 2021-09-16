`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:59:02
// Design Name: 
// Module Name: clk_adsim
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
/////////////////////////////////////////////////////////////////////////////////
module clk_adsim;

	// Inputs
	reg clk;
	reg adjust;
	reg cr;
	reg min_hour;

	// Outputs
	wire [3:0] bcd_su;
	wire [3:0] bcd_st;
	wire [3:0] bcd_mu;
	wire [3:0] bcd_mt;
	wire [3:0] bcd_hu;
	wire [3:0] bcd_ht;

	// Instantiate the Unit Under Test (UUT)
	clock_adjust uut (
		.clk(clk), 
		.adjust(adjust), 
		.cr(cr), 
		.min_hour(min_hour), 
		.bcd_su(bcd_su), 
		.bcd_st(bcd_st), 
		.bcd_mu(bcd_mu), 
		.bcd_mt(bcd_mt), 
		.bcd_hu(bcd_hu), 
		.bcd_ht(bcd_ht)
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
		adjust = 0;
		cr = 0;
		min_hour = 0;

		// Wait 100 ns for global reset to finish
		#10;
		adjust=0;
		cr=1;
		min_hour=0;
		#1000000;//正常计时100 0000ns
		adjust=1;
		min_hour=0;
		#100;//校时100ns
		min_hour=1;
		#100;//校分100ns
		adjust=0;//恢复正常计时      
		// Add stimulus here
	end     
endmodule