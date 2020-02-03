module new_top_module_lab2(input clk, rst, write_en, save_data, show_reg, 
							input[7:0] d_in,
							output Seg_tg_out,
							output [6:0] seg,
							output[7:0] d_out);
		//wire o_clk;
		// what input to i_swtch ? prolly from 7seg
		
		//reg [7:0] num;
		debounce U1 (.i_clk(O_CLK),.i_swtch(write_en),.o_pulse(O1));
		debounce U2 (.i_clk(O_CLK),.i_swtch(save_data),.o_pulse(O2));
		top_module_lab2 M1 (.clk(clk),.rst(rst),.write_en(O1),.save_data(O2),.show_reg(show_reg),.d_in(d_in),.d_out(d_out));
		clkGen_7seg U3 (.i_clk(clk),.o_clk(O_CLK),.seg_Tg_out(Set_tg_out),.seg(seg));

endmodule