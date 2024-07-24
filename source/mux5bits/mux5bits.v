module mux5 (
    input wire [4:0] in0,  // Primeira entrada de 5 bits
    input wire [4:0] in1,  // Segunda entrada de 5 bits
    input wire sel,        // Seletor
    output wire [4:0] out  // Saída de 5 bits
);

    // Lógica do multiplexador
    assign out = sel ? in1 : in0;

endmodule
