`include "alu+cu.v"
`include "a3_1.v"
module fdpth(reset,clk,nPC);
input reset;
input clk;
output reg nPC;
integer PC;
reg read_data;
// 5 control signals
wire alusrc;
wire pcsrc;
wire memread;
wire memwrite;
wire regwrite;
reg [4:0] rs1_add;
reg [4:0] rs2_add;
reg [4:0] rd_add;
wire [63:0] a;
reg [63:0] b;
reg [63:0] rs1;
reg [63:0] rs2;
reg [63:0] rd;
wire [63:0] result;
wire overflow;
wire zero;
reg [11:0] imm;
reg [12:0] imm_beq;
reg [63:0] offset;
wire ls;
wire [31:0] inst;
wire [1:0] aluop; // type of instruction
reg [31:0] inst_mem[0:100];
reg [63:0] data_mem[0:100];  // data memory
reg [63:0] regFile[0:31]; // RF
wire [3:0] cs;
reg [63:0] data_read; // to read data in data memory
integer i;
initial 
	begin
		for(i=0;i<=31;i++)
		begin
			regFile[i] <= i;
		end
		PC = 0;
 	end

initial
 begin
  for (i = 0; i < 100; i = i + 1) begin
    data_mem[i] <= i;
  end
end

initial 
	begin
		//instruction memory
		inst_mem[0] = 32'b00000000100000010000000010000011; // ld x1,8(x2)
		inst_mem[2] = 32'b00000001000000010000000110000011; // ld x3,16(x2)
		inst_mem[1] = 32'b00000000001100001000001000110011; // add x4,x1,x3
		inst_mem[4] = 32'b00000000000000000000010001100011; // beq x0,x0,8
		inst_mem[3] = 32'b00000000100000010000000010000011; // ld x1,8(x2)
		inst_mem[6] = 32'b00000001000000010000000110000011; // ld x3,16(x2)
		inst_mem[7] = 32'b00000000001100001000001000110011; // add x4,x1,x3
		inst_mem[5] = 32'b00000000000000000000010001100011; // beq x0,x0,8
		data_mem[10]=64'b1000;
	end
//PC+4 IM
	assign inst = inst_mem[PC];
	
mcu m1(inst,clk,aluop,alusrc,pcsrc,memread,memwrite,regwrite,ls);
always@(posedge clk)
begin
	case(aluop)
		2'b00: begin 
		       	if(ls)
				begin 
				imm <= inst[31:20];	
				offset[11:0]=imm[11:0];
				offset[63:12]={52{imm[11]}};
				rs1_add=inst[19:15];
				rs1=regFile[rs1_add];
				rd_add=inst[11:7];
				end
			else
				begin
				imm[11:5] <= inst[31:25];
				imm[4:0] <= inst[11:7];
				offset[11:0]=imm[11:0];
				offset[63:12]={52{imm[11]}};
				rs1_add=inst[19:15];
				rs2_add=inst[24:20];
				rs1=regFile[rs1_add];
				rs2=regFile[rs2_add];
				end
		        end
		2'b01: begin
			
			imm_beq[0]=1'b0;
			imm_beq[11] <= inst[7];
			imm_beq[4:1] <= inst[11:8];
			imm_beq[12] <= inst[31];
			imm_beq[10:5] <= inst[30:25];
			offset[12:0]=imm_beq[12:0];
			offset[63:13]={52{imm_beq[12]}};
			rs1_add=inst[19:15];		
			rs2_add=inst[24:20];
			rs1=regFile[rs1_add];
			rs2=regFile[rs2_add];	
		       end 
		2'b10: begin
			imm <= 12'b0;
			rs1_add=inst[19:15];
			rs2_add=inst[24:20];
			rs1=regFile[rs1_add];
			rs2=regFile[rs2_add];
			rd_add = inst[11:7];
			end		       
	endcase

if(alusrc)
	begin
		b <= offset;
	end
else
	begin
		b <= rs2;
	end
end


assign a = rs1;



assign cs[3] = inst[30];
assign cs[2] = inst[14];
assign cs[1] = inst[13];
assign cs[0] = inst[12];

ALU m2(a,b,cs,aluop,result,cout,zero,overflow);
// data memory - memread and memwrite
always@(negedge clk)
begin
	case(aluop)
		2'b00: begin
			if(memread)
			begin 
				data_read = data_mem[result];
				regFile[rd_add] = data_read;
				rd = regFile[rd_add];
				 PC = PC + 1;
				 nPC = PC;
				$display("The new pc value is %d",PC);			
			end
			if(memwrite)
			begin
				data_mem[result] = rs2;
				 PC = PC + 1;
				 nPC = PC;
				$display("The new pc value is %d",PC);
			end
			end
		2'b10: 	begin
				regFile[rd_add] = result;
				rd = regFile[rd_add];
				 PC = PC + 1;
				 nPC = PC;
				$display("The new pc value is %d",PC);
			end
		2'b01: begin
			if(zero)
			begin
				 nPC = PC + (offset)/4;
				 PC = PC + (offset)/4;
				
			end
			else
			begin
				 nPC = PC + 1;
				 PC = PC + 1;
  			end
			$display("The new pc value is %d",PC);			
			end
	endcase
end

endmodule
