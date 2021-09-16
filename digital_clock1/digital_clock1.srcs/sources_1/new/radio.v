`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/11 15:16:51
// Design Name: 
// Module Name: radio
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
//�µ�̨��ʱ
module radio(
    input [3:0] bcd_su,
    input [3:0] bcd_st,
    input [3:0] bcd_mu,
    input [3:0] bcd_mt,
    input [3:0] bcd_hu,
    input [3:0] bcd_ht,
    input clk_1k,
    input clk_5h,
    input clk_1hz,
    input en,
    input cr,
    input day_night,
    output radio_alarm
    );
    wire ld,min_equ;
    wire equ,grt,less,noon;
    wire [3:0]bcd_temp_hu,bcd_temp_ht;
    assign noon=({bcd_ht,bcd_hu}==8'h12);//����12��
    assign {bcd_temp_ht,bcd_temp_hu}=(noon&day_night)?8'h00:{bcd_ht,bcd_hu};//����12����12��Сʱ����������0��
    assign min_equ=((bcd_mt==5)&&(bcd_mu==9))?1'b1:1'b0;//��������ǰ
    assign equ=({bcd_st,bcd_su,bcd_mt,bcd_mt}==16'h0000)?1'b1:1'b0;//����
    assign grt=(({bcd_st,bcd_su}+{bcd_temp_ht,bcd_temp_hu}+8'h1)>8'h5a)?1'b1:1'b0;//��ʾ��������ǰ������
    assign radio_alarm=(((grt&min_equ&clk_5h)|(equ&clk_1k))&clk_1hz)&en;//��������ǰ���500HZ�źţ�����ʱ���1kHZ�ź�
endmodule
