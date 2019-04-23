/*
	Name: Vybhav Pai (17CO252)
	Name: Shrinidhi Anil Varna (17CO145)
*/
`include "1.v"

module a1_tb;

reg [9:0] addr;
reg [31:0] write_data;
reg memread;
reg memwrite;
reg clk;
wire [31:0] read_data;

initial 
begin
	clk=1'b0;
	repeat(120)
		#5 clk = ~clk;
end
data_memory M(addr,write_data,memwrite,memread,clk,read_data);
initial
	begin
		$dumpfile("1.vcd");
		$dumpvars(0,a1_tb);
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b1; addr = 10'b1000;
		#5 $display("%g read_data = %b address = %b",$time,read_data,addr);
		memwrite = 1'b1; memread = 1'b0; write_data = 32'b10101010; addr = 10'b10000;
		#10 $display("%g write_data = %b address = %b",$time,write_data,addr);
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b10; addr = 10'b10000;
		#10 $display("%g read_data = %b address = %b",$time,read_data,addr);
		memwrite = 1'b1; memread = 1'b0; write_data = 32'b1010111; addr = 7;
		#10 $display("%g write_data = %b address = %b",$time,write_data,addr);
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b110; addr = 7;
		#10 $display("%g read_data = %b address = %b",$time,read_data,addr);
	end

initial 
begin	
	#450 $finish;
end

endmodule
