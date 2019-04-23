/*
	Name: Vybhav Pai (17CO252)
	Name: Shrinidhi Anil Varna (17CO145)
*/

module data_memory (addr,write_data,memwrite,memread,clk,read_data);

input wire [9:0] addr;        // Memory Address
input wire [31:0] write_data;    // Memory Address Contents
input wire memwrite;
input wire memread;
input wire clk;                  // All synchronous elements, including memories, should have a clock signal
output reg [31:0] read_data;      // Output of Memory Address Contents


reg [31:0] MEMO[0:1023];  // 256 words of 32-bit memory

integer i; 

initial
 begin
  read_data <= 0;
  for (i = 0; i < 1023; i = i + 1) begin
    MEMO[i] <= 32'b0;
  end
end

// Using @(addr) will lead to unexpected behavior as memories are synchronous elements like registers
always @(posedge clk) begin
  if (memwrite == 1'b1) begin
    MEMO[addr] <= write_data;
  end
  // Use memread to indicate a valid address is on the line and read the memory into a register at that address when memread is asserted
  if (memread == 1'b1) begin
    read_data <= MEMO[addr];
  end
end

endmodule
