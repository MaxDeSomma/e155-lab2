module lab2_MD(
	input logic [3:0] s1, s2,
	//output logic [6:0] seg
	output logic led1, led2,
	output logic [6:0] seg
);
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	
	logic en;
	logic toggle = 0;
	logic [24:0] counter = 0;
	
	assign en = counter[24];
	
	// Simple clock divider
	always_ff @(posedge int_osc) begin
		counter <= counter + 1;
		if (en) begin
			toggle <= ~toggle;
		end
	end 
	
	assign led1 = toggle;
	assign led2 = ~toggle; 
	assign ens = en;
			
				
			
endmodule
