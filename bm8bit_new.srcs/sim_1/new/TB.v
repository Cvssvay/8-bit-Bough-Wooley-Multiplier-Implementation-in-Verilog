`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 03:37:21 PM
// Design Name: 
// Module Name: TB
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

module test;

reg [7:0] x, y;   // 8 bit inputs

wire [15:0] s; // 16 bit output of multiplier circuit

baugh_wooley mult(.x(x), .y(y), .s(s));

initial
begin
x = 8'b01000000; y = 8'b01000000;
#10 x = 8'b00110111; y = 8'b00011011;
end

initial
$monitor($time, "%b * %b = %b", x, y, s);

endmodule


