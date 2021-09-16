`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 13:08:08
// Design Name: 
// Module Name: c10
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

module c10(
    input clk,
    input cr,
    output rco,
    input en,
    output [3:0] bcd10
    );
    reg [3:0] bcd10r;
    assign rco=(bcd10==9)?1'b1:1'b0;//进位信号
    assign bcd10=bcd10r;
    always @(posedge clk or negedge cr)//10进制计数
        if(!cr)
            bcd10r<=4'b0000;
        else if (en)
            if(bcd10r!=9)
                bcd10r<=bcd10r+1'b1;
            else
                bcd10r<=0;
        else bcd10r<=bcd10r;
endmodule
