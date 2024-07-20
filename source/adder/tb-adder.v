module tb_adder;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] y;

    // Instantiate the Unit Under Test (UUT)
    adder uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Monitor the values
        $monitor("Time = %0t | a = %b | b = %b | y = %b", $time, a, b, y);

        // Initialize Inputs
        a = 32'b00000000000000000000000000000000;
        b = 32'b00000000000000000000000000000000;
        #10;

        // Test Case 1
        a = 32'b00000000000000000000000000001010; // 10 in binary
        b = 32'b00000000000000000000000000001111; // 15 in binary
        #10;

        // Test Case 2
        a = 32'b00000000000000000011000000111001; // 12345 in binary
        b = 32'b00000000000000010000100111110010; // 67890 in binary
        #10;

        // Test Case 3
        a = 32'b11111111111111111111111111111111; // Maximum 32-bit unsigned value (4294967295)
        b = 32'b00000000000000000000000000000001; // 1 in binary
        #10;

        // Test Case 4
        a = 32'b01111111111111111111111111111111; // Maximum 32-bit signed value (2147483647)
        b = 32'b00000000000000000000000000000001; // 1 in binary
        #10;

        // Test Case 5
        a = 32'b11111111111111111111111111111111; // -1 in two's complement
        b = 32'b00000000000000000000000000000010; // 2 in binary
        #10;

        // Finish simulation
        $finish;
    end

endmodule
