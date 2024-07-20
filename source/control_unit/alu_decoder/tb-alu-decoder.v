module tb_alu_decoder;
  
  	reg [5:0] funct;
    reg [1:0] aluop;

    wire [3:0] alucontrol;
  
    alu_decoder ad(
        
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    
    );
  
  // Testbench
  initial 
  begin
    
    // Inicialização
    aluop = 2'b00; funct = 6'bxxxxxx; #10; // addi, jump, lw, sw
    aluop = 2'b01; funct = 6'bxxxxxx; #10; // beq
    aluop = 2'b10; funct = 6'b100000; #10; // ADD
    aluop = 2'b10; funct = 6'b100010; #10; // SUB
    aluop = 2'b10; funct = 6'b101010; #10; // SLT
    aluop = 2'b10; funct = 6'b011010; #10; // DIV
    aluop = 2'b10; funct = 6'b100100; #10; // AND
    aluop = 2'b10; funct = 6'b100101; #10; // OR
    aluop = 2'bxx; funct = 6'bxxxxxx; #10; // default
  
    $finish;
  end
  
  initial 
  begin
    $monitor("Time = %0t | aluop = %b | funct = %b | alucontrol = %b", 
             $time, aluop, funct, alucontrol);
  end
endmodule