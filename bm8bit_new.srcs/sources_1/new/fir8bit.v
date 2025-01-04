`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 03:47:20 PM
// Design Name: 
// Module Name: fir8bit
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

// FIR Filter Module
module FIR (
    input  clk,
    input  rst,
    input  [7:0] x,
    input  [7:0] h0, h1, h2, h3, h4,
    output  [15:0] y
);

// Registers and Wires
reg [7:0] x_values [4:0];
wire [15:0] baugh_product [4:0];
//wire [7:0] t [6:1];
//wire a1, a2, a3, a4, a5, a6;
// Instantiate Multipliers
//always @* 
   // $display("%b,%b,%b,%b,%b,%b,%b",x_values[0],x_values[1],x_values[2],x_values[3],x_values[4],x_values[5],x_values[6]);
    
baugh_wooley mul0 (h0, x_values[0], baugh_product[0]);
baugh_wooley mul1 (h1, x_values[1], baugh_product[1]);
baugh_wooley mul2 (h2, x_values[2], baugh_product[2]);
baugh_wooley mul3 (h3, x_values[3], baugh_product[3]);
baugh_wooley mul4 (h4, x_values[4], baugh_product[4]);
//baugh_wooley mul5 (h5, x_values[5], baugh_product[5]);
//baugh_wooley mul6 (h6, x_values[6], baugh_product[6]);


// RCA (Recursive Carry Adder)
//rca r1 (baugh_product[0], baugh_product[1], 0, t[1], a1);
//rca r2 (baugh_product[2], t[1], 0, t[2], a2);
//rca r3 (baugh_product[3], t[2], 0, t[3], a3);
//rca r4 (baugh_product[4], t[3], 0, t[4], a4);
//rca r5 (baugh_product[5], t[4], 0, t[4], a5);
//rca r6 (baugh_product[6], t[5], 0, y, a6);

// Shift Register
always @(posedge clk) begin
    if (rst == 1) begin
        x_values[0] <= 0;
        x_values[1] <= 0;
        x_values[2] <= 0;
        x_values[3] <= 0;
        x_values[4] <= 0;
//        x_values[5] <= 0;
//        x_values[6] <= 0;
//        y <= 0;
        $display("%b,%b,%b,%b,%b,%b",x,x_values[0],x_values[1],x_values[2],x_values[3],x_values[4]);
    end else begin
        x_values[0] <= x;
        x_values[1] <= x_values[0];
        x_values[2] <= x_values[1];
        x_values[3] <= x_values[2];
        x_values[4] <= x_values[3];
        $display("%b,%b,%b,%b,%b,%b",x,x_values[0],x_values[1],x_values[2],x_values[3],x_values[4]);
                   end
end
 assign y = baugh_product[0]+baugh_product[1]+baugh_product[2]+baugh_product[3]+ baugh_product[4]; 
         //$display("%b,%b,%b,%b,%b,%b,%b,%b",y,baugh_product[0],baugh_product[1],baugh_product[2],baugh_product[3],baugh_product[4],baugh_product[5],baugh_product[6]);
//    /* Accumulate stage of FIR */   
//    always @ (posedge clk) 
//        begin
//            if (rst==1)
//                begin
//                   y <= 0;  
//                end
//            else begin
//             y = baugh_product[0]+baugh_product[1]+baugh_product[2]+baugh_product[3]+ baugh_product[4]+baugh_product[5]+baugh_product[6]; 
//         $display("%b,%b,%b,%b,%b,%b,%b,%b",y,baugh_product[0],baugh_product[1],baugh_product[2],baugh_product[3],baugh_product[4],baugh_product[5],baugh_product[6]);
//                     end    
// Output Assignment
//end
endmodule

