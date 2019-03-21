/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/
`include "cu.v"
module cu_tb();
reg op3,op2,op1,op0,a1,a0;
wire [3:0] cs;
cu M(op3,op2,op1,op0,a1,a0,cs); 
initial 
	begin
	$dumpfile("cu.vcd");
	$dumpvars(0,cu_tb);
	#10 op3 = 1'b0; op2 = 1'b1; op1 = 1'b1; op0 = 1'b1; a1 = 1'b1; a0 = 1'b0; 	//test cases for generating different control signals ,i.e, AND,OR,SUB,ADD,Load/store,BEQ,NAND,NOR		
	#10 op3 = 1'b0; op2 = 1'b1; op1 = 1'b1; op0 = 1'b1; a1 = 1'b1; a0 = 1'b0; 		
	$display("%g AND: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);	
	#10 op3 = 1'b0; op2 = 1'b1; op1 = 1'b1; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0;
	#10 op3 = 1'b0; op2 = 1'b1; op1 = 1'b1; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0;
	$display("%g OR: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]); 		
	#10 op3 = 1'b1; op2 = 1'b0; op1 = 1'b0; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0;
	#10 op3 = 1'b1; op2 = 1'b0; op1 = 1'b0; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0;
	$display("%g SUB: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]); 			
	#10 op3 = 1'b0; op2 = 1'b0; op1 = 1'b0; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0; 		
	#10 op3 = 1'b0; op2 = 1'b0; op1 = 1'b0; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0; 		
	$display("%g ADD: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);
	#10 op3 = 1'bx; op2 = 1'bx; op1 = 1'bx; op0 = 1'bx; a1 = 1'b0; a0 = 1'b0; 		
	#10 op3 = 1'bx; op2 = 1'bx; op1 = 1'bx; op0 = 1'bx; a1 = 1'b0; a0 = 1'b0; 		
	$display("%g Load/store: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);
	#10 op3 = 1'bx; op2 = 1'bx; op1 = 1'bx; op0 = 1'bx; a1 = 1'b0; a0 = 1'b1; 		
	#10 op3 = 1'bx; op2 = 1'bx; op1 = 1'bx; op0 = 1'bx; a1 = 1'b0; a0 = 1'b1; 		
	$display("%g BEQ: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);
	#10 op3 = 1'b1; op2 = 1'b1; op1 = 1'b1; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0; 		
	#10 op3 = 1'b1; op2 = 1'b1; op1 = 1'b1; op0 = 1'b0; a1 = 1'b1; a0 = 1'b0; 		
	$display("%g NAND: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);
	#10 op3 = 1'b1; op2 = 1'b1; op1 = 1'b1; op0 = 1'b1; a1 = 1'b1; a0 = 1'b0; 		
	#10 op3 = 1'b1; op2 = 1'b1; op1 = 1'b1; op0 = 1'b1; a1 = 1'b1; a0 = 1'b0; 		
	$display("%g NOR: output = %b%b%b%b",$time,cs[3],cs[2],cs[1],cs[0]);
	
		
	#5 $finish;	
end
endmodule
