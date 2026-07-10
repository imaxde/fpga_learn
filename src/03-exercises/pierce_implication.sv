module pierce_implication (
    input  logic a,
    input  logic b,
    output logic c
);

    wire n_a, n_a_or_b;

    pierce_arrow na(.a(a), .b(a), .c(n_a));
    pierce_arrow base(.a(n_a), .b(b), .c(n_a_or_b));
    pierce_arrow dbl(.a(n_a_or_b), .b(n_a_or_b), .c(c));
endmodule