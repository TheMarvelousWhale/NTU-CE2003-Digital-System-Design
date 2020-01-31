`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:22 01/22/2019
// Design Name:   lab1_FSM
// Module Name:   C:/Users/C170114/Lab1/lab1_FSM_tb.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lab1_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab1_FSM_tb;

	// Inputs
	reg fifty;
	reg dollar;
	reg cancel;
	reg clk;
	reg rst;

	// Outputs
	wire dispense;
	wire money_return;
	wire insert_coin;
	wire [1:0] sst;

	// Instantiate the Unit Under Test (UUT)
	lab1_FSM uut (
		.fifty(fifty), 
		.dollar(dollar), 
		.cancel(cancel), 
		.clk(clk), 
		.rst(rst), 
		.dispense(dispense), 
		.money_return(money_return), 
		.insert_coin(insert_coin), 
		.sst(sst)
	);

	initial begin
		// Initialize Inputs
		fifty = 0;
		dollar = 0;
		cancel = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#10 rst = 1;
		#10 fifty = 1;
		#10 fifty = 0;
		#10 fifty = 1;
		#10 fifty = 0;
		#20 rst = 0;
		#10 rst = 1;
		#10 dollar = 1;
		#10 dollar = 0;
		#20 rst = 0;
		#10 rst = 1;
		#10 cancel = 1;
		#10 cancel = 0;
		#20 fifty = 1;
		#10 fifty = 0;
		#10 dollar = 1;
		#10 dollar = 0;
		#20 fifty = 1;
		#10 fifty = 0;
		#10 cancel = 1;
		#10 cancel = 0;
		
      $finish();
		
	end
	
	always #5 clk = ~clk;
      
endmodule

