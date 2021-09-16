`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/15 10:13:14
// Design Name: 
// Module Name: day24_12_sim
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


module day24_12__sim;

	// Inputs
	reg [3:0] bcd_hu;
	reg [3:0] bcd_ht;
	reg day_night;

	// Outputs
	wire day;
	wire [3:0] bcd_hto;
	wire [3:0] bcd_huo;

	// Instantiate the Unit Under Test (UUT)
	day24_12 uut (
		.bcd_hu(bcd_hu), 
		.bcd_ht(bcd_ht), 
		.day_night(day_night), 
		.day(day), 
		.bcd_hto(bcd_hto), 
		.bcd_huo(bcd_huo)
	);

	initial begin
		// Initialize Inputs
		bcd_hu = 0;
		bcd_ht = 0;
		day_night = 0;

		// Wait 100 ns for global reset to finish
		#100;
		bcd_hu = 4'b0010;
		bcd_ht = 4'b0001;
		day_night = 0;	
		#1000000;		
		day_night = 1;	
        
		// Add stimulus here

	end
      
endmodule
