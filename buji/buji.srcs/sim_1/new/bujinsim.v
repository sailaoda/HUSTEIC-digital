`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 13:07:58
// Design Name: 
// Module Name: bujinsim
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


module bujinsim(

    );
    reg clk,M,reset;
    wire [2:0] Y;
    bujin U0(M,reset,clk,Y);
    parameter PERIOD=10;
    always 
        begin
            clk=1'b0;
            #(PERIOD/2) clk=1'b1;
            #(PERIOD/2);
        end
    initial 
    begin
    reset=0;
    #5
    reset=1; 
    M=0;
    #160;
    reset=0;
    #40
    reset=1;
    M=1;
    #160;
    reset=0;
    end
endmodule
