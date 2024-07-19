module tb_main_decoder;
  
    reg [5:0] op;

    reg memtoreg;
    reg memwrite;
    reg branch;
    reg aluscr;
    reg regdst;
    reg regwrite;
    reg jump;
    reg [1:0] aluop;
  
   main_decoder md(
    
    .op(op),
    .memtoreg(memtoreg),
    .memwrite(memwrite),
    .branch(branch),
    .aluscr(aluscr),
    .regdst(regdst),
    .regwrite(regwrite),
    .jump(jump),
    .aluop(aluop)
    
  );
  
  // Testbench
  initial 
  begin
    
    // Inicialização
    op = 6'b000000; #10; // R-type
    op = 6'b001000; #10; // addi
    op = 6'b000100; #10; // beq
    op = 6'b000010; #10; // jump
    op = 6'b100011; #10; // lw
    op = 6'b101011; #10; // sw
    op = 6'b000001; #10; // default
  
    $finish;
  end
  
  initial 
  begin
    $monitor("Time = %0t | regwrite = %b | regdst = %b | aluscr = %b | branch = %b | memtoreg = %b | jump = %b | aluop = %b | op = %b ", 
             $time, regwrite, regdst, aluscr, branch, memtoreg, jump, aluop, op);
  end
endmodule