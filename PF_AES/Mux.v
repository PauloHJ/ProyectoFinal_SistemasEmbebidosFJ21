`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:07 06/05/2021 
// Design Name: 
// Module Name:    Mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux(
    input Rst,
    input Clk,
    input [127:0] ARK_res,
    input [127:0] SBT_res,
    input [127:0] SHR_res,
    input [127:0] MXC_res,
    input [3:0] res_sel,
    output reg [127:0] res
    );

	reg res_aux;
	
   always @(posedge Clk)
	begin
		if(Rst)
			begin
				res_aux = 0; 
			end
		else
			begin
				case (res_sel)
					  4'b1000: res_aux = ARK_res;
					  4'b0100: res_aux = SBT_res;
					  4'b0010: res_aux = SHR_res;
					  4'b0001: res_aux = MXC_res;
					default: res_aux = 0;
				endcase
			end
	end
	always @(posedge Clk)
		begin
			res = res_aux;
		end
	
endmodule
