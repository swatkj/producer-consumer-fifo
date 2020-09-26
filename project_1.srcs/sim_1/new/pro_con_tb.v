`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2020 12:03:47 AM
// Design Name: 
// Module Name: pro_con_tb
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

module top;
  reg p_clock;//producer_clock
  reg c_clock;//consumer_clock
  wire [3:0] A;//producer_data
  wire [3:0] B;//consumer_data
  wire C;//consumer_req 1 bit
  producer pp(.producer_iclk(p_clock), .producer_data(A));
  consumer cc(.consumer_iclk(c_clock), .consumer_data(B), .consumer_req(C));
  fifo ff(.producer_data(A), .consumer_req(C), .consumer_data(B));
  initial
    begin
      $dumpfile("xyz.vcd");
      $dumpvars;
      p_clock=0;
      c_clock=0;
     #500 $finish;
    end
  always #10 p_clock=~p_clock;
  always #5 c_clock=~c_clock;
  always @(C)
   $display("TIME(in ns)=%t, producer's data=%d consumer_request=%d and consumer's data=%d", $time, A, C, B);
endmodule