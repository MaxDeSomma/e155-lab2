// segmentSwitcher.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a sub module that has a switches between led1 and led2 to power transistorts that provide current
// to specific seven segment displays

module segmentSwitcher(
	input logic [3:0] s1, s2,
	input logic clk,
	output logic led1, led2,
	output logic [6:0] seg,
	output logic [4:0] sum
);
	// Internal high-speed oscillator
	
	
	logic toggle = 0;
	logic [3:0] s = s1;
	logic [24:0] counter = 0;
		
	// Simple clock divider
	always_ff @(posedge clk) begin
			counter <= counter + 1;
			if(counter == 0) begin
					counter <= 0;
					toggle <= ~toggle;
					if(toggle == 0) s = s1;
					else s = s2;
			end
		end
	
	assign led1 = toggle;
	assign led2 = ~toggle;
	sevenSegment a1(s,seg);
	ledSum a2(s1,s2,sum);

endmodule