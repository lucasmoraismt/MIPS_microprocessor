module tb_mux5;

    // Declaração das variáveis de teste
    reg [4:0] in0;  // Primeira entrada de teste
    reg [4:0] in1;  // Segunda entrada de teste
    reg sel;        // Seletor de teste
    wire [4:0] out; // Saída do multiplexador

    // Instanciação do módulo a ser testado
    mux5 uut (
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
        in0 = 5'b10101;  // Valor de teste para in0
        in1 = 5'b01010;  // Valor de teste para in1
        sel = 0;         // Seleciona in0
        #10;             // Esperar 10 unidades de tempo

        // Teste 2: sel = 1, out deve ser igual a in1
        sel = 1;         // Seleciona in1
        #10;

        // Teste 3: mudar valores de in0 e in1
        in0 = 5'b00011;  // Novo valor de teste para in0
        in1 = 5'b11100;  // Novo valor de teste para in1
        sel = 0;         // Seleciona in0
        #10;

        sel = 1;         // Seleciona in1
        #10;

        // Finalizar a simulação
        $finish;
    end

endmodule
