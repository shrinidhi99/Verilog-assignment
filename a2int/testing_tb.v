/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/

`include "alu+cu.v"
module testing_tb;
reg [31:0]a;
reg [31:0]b;
wire [31:0]result;
wire cout;
wire zero;
wire overflow;
reg [3:0] op;
alu64 M(a,b,op,result,cout,zero,overflow);

initial
	begin
	 $dumpfile("alu+cu.vcd");
	 $dumpvars(0, testing_tb);
		a = 4'b0;b = 4'b1;op = 4'b0000;
		#5 $display("#%g %b and %b = %b zero_detection = %b",$time,a,b,result,zero);	// giving different operations
		a = 4'b0;b = 4'b1;op = 4'b0001;
		#5 $display("#%g %b or %b = %b zero_detection = %b",$time,a,b,result,zero);
	 	a = 4'b0;b = 4'b1;op = 4'b0010;
		#5 $display("#%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
	 	a = 4'b0;b = 4'b1;op = 4'b0110;cin=1'b1;
		#5 $display("#%g %b - %b = difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);
	 	a = 4'b0;b = 4'b1;op = 4'b0000;cin=1'b0;
		
		#5 $display("#%g %b and %b = %b zero_detection = %b",$time,a,b,result,zero);
		a = 4'b0;b = 4'b1;op = 4'b0001;cin=1'b0;
		#5 $display("#%g %b or %b = %b zero_detection = %b",$time,a,b,result,zero);
	 	a = 4'b1111;b = 4'b0000;op = 4'b0010;cin=1'b0;
		#5 $display("#%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
	 	a = 4'b1111;b = 4'b0001;op = 4'b0110;cin=1'b1;
		#5 $display("#%g %b - %b = difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);
	 	a = 4'b0101;b = 4'b1010;op = 4'b0000;cin=1'b0;
		
		#5 $display("#%g %b and %b = %b zero_detection = %b",$time,a,b,result,zero);
		a = 4'hb;b= 4'ha;op = 4'b0001;cin=1'b0;
		#5 $display("#%g %b or %b = %b zero_detection = %b",$time,a,b,result,zero);
	 	a = 4'b1101;b = 4'b1010;op = 4'b0010;cin=1'b0;
		#5 $display("#%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
	 	a = 4'b0111;b = 4'b1000;op = 4'b0110;cin=1'b1;
		#5 $display("#%g %b - %b = difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);
	 	a = 4'b0111;b = 4'b1111;op = 4'b0000;cin=1'b0;
		
		#5 $display("#%g %b and %b = %b zero_detection = %b",$time,a,b,result,zero);
		a = 4'b0011;b = 4'b1100;op = 4'b0001;cin=1'b0;
		#5 $display("#%g %b or %b = %b zero_detection = %b",$time,a,b,result,zero);
	 	a = 4'b0110;b = 4'b1001;op = 4'b0010;cin=1'b0;
		#5 $display("#%g %b + %b sum = %b carry = %b zero_detection = %b overflow = %b",$time,a,b,result,cout,zero,overflow);
	 	a = 4'b1000;b = 4'b1010;op = 4'b0110;cin=1'b1;
		#5 $display("#%g %b - %b = difference = %b borrow = %b zero_detection = %b overflow = %b",$time,a,b,result,~cout,zero,overflow);
	 		 	
	  $finish;
	end
endmodule			

