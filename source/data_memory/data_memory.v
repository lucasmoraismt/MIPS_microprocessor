module DataMemory (input[31:0] ALUResult, input[31:0] WriteData, input clk, input MemWrite, output reg[31:0] ReadData);

  reg[31:0] mem[0:255];

always @(posedge clk) begin
  if(MemWrite) mem[ALUResult[11:2]] <= WriteData;
    ReadData <= mem[ALUResult[11:2]]; 
end

endmodule

