module tb_shift_left2;

    
    reg [31:0] a;  // Registrador para a entrada "a"
    wire [31:0] y; // Fio para a saída "y"

    
    shift_left2 uut (
        .a(a),   
        .y(y)    
    );

    
    initial begin
        // Monitorar os sinais para depuração
        $monitor("Time = %0t, a = %b, y = %b", $time, a, y);

        // Atraso inicial para estabilização
        #10;

        // Aplicar valores de teste e verificar os retornos esperados
        a = 32'b00000000000000000000000000000001;  // Teste: 1
        #20;  
        // Esperado: 32'b00000000000000000000000000000100

        a = 32'b00000000000000000000000000000011;  // Teste: 3
        #20;
        // Esperado: 32'b00000000000000000000000000001100

        a = 32'b00000000000000000000000011111111;  // Teste: 255
        #20;
        // Esperado: 32'b00000000000000000000001111111100

        a = 32'b00000000000000001111111111111111;  // Teste: 65535
        #20;
        // Esperado: 32'b00000000000000111111111111111100

        a = 32'b11111111111111111111111111111111;  // Teste: -1 (ou 4294967295 em unsigned)
        #20;
        // Esperado: 32'b11111111111111111111111111111100

        a = 32'b00010010001101000101011001111000;  // Teste: valor arbitrário 12345678
        #20;
        // Esperado: 32'b01001000110100010101100111100000

        a = 32'b10000111011001010011001100100001;  // Teste: valor arbitrário 2271560481
        #20;
        // Esperado: 32'b00011101100101001100110010000100

        // Finalizar a simulação
        $finish;
    end

endmodule
