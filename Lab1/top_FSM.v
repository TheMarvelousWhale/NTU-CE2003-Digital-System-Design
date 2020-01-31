`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:40 11/15/2018 
// Design Name: 
// Module Name:    top_FSM 
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
module top_FSM( input clk, rst, fifty, dollar, cancel, 
					 input seg_button,
                output insert_coin, money_return, dispense,
					 output sClk, seg_Tg_out,
					 output [6:0] seg);
	 
	 wire [1:0] st;
	 
	 lab1_FSM U1 (.clk(sClk), .rst(rst), .fifty(fifty), .dollar(dollar), .cancel(cancel),
						.insert_coin(insert_coin), .money_return(money_return), .dispense(dispense), .st(st));
	 clkgen   U5 (.clk_in(clk), .seg_clk(segClk), .clk_out(sClk));
	 sevenseg U6 (.a({2'b00,st}), .seg_clk(segClk), .seg_switch(seg_button), .seg_Tg_out(seg_Tg_out), .seg(seg));

endmodule

