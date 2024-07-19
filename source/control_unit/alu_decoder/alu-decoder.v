module alu_decoder(

    input [5:0] funct,
    input [1:0] aluop,

    output reg [3:0] alucontrol

);

    always @(*) 
    begin

        case (aluop)
            
            2'b00: alucontrol = 4'b0010; // add para lw, sw, addi
            2'b01: alucontrol = 4'b0110; // sub para beq
            2'b10: // R-type
            begin

                case (funct)

                    6'b100000: alucontrol = 4'b0010; // ADD
                    6'b100010: alucontrol = 4'b0110; // SUB
                    6'b101010: alucontrol = 4'b0111; // SLT
                    6'b011010: alucontrol = 4'b1010; // DIV
                    6'b100100: alucontrol = 4'b0000; // AND
                    6'b100101: alucontrol = 4'b0001; // OR
                    default: alucontrol = 4'bxxxx;

                endcase

            end
            default: alucontrol = 4'b0000;

        endcase
        
    end
endmodule