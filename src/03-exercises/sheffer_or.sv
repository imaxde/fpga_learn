module sheffer_or (
    input  logic a,
    input  logic b,
    output logic c
);

    wire n_a, n_b;

    sheffer_stroke na(.a(a), .b(a), .c(n_a));
    sheffer_stroke nb(.a(b), .b(b), .c(n_b));
    sheffer_stroke na_and_nb(.a(n_a), .b(n_b), .c(c));
endmodule