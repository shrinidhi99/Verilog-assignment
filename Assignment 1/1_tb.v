`include "1.v"

module a1_tb;

reg [7:0] addr;
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
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b0; addr = 7'b1000;
		#5 $display("%g read_data = %b address = %b",$time,read_data,addr);
		memwrite = 1'b1; memread = 1'b0; write_data = 32'b101101010; addr = 7'b10000;
		#5 $display("%g write_data = %b address = %b",$time,write_data,addr);
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b0; addr = 7'b10000;
		#5 $display("%g read_data = %b address = %b",$time,read_data,addr);
		memwrite = 1'b1; memread = 1'b0; write_data = 32'b1010111; addr = 7'b100000;
		#5 $display("%g write_data = %b address = %b",$time,read_data,addr);
		memwrite = 1'b0; memread = 1'b1; write_data = 32'b0; addr = 7'b100000;
		#5 $display("%g read_data = %b address = %b",$time,read_data,addr);
	end

initial 
begin	
	#450 $finish;
end

endmodule
