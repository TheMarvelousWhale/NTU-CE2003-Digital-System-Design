`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:04:18 02/20/2020
// Design Name:   VmodCAM_Ref
// Module Name:   M:/Y2S2 AY2019-20/Y2S2 CE2003/Lab/Lab 3/lab3-1/DataGen_tb.v
// Project Name:  lab3-1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VmodCAM_Ref
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataGen_tb;

	// Inputs
	reg i_clk;
	reg i_reset;
	reg [5:0] i_color;
	reg i_left_b;
	reg i_right_b;
	reg i_up_b;
	reg i_down_b;

	// Outputs
	wire TMDS_TX_2_P;
	wire TMDS_TX_2_N;
	wire TMDS_TX_1_P;
	wire TMDS_TX_1_N;
	wire TMDS_TX_0_P;
	wire TMDS_TX_0_N;
	wire TMDS_TX_CLK_P;
	wire TMDS_TX_CLK_N;
	wire [1:0] o_led;

	// Bidirs
	wire TMDS_TX_SCL;
	wire TMDS_TX_SDA;

	// Instantiate the Unit Under Test (UUT)
	VmodCAM_Ref uut (
		.TMDS_TX_2_P(TMDS_TX_2_P), 
		.TMDS_TX_2_N(TMDS_TX_2_N), 
		.TMDS_TX_1_P(TMDS_TX_1_P), 
		.TMDS_TX_1_N(TMDS_TX_1_N), 
		.TMDS_TX_0_P(TMDS_TX_0_P), 
		.TMDS_TX_0_N(TMDS_TX_0_N), 
		.TMDS_TX_CLK_P(TMDS_TX_CLK_P), 
		.TMDS_TX_CLK_N(TMDS_TX_CLK_N), 
		.TMDS_TX_SCL(TMDS_TX_SCL), 
		.TMDS_TX_SDA(TMDS_TX_SDA), 
		.o_led(o_led), 
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_color(i_color), 
		.i_left_b(i_left_b), 
		.i_right_b(i_right_b), 
		.i_up_b(i_up_b), 
		.i_down_b(i_down_b)
	);

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_reset = 1;
		i_color = 0;
		i_left_b = 0;
		i_right_b = 0;
		i_up_b = 0;
		i_down_b = 0;

	//Set the reset high for 15 uni time then back to 0
	#15 i_reset = 0;
	
	// Simulate for 100us or more, and check that the count sequences are correct
   #3000
	
	$finish;

	end
	
	//Clock
	always #5 i_clk = ~i_clk;
      
endmodule

