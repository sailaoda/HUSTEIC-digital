`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/15 10:31:23
// Design Name: 
// Module Name: scan_disp_sim
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


module scan_disp_sim;

	// Inputs
	reg clk;
	reg cr;
	reg en;
	reg [3:0] ch0;
	reg [3:0] ch1;
	reg [3:0] ch2;
	reg [3:0] ch3;
	reg [3:0] ch4;
	reg [3:0] ch5;

	// Outputs
	wire [6:0] seg;
	wire [7:0] pos;

	// Instantiate the Unit Under Test (UUT)
	scan_disp uut (
		.clk(clk), 
		.cr(cr), 
		.en(en), 
		.ch0(ch0), 
		.ch1(ch1), 
		.ch2(ch2), 
		.ch3(ch3), 
		.ch4(ch4), 
		.ch5(ch5), 
		.seg(seg), 
		.pos(pos)
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
		ch0 = 0;
		ch1 = 0;
		ch2 = 0;
		ch3 = 0;
		ch4 = 0;
		ch5 = 0;

		// Wait 100 ns for global reset to finish
	   #100;
		ch0 = 4'b0000;
		ch1 = 4'b0001;
		ch2 = 4'b0010;
		ch3 = 4'b0011;
		ch4 = 4'b0100;
		ch5 = 4'b0101;	 
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