`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 13:15:16
// Design Name: 
// Module Name: c60
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


module c60(
    input clk,
    input en,
    input cr,
    output rco,
    output [3:0] bcd_t,
    output [3:0] bcd_u
    );
    wire rco_u,rco_t;
    assign rco = rco_t&rco_u;        //60位进位信号
    c10 units(clk,cr,rco_u,en,bcd_u);
    c6 tens(clk,cr,rco_t,rco_u&en,bcd_t);
endmodule
