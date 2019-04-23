/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/
`include "alu+cu.v"
module q4_tb;
reg [31:0]a;
reg [31:0]b;
reg [3:0] op;
reg [1:0] alu;
wire [31:0]result;
wire cout;
wire overflow;
wire zero;
ALU m(a,b,op,alu,result,cout,zero,overflow);

initial
	begin
	 $dumpfile("alu+cu.vcd");
	 $dumpvars(0, q4_tb);
		a = 32'b0101;b = 32'b0011;op = 4'b0111;alu = 2'b10;				//giving inputs for all operations of alu
		#5 $display("%g %b and %b = %b",$time,a[3:0],b[3:0],result[3:0]);
		a = 32'b0101;b = 32'b0011;op = 4'b0110;alu = 2'b10;
		#5 $display("%g %b or %b = %b",$time,a[3:0],b[3:0],result[3:0]);
		a = 32'b0101;b = 32'b0011;op = 4'b1110;alu = 2'b10;
		#5 $display("%g %b nand %b = %b",$time,a[3:0],b[3:0],result[3:0]);
		a = 32'b0101;b = 32'b0011;op = 4'b1111;alu = 2'b10;
		#5 $display("%g %b nor %b = %b",$time,a[3:0],b[3:0],result[3:0]);
		a = 32'b11111111111111111111111111111111;		//checking corner cases like adding two big numbers and detecting overflow
		b = 32'b00000000000000000000000000000001;op = 4'b0000;alu = 2'b10;
		#5 $display("%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
		a = 32'b01111111111111111111111111111111;
		b = 32'b00000000000000000000000000000001;op = 4'b0000;alu = 2'b10;
		#5 $display("%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
		a = 32'b10000000000000000000000000000000;b = 1'b1;op = 4'b1000;alu = 2'b10;
		#5 $display("%g %b - %b difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);
		a = 32'b0110;b = 32'b1010;op = 4'b1000;alu = 2'b10;
		#5 $display("%g %b - %b difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);

	  $finish;
	end
endmodule			

