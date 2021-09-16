`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/13 12:33:29
// Design Name: 
// Module Name: top_clocksim
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


module top_clocksim(

    );
     reg clk,reset,en,Adj_Min,Adj_Hour,timemode;
     wire led,beep;
     wire [7:0] HEX,An;
     top_clock K0(clk,reset,en,led,Adj_Min,Adj_Hour,timemode,beep);
     parameter PERIOD =10;
     always begin
         clk=1'b0;
         #(PERIOD/2) clk=1'b1;
         #(PERIOD/2);
     end 
     initial
     begin
        reset=0;
        en=0;
        Adj_Min=0;
        Adj_Hour=0;
        timemode=0;
        #20
        reset=1;
        en=1;
        Adj_Min=0;
        Adj_Hour=0;
        timemode=0;
        #200
        reset=1;
        en=1;
        Adj_Min=1;
        Adj_Hour=1;
        timemode=0;
        #230
        reset=1;
        en=1;
        Adj_Min=1;
        Adj_Hour=0;
        timemode=0;
        #360
        reset=1;
        en=1;
        Adj_Min=0;
        Adj_Hour=0;
        timemode=0;
        #600
        reset=0;
        en=0;
        Adj_Min=0;
        Adj_Hour=0;
        timemode=0;
        #20
        reset=1;
        en=1;
        Adj_Min=1;
        Adj_Hour=1;
        timemode=0;
        #80
        reset=1;
        en=1;
        Adj_Min=1;
        Adj_Hour=0;
        timemode=0;
        #500;
        reset=1;
        en=1;
        Adj_Min=0;
        Adj_Hour=0;
        timemode=0;
     end
endmodule
