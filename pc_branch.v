module pc(
    input clk,
    input reset,
    input branch,
    input zero,
    input [31:0] branch_address,
    input [31:0] next_pc,
    output reg [31:0] pc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;
        else if (branch && zero)
            pc_out <= branch_address;
        else
            pc_out <= next_pc;
    end
endmodule
