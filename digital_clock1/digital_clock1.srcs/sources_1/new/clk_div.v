`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:40:44
// Design Name: 
// Module Name: clk_div
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
//ʱ�ӷ�Ƶģ��

module clk_div(
    input clk_100m,
    output clk_1k,
    output clk_5h,
    output clk_1hz,
    input cr
    );
    reg [15:0]count1k;
    reg [8:0]count1hz;
    reg clk_1kr,clk_5hr,clk_1hzr;
    assign clk_1k=clk_1kr;
    assign clk_5h=clk_5hr;
    assign clk_1hz=clk_1hzr;
    always@(posedge clk_100m or negedge cr)
    if(!cr)
    begin
    count1k<=16'h0000;
    clk_1kr<=1'b0;
    end
    else begin
    if(count1k==16'd49999)//100Mhz;100000��Ƶ�õ�1khz�źţ�
    //if (count1k==4)
    begin 
    count1k<=0;
    clk_1kr<= ~clk_1kr;
    end
    else count1k<=count1k+1'b1;
    end
    always@(posedge clk_1k or negedge cr)
    if(!cr)
    begin
    count1hz<=9'h000;
    clk_1hzr<=1'b0;
    end
    else begin
    if(count1hz==9'd499)//1000hz1000��Ƶ�õ�1hz
    //if (count1hz==5)
    begin 
    count1hz<=0;
    clk_1hzr<= ~clk_1hzr;
    end
    else count1hz<=count1hz+1'b1;
    end
    always@(posedge clk_1k or negedge cr)
    if(!cr)
    begin
    clk_5hr<=1'b0;
    end
    else
    clk_5hr<= ~clk_5hr;//1khz2��Ƶ�õ�500hz�ź�    
endmodule
