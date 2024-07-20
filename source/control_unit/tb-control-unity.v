module tb_control_unity;
    
    reg [5:0] op;
    reg [5:0] funct;
    reg zero;
    reg branch;

    wire memtoreg;
    wire memwrite;
    wire pcsrc;
    wire alusrc;
    wire regdst;
    wire regwrite;
    wire jump;
    wire [2:0] alucontrol;

    control_unity conunt(
        
        .op(op),
        .funct(funct),
        .zero(zero),
        .branch(branch),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    
    );
  
    // Testbench
    initial 
    begin
        
        // Inicialização
        branch = 0; zero = 0; #10;
        branch = 0; zero = 1; #10;
        branch = 1; zero = 0; #10;
        branch = 1; zero = 1; #10;
    
        $finish;

    end
    
    initial 
    begin
        $monitor("Time = %0t | branch = %b | zero = %b | pcsrc = %b", 
                $time, branch, zero, pcsrc);
    end

endmodule