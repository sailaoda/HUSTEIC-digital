`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 14:11:45
// Design Name: 
// Module Name: counter24
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


module counter24(
    input CP,
    input reset,
    output reg led,
    input en,
    output reg [7:0] Hour24
    );
    always@(posedge CP or negedge reset)
        begin
            if(~reset)
                {Hour24[7:4],Hour24[3:0]}<=8'h00;
            else if(~en) 
                {Hour24[7:4],Hour24[3:0]}<={Hour24[7:4],Hour24[3:0]};
            else if((Hour24[7:4]>2)||(Hour24[3:0]>9)||((Hour24[7:4]==2)&&{Hour24[3:0]>=3})) 
                {Hour24[7:4],Hour24[3:0]}<=8'h00;
            else if((Hour24[7:4]==2)&&(Hour24[3:0]<3))
                {Hour24[7:4],Hour24[3:0]}<={Hour24[7:4],Hour24[3:0]+1'b1};
            else if(Hour24[3:0]==9)
                {Hour24[7:4],Hour24[3:0]}<={Hour24[7:4]+1'b1,4'h0};
            else
                {Hour24[7:4],Hour24[3:0]}<={Hour24[7:4],Hour24[3:0]+1'b1};
            if(~reset)
                led=0;
            else if(Hour24>8'h12)
                led=1;
            else 
                led=0;
        end
endmodule
