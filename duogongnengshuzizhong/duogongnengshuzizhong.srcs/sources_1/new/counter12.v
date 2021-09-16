`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 19:52:10
// Design Name: 
// Module Name: counter12
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


module counter12(
    input clk,
    input reset,
    input en,
    output reg [7:0] Hour12
    );
    parameter S0=8'h12,S1=8'h01,S2=8'h02,S3=8'h03,S4=8'h04,S5=8'h05,S6=8'h06,S7=8'h07,S8=8'h08,S9=8'h09,S10=8'h10,S11=8'h11;
        always@(posedge clk or negedge reset)
        begin
            if(~reset)
                Hour12<=S0;
            else if(~en)
                Hour12<=Hour12;
            else
                case(Hour12)
                    S0:Hour12<=S1;
                    S1:Hour12<=S2;
                    S2:Hour12<=S3;
                    S3:Hour12<=S4;
                    S4:Hour12<=S5;
                    S5:Hour12<=S6;
                    S6:Hour12<=S7;
                    S7:Hour12<=S8;
                    S8:Hour12<=S9;
                    S9:Hour12<=S10;
                    S10:Hour12<=S11;
                    S11:Hour12<=S0;
                endcase
        end
endmodule
