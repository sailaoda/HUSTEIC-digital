`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/15 10:25:04
// Design Name: 
// Module Name: mux6_1_sim
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


module mux6_1_sim;

    // Inputs
	reg [3:0] ch0;
	reg [3:0] ch1;
	reg [3:0] ch2;
	reg [3:0] ch3;
	reg [3:0] ch4;
	reg [3:0] ch5;
	reg [3:0] sel;

	// Outputs
	wire [3:0] bcd;

	// Instantiate the Unit Under Test (UUT)
	mux6_1 uut (
		.ch0(ch0), 
		.ch1(ch1), 
		.ch2(ch2), 
		.ch3(ch3), 
		.ch4(ch4), 
		.ch5(ch5), 
		.sel(sel), 
		.bcd(bcd)
	);

	initial begin
		// Initialize Inputs
        ch0 = 0;
		ch1 = 0;
		ch2 = 0;
		ch3 = 0;
		ch4 = 0;
		ch5 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100000;
		ch0 = 4'b0000;
		ch1 = 4'b0001;
		ch2 = 4'b0010;
		ch3 = 4'b0011;
		ch4 = 4'b0100;
		ch5 = 4'b0101;	 
	    sel=4'b0000;
	    #100000;
        sel=4'b0001;
	    #100000;
        sel=4'b0010;
	    #100000;
        sel=4'b0011;
	    #100000;
        sel=4'b0100;
	    #100000;
        sel=4'b0101;
	    #100000;
        sel=4'b0111;   
		// Add stimulus here
	end
      
endmodule

