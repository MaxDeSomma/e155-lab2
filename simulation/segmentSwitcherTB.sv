// segmentSwitcherTB.sv
// Max De Somma
// mdesomma@g.hmc.edu
// 9/7/24

// This is a test bench module that tests the segmentSwitcher correctly switched the correct transistor/display on and provided the correct seg output 
module segmentSwitcher_tb();
 // Set up test signals
 logic clk;
 logic [3:0] s1,s2;
 logic led1, led2;
 logic [4:0] sum;
 logic [6:0] seg;

 // Instantiate the device under test
 segmentSwitcher dut(.s1(s1),.s2(s2), .clk(clk), .led1(led1),.led2(led2), .seg(seg), .sum(sum));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end

initial
 begin
	// test different inputs
	s1 = 4'b0000;
	s2 = 4'b1111;
	#20;
	s1 = 4'b1000;
	s2 = 4'b0001;
	#20;
	s1 = 4'b1010;
	s2 = 4'b1001;
	#20;
 end
endmodule