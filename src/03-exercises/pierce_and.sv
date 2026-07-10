module pierce_and (
    input  logic a,
    input  logic b,
    output logic c
);

    wire n_a, n_b;

    pierce_arrow na(.a(a), .b(a), .c(n_a));
    pierce_arrow nb(.a(b), .b(b), .c(n_b));
    pierce_arrow na_or_nb(.a(n_a), .b(n_b), .c(c));
endmodule