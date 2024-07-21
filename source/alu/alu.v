module ALU(

    input [31:0] scrA,
    input [31:0] scrB,
    input [3:0] alucontrol,

    output reg [31:0] aluresult,
    output zero

);

    always @(*) 
    begin

        case (alucontrol)
            4'b0000: aluresult = scrA & scrB; // AND
            4'b0001: aluresult = scrA | scrB; // OR
            4'b0010: aluresult = scrA + scrB; // ADD
            4'b0110: aluresult = scrA - scrB; // SUB
            4'b0111: aluresult = (scrA < scrB) ? 1 : 0; // SLT
            4'b1010:
            begin

                if(scrB != 0) aluresult = scrA / scrB; // DIV
                else aluresult = 32'b11111111111111111111111111111111;

            end
            default: aluresult = 0;
        endcase
            
    end

    assign zero = (aluresult == 0);
endmodule