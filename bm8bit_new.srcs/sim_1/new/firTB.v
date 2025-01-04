`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 03:50:49 PM
// Design Name: 
// Module Name: firTB
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


module firTB;
reg clk,rst;
reg [7:0] a0,a1,a2,a3,a4,x;
wire [15:0] y;

FIR FIR11(clk,rst,x,a0,a1,a2,a3,a4,y);
initial begin
clk =0;
end
always
#5 clk = !clk;
initial begin
rst=1;x=8'b00000000;
a0=8'b00000000; //0.25
 a1=8'b00000101; //0.125
 a2=8'b00001011;  //0.375
 a3=8'b00000101;  //0.125
 a4=8'b00000000;  //0.625
// a5=8'b10001000; //0.25
// a6=8'b00000000; //0.375
#7
rst=0;
#12 x=8'b01010000; //x7=0.625
#12 x=8'b00100000; //x6=0.25
#12 x=8'b01100000; //x5=0.75
#12 x=8'b01010000; //x4=0.625
#12 x=8'b01000000; //x3=0.5
#12 x=8'b00100000; //x2=0.25
#12 x=8'b01000000;  //x1=0.5
#12 x=8'b00010000; //x0= 0.125

//#10 rst = 0; a=4'd2; x=4'd1; 
//#10 a=4'd2; x=4'd2;
//#10 a=4'd2; x=4'd1; 
//#10 rst=1; a=4'd2; x=4'd1; 
//#10 rst=0;a=4'd2; x=4'b1101; 
//#10 a=4'd2; x=4'd2; 
end
endmodule

