`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 17:17:19
// Design Name: 
// Module Name: baoshi
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


module baoshi(
    input clk,
    input [7:0] Hour,
    input [7:0] Minute,
    input [7:0] Second,
    output reg beep
    );
    always@(posedge clk)
        begin
            if(Minute==8'h00)
                begin
                    if(Second<=(Hour<<1))
                        begin
                            if(Second[0:0]==1)
                            beep=1'b1;
                            else
                            beep=1'b0;
                        end
                    else beep =1'b0;
                end
            else beep=1'b0;
        end
endmodule
