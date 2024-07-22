module Testbench;
    reg [31:0] PC;
    wire [31:0] Instr;

    instruction_mem imem (
        .PC(PC),
        .Instr(Instr)
    );

    initial begin
        PC = 0; #10;
        $display("Instruction at Address 0: %b", Instr);
        PC = 4; #10;
        $display("Instruction at Address 4: %b", Instr);
        PC = 8; #10;
        $display("Instruction at Address 8: %b", Instr);
        PC = 12; #10;
        $display("Instruction at Address 12: %b", Instr);
    end
endmodule
