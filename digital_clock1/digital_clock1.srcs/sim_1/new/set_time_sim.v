`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 23:30:48
// Design Name: 
// Module Name: set_time_sim
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


module set_time_sim;
    //Inputs
    reg clk;
    reg en;
    reg min_hour;
    reg cr;
    
    //Outputs
    wire [3:0] bcd_mu;
    wire [3:0] bcd_mt;
    wire [3:0] bcd_hu;
    wire [3:0] bcd_ht;
    
    // Instantiate the Unit Under Test (UUT)
    set_time uut(
        .clk(clk),
        .en(en),
        .min_hour(min_hour),
        .bcd_mu(bcd_mu),
        .bcd_mt(bcd_mt),
        .bcd_hu(bcd_hu),
        .bcd_ht(bcd_ht),
        .cr(cr)
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
		min_hour = 0;

		// Wait 100 ns for global reset to finish
		#10;
		en=0;
		cr=1;
		min_hour=0;
		#1000000;// 
		en=1;
		min_hour=0;
		#100;// 
		min_hour=1;
		#100;//
		en=0;//    
		// Add stimulus here
	end
        

endmodule
