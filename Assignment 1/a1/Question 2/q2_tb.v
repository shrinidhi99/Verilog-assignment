/*
	Name: Vybhav Pai (17CO252)
	Name: Shrinidhi Anil Varna (17CO145)
*/


`include "q2.v"

module q2_tb;

//reg [31:0] PC; // program counter value
reg clk; // variable that stores clock signal
wire [31:0] PC; // updated value of PC
wire [31:0] inst; // instruction to be fetched
reg reset;
initial
begin
	clk = 1'b0;
	repeat(200)
		#1 clk = ~clk;
end

instruction_memory M(clk,PC,reset,inst);
initial
	begin
		$dumpfile("q2.vcd");
		$dumpvars(0,q2_tb);
		reset = 1'b0;
		#3 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
		
		#2 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
		 reset = 1'b1;
		#2 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
		 reset = 1'b0;
		#2 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
		#2 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
		#2 $display("%g Instruction fetched = %b and nPC = %b",$time,inst,PC);
	end

initial 
begin	
	#100 $finish;
end


endmodule
