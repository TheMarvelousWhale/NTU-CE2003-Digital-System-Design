//Module  : clock generator and 7seg display
//Function : Generates 400 Hz clock (o_clk) from 100 Mhz clock (i_clk)
// and ALSO displays the bench number on the 7 seg display

module clkGen_7seg(input i_clk, output o_clk, seg_Tg_out, output reg [6:0] seg);


// ******* EDIT the seat number below ******* //
wire [3:0] seat_Hi =4'd2;	// the High number (decimal 2)
wire [3:0] seat_Lo =4'd5;	// the Low number (decimal 5)
// ***************************************** //

reg [20:0] counter = 21'd0;
wire [3:0] num, num1;

assign num = seg_clk ? seat_Hi : seat_Lo; // toggle between seat number
assign seg_Tg_out = seg_clk;	// the output to control the toggling of the 7 seg displays

assign seg_clk = counter[20];	// aprox 100Hz
assign o_clk = counter[10];	// The slow clock, aprox 100KHz

// The clock
always @(posedge i_clk)
begin
    counter <= counter + 1'b1;
end

always @*
begin
	case (num)
		4'd0 : seg = 7'b0111111;
		4'd1 : seg = 7'b0000110;
		4'd2 : seg = 7'b1011011;
		4'd3 : seg = 7'b1001111;
		4'd4	:	seg = 7'b1100110;
		4'd5	:	seg = 7'b1101101;
		4'd6	:	seg = 7'b1111101;
		4'd7	:	seg = 7'b0000111;
		4'd8	:	seg = 7'b1111111;
		4'd9	:	seg = 7'b1101111;
		4'd10	:	seg = 7'b1110111;
		4'd11	:	seg = 7'b1111100;
		4'd12	:	seg = 7'b1011000;
		4'd13	:	seg = 7'b1011110;
		4'd14	:	seg = 7'b1111001;
		4'd15	:	seg = 7'b1110001;
		default:	seg = 7'b0000000;
	endcase
end

endmodule
