`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 13:37:19
// Design Name: 
// Module Name: counter10
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


module counter10(
    input clk1,
    input reset,
    input en,
    output reg [3:0] Q
    );
    always@(posedge clk1 or negedge reset)
        begin
            if(~reset)
                Q<=4'b0000;
            else if(~en) 
                Q<=Q;
            else if(Q==4'b1001) 
                Q<=4'b0000;
            else 
                Q<=Q+1;
        end
endmodule
