`include "q2.v"

module q2_tb;

reg [10:0] PC; // program counter value
reg clk; // variable that stores clock signal
wire [10:0] nPC; // updated value of PC
wire [31:0] inst; // instruction to be fetched

initial
begin
	clk = 1'b0;
	repeat(200)
		#1 clk = ~clk;
end

instruction_memory M(PC,clk,nPC,inst);
initial
	begin
		$dumpfile("q2.vcd");
		$dumpvars(0,q2_tb);
		PC = 11'b1010; clk = 1'b1;
		#1 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,nPC);
		PC <= nPC; clk = 1'b1;
		#1 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,nPC);
		PC <= nPC; clk = 1'b1;
		#1 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,nPC);
		PC <= nPC; clk = 1'b1;
		#1 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,nPC);
	end

initial 
begin	
	#100 $finish;
end


endmodule
