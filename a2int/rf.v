/*Name : Shrinidhi Anil Varna 	Roll no.: 17CO145
	 Vybhav Pai             Roll no.: 17CO252
*/
module rf(regRNum1,regRNum2,wReg,Data,RegWrite,reset,clk,rData1,rData2);

	input [4:0]regRNum1,regRNum2,wReg;
	input [31:0]Data;
	input RegWrite,reset,clk;
	output [31:0]rData1,rData2;
	integer k;
	reg [31:0] regFile[0:31];

//ReadModule
	assign rData1=regFile[regRNum1];
	assign rData2=regFile[regRNum2];

//WriteModule
	always@(posedge clk)
	begin	
		if(reset)
		begin
			for(k=0;k<32;k=k+1)
			begin
				regFile[k] <= 32'b0;
			end
		end
		else
		begin
			if(RegWrite)
			begin
				regFile[wReg] <= Data;
			end
		end
	end

endmodule
	
