module sheffer_and (
    input  logic a,
    input  logic b,
    output logic c
);

    wire a_nand_b;

    sheffer_stroke base(.a(a), .b(b), .c(a_nand_b));
    sheffer_stroke dbl(.a(a_nand_b), .b(a_nand_b), .c(c));
endmodule