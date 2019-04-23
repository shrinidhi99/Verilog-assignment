/*
	Name: Shrinidhi Anil Varna(17CO145)
	      Vybhav Pai(17CO252)
	      Chaitany Pandiya(17CO112)
*/
`include "store.v"
module store_tb;
reg [4:0] r1;
reg [4:0] r2;
reg [11:0] offset;
reg clk;
wire [63:0] a;
wire [63:0] rd;
wire [63:0] writedata;

store m(r1,r2,offset,clk,a,rd,writedata);
initial
begin
	clk = 1'b0;
	repeat(100)	
	#2	clk = ~clk;
end
initial
	begin
	$dumpfile("store.vcd");
	$dumpvars(0, store_tb);
	r1 = 5'b010; r2 = 5'b110; offset = 64'b0110; 
	#5 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);
	r1 = 5'b110; r2 = 5'b111; offset = 64'b1010;
	#4 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);
	r1 = 5'b110; r2 = 5'b111; offset = 64'b1010;
	#4 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);
	r1 = 5'b1110; r2 = 5'b100; offset = 64'b1111;
	#4 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);
	r1 = 5'b010; r2 = 5'b110; offset = 64'b0110; 
	#4 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);
	r1 = 5'b110; r2 = 5'b111; offset = 64'b1010;
	#4 $display("%g rs1 = %b\n offset = %b\n address = %b\n write data = %b\n \n",$time,a,offset,rd,writedata);

	end
initial
begin
#50 $finish;
end

endmodule
 
	
