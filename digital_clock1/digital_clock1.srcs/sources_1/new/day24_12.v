`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:08:15
// Design Name: 
// Module Name: day24_12
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
//24/12小时切换

module day24_12(
    input [3:0] bcd_ht,
    input [3:0] bcd_hu,
    input day_night,
    input day,
    output [3:0] bcd_hto,
    output [3:0] bcd_huo
    );
    wire modify,borrowu,mid_night_zero,noon;
    wire [3:0] bcd_temp_hu,bcd_temp_ht,bcd_temp_huo,bcd_temp_hto;
    assign noon=(bcd_ht==1)&&(bcd_hu==2);//中午12点
    assign modify =(bcd_ht>1)||(bcd_hu>2)&&(bcd_ht==1);//12点以后
    assign borrowu=(bcd_hu<2)?1:0;//BCD减法调整
    assign bcd_temp_hu=borrowu?(bcd_hu+4'b1010-4'b0010):(bcd_hu-4'b0010);
    assign bcd_temp_ht=borrowu?(bcd_ht-4'b0010):(bcd_ht-4'b0001);
    assign mid_night_zero=(bcd_ht==0)&&(bcd_hu==0);//零点
    assign bcd_temp_huo=(modify&day_night)?bcd_temp_hu:bcd_hu;
    assign bcd_temp_hto=(modify&day_night)?bcd_temp_ht:bcd_ht;
    assign {bcd_hto,bcd_huo}=(mid_night_zero&day_night)?8'h12:{bcd_temp_hto,bcd_temp_huo};//午夜十二点
    assign day=(modify|noon)&day_night;//12点以后标志下午
endmodule
