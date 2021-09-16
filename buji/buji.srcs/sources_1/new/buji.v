`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 12:32:32
// Design Name: 
// Module Name: buji
// Project Name: ���ϴ�
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


module bujin(
    input M,
    input reset,
    input clk,
    output reg [2:0] Y
    );
//     reg clk1;  // 1Hz时钟
//     reg [25:0] cnt1;  // 1Hz时钟产生计数�?
//     always @(posedge clk) //产生1Hz时钟
//     begin
//         if (cnt1 >= 49999999) 
//             begin
//                 cnt1 <= 26'b0; 
//                 clk1 = ~clk1;
//             end
//         else 
//             begin
//                 cnt1 <= cnt1+ 1;
//             end
//     end
    parameter S0=3'b111,S1=3'b000,S2=3'b110,S3=3'b010,S4=3'b011,S5=3'b001,S6=3'b101,S7=3'b100;//定义�?8个状�?
    always@(posedge clk or negedge reset)
    begin
        if(~reset)
            Y<=S0;
        else
            case(Y)
                S0:Y<=S1;
                S1:Y<=S2;
                S2:Y<=(M)?S7:S3;
                S3:Y<=(M)?S2:S4;
                S4:Y<=(M)?S3:S5;
                S5:Y<=(M)?S4:S6;
                S6:Y<=(M)?S5:S7;
                S7:Y<=(M)?S6:S2;
            endcase
    end
endmodule
