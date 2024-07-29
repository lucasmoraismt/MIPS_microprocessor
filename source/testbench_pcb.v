module tb_pc;

    reg clk;
    reg reset;
    reg branch;
    reg zero;
    reg [31:0] branch_address;
    reg [31:0] next_pc;
    wire [31:0] pc_out;

    pc uut (
        .clk(clk),
        .reset(reset),
        .branch(branch),
        .zero(zero),
        .branch_address(branch_address),
        .next_pc(next_pc),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 0;
        branch = 0;
        zero = 0;
        branch_address = 32'b00000000000000000000000000000000; 
        next_pc = 32'b00000000000000000000000000000100; 

        reset = 1;
        #10;
        $display("Reset ativado: pc_out = %b", pc_out);
        reset = 0;
        #10;
        $display("Reset desativado: pc_out = %b", pc_out);

        branch = 0;
        zero = 0;
        next_pc = 32'b00000000000000000000000000001000;
        #10;
        $display("Next PC: pc_out = %b", pc_out);

        // Teste de branch não satisfeito
        branch = 1;
        zero = 0;
        branch_address = 32'b00000000000000000000000000010000;
        #10;
        $display("Branch não satisfeito: pc_out = %b", pc_out);

        branch = 1;
        zero = 1;
        branch_address = 32'b00000000000000000000000000100000;
        #10;
        $display("Branch satisfeito: pc_out = %b", pc_out);

        $stop;
    end
endmodule
