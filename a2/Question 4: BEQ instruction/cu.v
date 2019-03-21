/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/

module cu(op3,op2,op1,op0,a1,a0,cs);	
input op3,op2,op1,op0,a1,a0;	//taking 4 bit inputs from funct7 and funct3 and two bit alu input 
output [3:0]cs;
wire f7,f30,f31,f32,w1,w2,w3,w4,w5,wop3,wop0,wa1,wa0,wop2;

not(wop3,op3);			//implementing not for all possible inputs
not(wop2,op2);
not(wop0,op0);
not(wa1,a1);
not(wa0,a0);

and(cs[3],op3,op2,a1,wa0);	//implementing boolean algebra logic based on truth table
and(w2,wa1,(a0));
and(w3,op3,wop2,wop0,a1,wa0);
or(cs[2],w2,w3,cs[3]);
and(w1,a1,wa0,wop2,wop0);
or(cs[1],wa1,w1);
and(w5,a1,wa0,wop3,op1,wop0);
and(w4,cs[3],wop0);
or(cs[0],w4,w5);
endmodule



