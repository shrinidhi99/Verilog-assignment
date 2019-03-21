`include "a3_1.v"

module mcu_tb();
reg [31:0]inst;
reg clk;

mcu m1(inst,clk);
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
	$dumpfile("a3_1.vcd");
	$dumpvars(0,mcu_tb);

	
	inst = 32'b00000000000000000000000001100011;
	#4 $display("%g Sending opcode as %b",$time,inst[6:0]);	
	inst = 32'b00000000000000000000000000100011;
	#10 $display("%g Sending opcode as %b",$time,inst[6:0]);
	inst = 32'b00000000000000000000000000110011;
	#10 $display("%g Sending opcode as %b",$time,inst[6:0]);
	inst = 32'b00000000000000000000000000000011;
	#10 $display("%g Sending opcode as %b",$time,inst[6:0]);
	
end

initial
begin
#200 $finish;
end

endmodule
