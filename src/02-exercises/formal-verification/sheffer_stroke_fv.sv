module sheffer_stroke_fv (
    input  logic a,
    input  logic b,
    output logic c
);

    assign c = ~(a & b);

    `ifdef FORMAL
        always @* begin
            assert (c == ~(a & b));
            cover (a == 1'b1 && b == 1'b1);
            cover (c == 1'b0);
        end
    `endif
endmodule