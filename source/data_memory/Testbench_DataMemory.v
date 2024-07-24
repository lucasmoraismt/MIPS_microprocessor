module tb_data_memory;

    reg clk;
    reg MemWrite;
  reg [31:0] ALUResult;
  reg [31:0] WriteData;
  wire [31:0] ReadData;

    DataMemory uwu (
        .clk(clk),
      .MemWrite(MemWrite),
      .ALUResult(ALUResult),
      .WriteData(WriteData),
      .ReadData(ReadData)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        MemWrite = 0;
        ALUResult = 0;
        WriteData = 0;

        #10;
        ALUResult = 32'b100;
        WriteData = 32'b10111011100;
        MemWrite = 1;
        #20;
        MemWrite = 0;

        #10;
        ALUResult = 32'b100;

      if (ReadData == 32'b10111011100) begin
            $display("Teste de escrita e leitura bem-sucedido!");
        end else begin
            $display("Erro no teste de escrita e leitura.");
        end

        #10;
        $finish;
    end

endmodule
