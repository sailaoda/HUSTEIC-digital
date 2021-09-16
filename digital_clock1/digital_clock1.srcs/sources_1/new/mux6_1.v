`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:19:09
// Design Name: 
// Module Name: mux6_1
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
//6Ñ¡Ò»¸´ÓÃÆ÷
module mux6_1(
    input [3:0] ch0,
    input [3:0] ch1,
    input [3:0] ch2,
    input [3:0] ch3,
    input [3:0] ch4,
    input [3:0] ch5,
    input [3:0] sel,
    output [3:0] bcd
    );
    reg [3:0]bcdr;
    assign bcd=bcdr;
    always @(sel)
    case(sel)
    4'b0000:bcdr<=ch0;
    4'b0001:bcdr<=ch1;
    4'b0010:bcdr<=ch2;
    4'b0011:bcdr<=ch3;
    4'b0100:bcdr<=ch4;
    4'b0101:bcdr<=ch5;
    default:bcdr<=4'b1111;
    endcase
endmodule
