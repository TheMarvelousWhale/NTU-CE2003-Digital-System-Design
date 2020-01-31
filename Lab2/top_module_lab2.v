module top_module_lab2(input clk, rst, write_en, save_data, show_reg,
		input[7:0] d_in,
		output[7:0] d_out);
		
		reg [7:0] data_reg;       //the internal 8-bit register
		reg [7:0] ramdata [0:63]; //array depth 64 and length 8 (each vector is 8bit) 
		
		wire [5:0] addr; //the internal 6 input wire
		
		assign addr = d_in[5:0];  //connect it to d_in
		
		always @(posedge clk) begin
			if(!rst)  // active low reset 
				data_reg <= 8'b00000000;
			else begin 
				if (save_data)
					data_reg <= d_in;
			end 
			
			if (write_en)
				ramdata[addr] <= data_reg;

		end
		
		assign d_out = (show_reg) ? ramdata[addr] :data_reg;
		//condition ? value_if_true : value_if_false

endmodule

