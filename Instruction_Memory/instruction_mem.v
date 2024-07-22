module instruction_mem (input[31:0] PC, output reg[31:0] Instr );

reg[31:0] mem[0:255];

initial begin
    $readmemb("instructions.txt", mem);
end

always @(*) begin
    Instr = mem[PC >> 2]; end
endmodule