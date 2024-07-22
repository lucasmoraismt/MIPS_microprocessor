module tb_mux32;

    // Declaração das variáveis de teste
    reg [31:0] in0;  // Primeira entrada de teste
    reg [31:0] in1;  // Segunda entrada de teste
    reg sel;         // Seletor de teste
    wire [31:0] out; // Saída do multiplexador

    // Instanciação do módulo a ser testado
    mux32 uut (
        .in0(in0), 
        .in1(in1), 
        .sel(sel), 
        .out(out)
    );


    // Procedimento inicial para o teste
    initial begin
        // Monitorar os sinais para depuração
        $monitor("Time = %0t, sel = %b, in0 = %b, in1 = %b, out = %b", $time, sel, in0, in1, out);

        // Teste 1: sel = 0, out deve ser igual a in0
        in0 = 32'b10101010101010101010101010101010;  // Valor de teste para in0
        in1 = 32'b01010101010101010101010101010101;  // Valor de teste para in1
        sel = 0;             // Seleciona in0
        #10;                 // Esperar 10 unidades de tempo

        // Teste 2: sel = 1, out deve ser igual a in1
        sel = 1;             // Seleciona in1
        #10;

        // Teste 3: mudar valores de in0 e in1
        in0 = 32'b00010010001101000101011001111000;  // Novo valor de teste para in0
        in1 = 32'b10000111011001010011001100100001;  // Novo valor de teste para in1
        sel = 0;             // Seleciona in0
        #10;

        sel = 1;             // Seleciona in1
        #10;

        // Finalizar a simulação
        $finish;
    end

endmodule
