module control_unity (
    
    input [5:0] op,
    input [5:0] funct,
    input zero,
    input branch,

    output memtoreg,
    output memwrite,
    output pcsrc,
    output alusrc,
    output regdst,
    output regwrite,
    output jump,
    output [2:0] alucontrol

);

    assign pcsrc = branch & zero;
    
endmodule