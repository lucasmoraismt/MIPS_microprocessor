module tb_signext;

    // Inputs
    reg [15:0] a;

    // Outputs
    wire [31:0] y;

    signext uut (
        .a(a), 
        .y(y)
    );

    initial begin
        // Monitor the values
        $monitor("Time = %0t | Input a = %b | Output y = %b", $time, a, y);

        // Initialize Inputs
        a = 16'b0000000000000000; // 0
        #10;
        a = 16'b0000000000000001; // 1
        #10;
        a = 16'b0000000000000010; // 2
        #10;
        a = 16'b1000000000000000; // -32768 in 2's complement
        #10;
        a = 16'b1111111111111111; // -1 in 2's complement
        #10;
        a = 16'b0111111111111111; // 32767
        #10;

      
        $finish;
    end

endmodule
