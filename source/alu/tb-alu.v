module tb_ALU;
  
  	reg [31:0] scrA;
    reg [31:0] scrB;
    reg [3:0] alucontrol;

    wire [31:0] aluresult;
    wire zero;
  
    ALU alu(
        
        .scrA(scrA),
        .scrB(scrB),
        .alucontrol(alucontrol),
        .aluresult(aluresult),
        .zero(zero)
    
    );
  
  // Testbench
  initial 
  begin

        // Teste de AND
        scrA = 32'b00000000000000000000000000001010; // 10
        scrB = 32'b00000000000000000000000000000101; // 5
        alucontrol = 4'b0000; // and
        #10;
    $display("AND: %b & %b = %b", scrA, scrB, aluresult);

        // Teste de OR
        scrA = 32'b00000000000000000000000000001010; // 10
        scrB = 32'b00000000000000000000000000000101; // 5
        alucontrol = 4'b0001; // or
        #10;
        $display("OR: %b | %b = %b", scrA, scrB, aluresult);

        // Teste de adição
        scrA = 32'b00000000000000000000000000001010; // 10
        scrB = 32'b00000000000000000000000000010100; // 20
        alucontrol = 4'b0010; // add
        #10;
        $display("Add: %b + %b = %b", scrA, scrB, aluresult);

        // Teste de subtração
        scrA = 32'b00000000000000000000000000011110; // 30
        scrB = 32'b00000000000000000000000000001111; // 15
        alucontrol = 4'b0110; // sub
        #10;
        $display("Sub: %b - %b = %b", scrA, scrB, aluresult);

        // Teste de SLT
        scrA = 32'b00000000000000000000000000000101; // 5
        scrB = 32'b00000000000000000000000000001010; // 10
        alucontrol = 4'b0111; // slt
        #10;
        $display("SLT: %b < %b = %b", scrA, scrB, aluresult);

        // Teste de divisão
        scrA = 32'b00000000000000000000000001100100; // 100
        scrB = 32'b00000000000000000000000000011001; // 25
        alucontrol = 4'b1010; // div
        #10;
        $display("Div: %b / %b = %b", scrA, scrB, aluresult);

        // Teste de divisão por zero
        scrA = 32'b00000000000000000000000001100100; // 100
        scrB = 32'b00000000000000000000000000000000; // 0
        alucontrol = 4'b1010; // div
        #10;
        $display("Div: %b / %b = %b", scrA, scrB, aluresult);

        // Finalizando o teste
        $finish;
    end
  
endmodule