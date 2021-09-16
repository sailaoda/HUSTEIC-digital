`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/16 22:57:01
// Design Name: 
// Module Name: top_clock
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


module top_clock(
    input clk,
    input reset,
    input en,
    output led,
    input Adj_Min,
    input Adj_Hour,
    input timemode,
    output beep,
    output [7:0] HEX,
    output [7:0] AN
    );
    wire [7:0] Hour12,Hour,Minute,Second;
    wire MinL_EN,MinH_EN,Hour_EN;
    supply1 Vdd;
    
//    reg clk1;  // 4Hz时钟
//    reg [23:0] cnt4;  // 产生4Hz时钟计数器
//    always @(posedge clk) //产生4Hz时钟
//        if (cnt4 >= 12499999) 
//            begin cnt4 <= 24'b0;  clk1= ~clk1; end
//        else cnt4 <= cnt4+ 1;

    reg clk1;  // 1Hz时钟
    reg [25:0] cnt1;  // 产生1Hz时钟计数器
    always @(posedge clk) //产生1Hz时钟
    if (cnt1 >= 49999999) 
    begin cnt1 <= 26'b0;  clk1 = ~clk1; end
    else cnt1 <= cnt1+ 1;
    
    counter10 S0(clk1,reset,en,Second[3:0]);
    counter6 S1(clk1,reset,(Second[3:0]==4'b1001),Second[7:4]);
    counter10 M0(clk1,reset,MinL_EN,Minute[3:0]);
    counter6 M1(clk1,reset,MinH_EN,Minute[7:4]);
    assign MinL_EN=Adj_Min?Vdd:(Second==8'h59);
    assign MinH_EN=(Adj_Min&&(Minute[3:0]==4'h9))||((Minute[3:0]==4'h9)&&(Second==8'h59));
    counter24 H0(clk1,reset,led,Hour_EN,Hour);
    counter12 H1(clk1,reset,Hour_EN,Hour12);
    assign Hour_EN=Adj_Hour?Vdd:(Minute==8'h59)&&(Second==8'h59);
    baoshi B0(clk1,Hour,Minute,Second,beep);
    
    SEG7_LUT U0(clk,timemode,Hour,Hour12,Minute,Second,HEX,AN);
endmodule
