module sheffer_implication (
    input  logic a,
    input  logic b,
    output logic c
);

    wire n_b;

    sheffer_stroke nb(.a(b), .b(b), .c(n_b));
    sheffer_stroke base(.a(a), .b(n_b), .c(c));
endmodule