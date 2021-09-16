`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/09/10 13:56:50
// Design Name: 
// Module Name: SEG7_LUT
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


module SEG7_LUT(
    input clk,
    input timemode,
    input [7:0] Hour,
    input [7:0] Hour12,
    input [7:0] Minute,
    input [7:0] Second,
    output reg [7:0] oSEG,
    output reg[7:0] An
    );
    reg [3:0] iDIG;
    reg [15:0] count;
    wire [23:0] BCD,BCD1,BCD2;
    assign BCD={Hour,Minute,Second};
    assign BCD1={Hour12,Minute,Second};
    assign BCD2=(timemode==1)?BCD:BCD1;
    always@(posedge clk)
        begin
            if(count>=65536)
                count<=16'b000;
            else
                count<=count+1;
        end
    always@(count)
        begin
            case(count[15:13])
                3'b000 :
                    begin
                        An = 8'b1111_1110;
                        iDIG =BCD2[3:0];
                    end
                3'b001 :
                    begin
                        An = 8'b1111_1101;
                        iDIG =BCD2[7:4];
                    end
                3'b010 :
                    begin
                        An = 8'b1111_1011;
                        iDIG =BCD2[11:8];
                    end
                3'b011 :
                    begin
                        An = 8'b1111_0111;
                        iDIG =BCD2[15:12];
                    end
                3'b100 :
                    begin
                        An = 8'b1110_1111;
                        iDIG =BCD2[19:16];
                    end
                3'b101 :
                    begin
                        An = 8'b1101_1111;
                        iDIG =BCD2[23:20];
                    end
                default :
                    begin
                        An = 8'b1111_1111;
                    end
            endcase 
        end
    always@(iDIG)
        begin
            case(iDIG)
                4'h0:oSEG=8'b1100_0000;
                4'h1:oSEG=8'b1111_1001;
                4'h2:oSEG=8'b1010_0100;
                4'h3:oSEG=8'b1011_0000;
                4'h4:oSEG=8'b1001_1001;
                4'h5:oSEG=8'b1001_0010;
                4'h6:oSEG=8'b1000_0010;
                4'h7:oSEG=8'b1111_1000;
                4'h8:oSEG=8'b1000_0000;
                4'h9:oSEG=8'b1001_0000;
                default:;
            endcase
        end
endmodule
