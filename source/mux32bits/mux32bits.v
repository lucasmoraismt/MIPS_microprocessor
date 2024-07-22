module mux32 (
    input wire [31:0] in0,  // Primeira entrada de 32 bits
    input wire [31:0] in1,  // Segunda entrada de 32 bits
    input wire sel,         // Seletor
    output wire [31:0] out  // Saída de 32 bits
);

    // Lógica do multiplexador
    assign out = sel ? in1 : in0;

endmodule

