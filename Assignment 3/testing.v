/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/

module FA(a,b,cin,sum,cout);		//module for 1 bit adder

	input a,b,cin;
	output sum,cout;
	wire t1,t2,t3;

	xor(sum,a,b,cin);
	and(t1,a,b);
	and(t2,a,cin);
	and(t3,b,cin);
	or(cout,t1,t2,t3);

endmodule

module alu(a,b,cin,control,result,cout);	// module for 1 bit alu

	input a,b,cin;
	input [3:0]control;
	output result,cout;
	wire t1,t2;
	wire ain,bin;
	wire sum,slt;
	wire t3,t4;

	assign ain=control[3] ? ~a:a;
	assign bin=control[2] ? ~b:b;
	
	and (t1,ain,bin);
	or (t2,ain,bin);
	FA a0(ain,bin,cin,sum,cout);
	assign slt=~cout;
	
	assign t3 = control[0]?t2:t1;
	assign t4 = control[0]?slt:sum;
	assign result = control[1]?t4:t3;

endmodule

module alu4(a,b,cin,control,result,cout);	// module for 4 bit alu

	input [3:0]a;
	input [3:0]b;
	input [3:0]control;
	input cin;
	output [3:0]result;
	output cout;
	wire c1,c2,c3;
	
	alu a0(a[0],b[0],cin,control,result[0],c1);
	alu a1(a[1],b[1],c1,control,result[1],c2);
	alu a2(a[2],b[2],c2,control,result[2],c3);
	alu a3(a[3],b[3],c3,control,result[3],cout);
	
endmodule

module alu16(a,b,cin,control,result,cout);	// module for 16 bit alu
	
	input [15:0]a;
	input [15:0]b;
	output [15:0] result;
	input [3:0] control;
	input cin;
	output cout;
	wire c1,c2,c3;
	alu4 M1(a[3:0],b[3:0],cin,control,result[3:0],c1);
	alu4 M2(a[7:4],b[7:4],c1,control,result[7:4],c2);
	alu4 M3(a[11:8],b[11:8],c2,control,result[11:8],c3);
	alu4 M4(a[15:12],b[15:12],c3,control,result[15:12],cout);
endmodule

module alu64(a,b,cin,control,result,cout,zero,overflow);	// module for 64 bit alu
	
	input [63:0]a;
	input [63:0]b;
	output [63:0] result;
	input [3:0] control;
	input cin;
	output cout;
	output zero;
	output overflow;
	wire c1,c2,c3;
	alu16 M1(a[15:0],b[15:0],cin,control,result[15:0],c1);
	alu16 M2(a[31:16],b[31:16],c1,control,result[31:16],c2);
	alu16 M3(a[47:32],b[47:32],c2,control,result[47:32],c3);
	alu16 M4(a[63:48],b[63:48],c3,control,result[63:48],cout);
	assign zero = ~|result;
	assign overflow = control[1] & ((a[63] & b[63] & ~result[63]) | (~a[63] & ~b[63] & result[63]));
endmodule


