`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 14:48:28
// Design Name: 
// Module Name: set_time
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

//ÄÖÖÓÄ£¿é
module set_time(
    input clk,
    input en,
    input set,
    input min_hour,
    output [3:0] bcd_mu,
    output [3:0] bcd_mt,
    output [3:0] bcd_hu,
    output [3:0] bcd_ht,
    input cr
    
    );
    wire en_min,en_hour,rco60;
    assign en_min=en&set&min_hour;
    assign en_hour=en&set&min_hour;
    c24 hour(clk,en_hour,cr,bcd_hu,bcd_ht);
    c60 minute(clk,en_min,cr,rco60,bcd_mt,bcd_mu);
endmodule

