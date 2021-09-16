`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:29:37
// Design Name: 
// Module Name: bcd_7seg
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
//BCD7Î»ÊýÂë¹Ü


module bcd_7seg(
    input [3:0] bcd,
    output [6:0] seg
    );
    reg [6:0]seg1;
    assign seg=seg1;
    always@(bcd)
        case(bcd)
            4'b0000:seg1<=7'b1000000;
            4'b0001:seg1<=7'b1111001;
            4'b0010:seg1<=7'b0100100;
            4'b0011:seg1<=7'b0110000;
            4'b0100:seg1<=7'b0011001;
            4'b0101:seg1<=7'b0010010;
            4'b0110:seg1<=7'b0000010;
            4'b1000:seg1<=7'b0000000;
            4'b1001:seg1<=7'b0010000;
            default:seg1<=7'b1111111;
        endcase
endmodule
