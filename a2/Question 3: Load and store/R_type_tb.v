`include "load.v"
module R_tb;
reg [4:0] r1;
reg [4:0] r2;
reg [63:0] offset;
reg clk;
wire [63:0] a;
wire [63:0] rd;
wire [63:0] readdata;
wire [63:0] check;
load m(r1,r2,offset,clk,a,rd,readdata,check);
initial
begin
	clk = 1'b0;
	repeat(100)	
	#2	clk = ~clk;
end
initial
	begin
	$dumpfile("load.vcd");
	$dumpvars(0, R_tb);
	r1 = 5'b010; r2 = 5'b110; offset = 63'b0110; 
	#2 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);
	r1 = 5'b110; r2 = 5'b111; offset = 63'b1010;
	#4 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);
	r1 = 5'b110; r2 = 5'b111; offset = 63'b1010;
	#4 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);
	r1 = 5'b1110; r2 = 5'b100; offset = 63'b1111;
	#4 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);
	r1 = 5'b010; r2 = 5'b110; offset = 63'b0110; 
	#4 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);
	r1 = 5'b110; r2 = 5'b111; offset = 63'b1010;
	#4 $display("%g rs1 = %b offset = %b address = %b read data = %b and wriiten data = %b",$time,a,offset,rd,readdata,check);

	end
initial
begin
#50 $finish;
end

endmodule
 
	
