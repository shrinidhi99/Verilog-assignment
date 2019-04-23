/*
	Name: Vybhav Pai (17CO252)
	Name: Shrinidhi Anil Varna (17CO145)
*/


module instruction_memory(clk,PC,reset,inst);
input wire clk; // variable that stores clock signal
output reg [31:0] PC; // updated value of PC
output reg [31:0] inst; // instruction to be fetched
input reset;
reg [7:0] inst_mem[4194304:268435456];

integer i;
initial 
	begin
		for(i=4194304;i<268435456;i++)
		begin
			inst_mem[i] = 8'b0;
		end
	PC <= 4194304;
	end

always @(posedge clk) begin
	if(reset) 
	begin
		PC = 4194304;						// resetting PC to its original value
	end

	inst[7:0] <= inst_mem[PC];
	inst[15:8] <= inst_mem[PC+1];
	inst[23:16] <= inst_mem[PC+2];
	inst[31:24] <= inst_mem[PC+3];
	
	
	PC <= PC + 32'b100;						// incrementing PC value
	
	end

endmodule
