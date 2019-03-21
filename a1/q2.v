module instruction_memory(PC,clk,nPC,inst);
input wire [10:0] PC; // program counter value
input wire clk; // variable that stores clock signal
output reg [10:0] nPC; // updated value of PC
output reg [31:0] inst; // instruction to be fetched

reg [31:0] inst_mem[0:1000000];

integer i;
initial 
	begin
		for(i=0;i<1000000;i++)
		begin
			inst_mem[i] = i;
		end
	end

always @(posedge clk) begin
	inst <= inst_mem[PC];
	nPC <= PC + 11'b100;
	end

endmodule
