`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 13:43:59
// Design Name: 
// Module Name: counter6
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


module counter6(
    input clk,
    input reset,
    input en,
    output reg [3:0] Q
    );
    always@(posedge clk or negedge reset)
        begin
            if(~reset)
                Q<=4'b0000;
            else if(~en) 
                Q<=Q;
            else if(Q==4'b0101) 
                Q<=4'b0000;
            else 
                Q<=Q+1;
        end
endmodule
