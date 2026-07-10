module pierce_or (
    input  logic a,
    input  logic b,
    output logic c
);

    wire a_or_b;

    pierce_arrow base(.a(a), .b(b), .c(a_or_b));
    pierce_arrow dbl(.a(a_or_b), .b(a_or_b), .c(c));
endmodule