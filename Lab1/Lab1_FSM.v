`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19/01/2020
// Design Name: 
// Module Name:    lab1_FSM 
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

module lab1_FSM (input clk, rst,fifty,dollar,cancel,		
						output insert_coin, money_return,dispense,
						output reg [1:0] st); 

//reg [1:0] st;
reg [1:0] nst;
reg [2:0] out;

parameter [1:0] INIT =2'b00;
parameter [1:0] S50c =2'b01;
parameter [1:0] VEND =2'b10;
parameter [1:0] RETURN =2'b11;


//fsm always
always @(posedge clk) 
begin
	if (!rst)  //active LOW rst
		st <= INIT;
	else
		st <= nst;
end

//transition logic
always @ (fifty, dollar, cancel,st) 
begin
	nst =st; 
case (st)
INIT:
	begin
		if (fifty)	nst = S50c;
		if (dollar)	nst = VEND;
		if (cancel)	nst = INIT;
	end
S50c:
	begin
		if (fifty)	nst = VEND;
		if (dollar | cancel)	nst = RETURN; 

//both signal are 1 bit so we can use bitwise OR to save some logic

	end
VEND:
	begin
		//empty 
		//although we can make it go back to INIT
		//nst = INIT;
	end
RETURN:
	begin
		nst = INIT;
	end

endcase //for case(st) 
end// for always @ (fifty, dollar, cancel)

//separate output block
//Can do this as it is a Moore machine
always @(st)
begin 
	out = 3'b100; //default case for output 
	case (st)

		INIT: out = 3'b100;
		S50c: out = 3'b100;
		VEND: out = 3'b001;
		RETURN: out = 3'b010;
	
	endcase //for case (st)

end //for always @(st) 
 

//assign output 
assign {insert_coin,money_return,dispense} = out;

endmodule
