module lab2_MD(
	input logic [3:0] s1, s2,
	output logic led1, led2,
	output logic [6:0] seg,
	output logic [4:0] sum
);
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	segmentSwitcher a1 (s1, s2, int_osc, led1, led2, seg, sum);
				
			
endmodule