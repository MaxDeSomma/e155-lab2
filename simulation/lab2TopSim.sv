module lab2TopSim(
	input logic clk,
	//output logic [6:0] seg
	output logic led1, led2
);
	// Internal high-speed oscillator
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	logic en;
	logic toggle = 0;
	logic [2:0] counter = 0;
	
	assign en = counter[2];
	
	// Simple clock divider
	always_ff @(posedge clk) begin
		counter <= counter + 1;
		if (en) begin
			toggle = ~toggle;
		end
	end 
	
	assign led1 = ledOn;
	assign led2 = ~ledOn;
				
			
endmodule