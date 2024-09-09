// lab2TopSim.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/8/24

// This is a module that tests my lab2 system verilog

module lab2TopSim(
	input logic [3:0] s1, s2,
	input logic [3:0] clk,
	output logic led1, led2,
	output logic [6:0] seg,
	output logic [4:0] sum
);
	logic toggle = 0;
	logic [3:0] s = s1;
	logic [24:0] counter = 0;
		
	// Simple clock divider
	always_ff @(posedge clk) begin
			counter <= counter + 1;
			if(counter == 102416) begin
				counter <= 0;
				toggle <= ~toggle;
				if(toggle == 0) s = s1;
				else s = s2;
			end
		end
	
	assign led1 = toggle;
	assign led2 = ~toggle;

	always_comb begin
		case(s)
			4'h0: seg = 7'b1000000;
			4'h1: seg = 7'b1110011;
			4'h2: seg = 7'b0100100;
			4'h3: seg = 7'b0100001;
			4'h4: seg = 7'b0010011;
			4'h5: seg = 7'b0001001;
			4'h6: seg = 7'b0001000;
			4'h7: seg = 7'b1100011;
			4'h8: seg = 7'b0000000;
			4'h9: seg = 7'b0000001;
			4'ha: seg = 7'b0000010;
			4'hb: seg = 7'b0011000;
			4'hc: seg = 7'b1001100;
			4'hd: seg = 7'b0110000;
			4'he: seg = 7'b0001100;
			4'hf: seg = 7'b0001110;
			default: seg = 7'b1111111;

		endcase
	end

	always_comb begin
		sum = s1 + s2;
	end
				
				
			
endmodule