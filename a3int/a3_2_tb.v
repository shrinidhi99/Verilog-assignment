`include "a3_2.v"
module fdpth_tb;
reg reset;
reg clk;
wire nPC;
fdpth m(reset,clk,nPC);
initial
begin
	clk = 1'b0;	
	repeat(100)
	begin
	#5 clk = ~clk;
	end
end
initial
	begin
	$dumpfile("a3_2.vcd");
	$dumpvars(0,fdpth_tb);
	reset = 1'b0; 
	#4 $display("%g ",$time);
	#10 $display("%g",$time);
	#10 $display("%g",$time);
	#10 $display("%g",$time);
	end
initial
begin
#250 $finish;
end
endmodule
