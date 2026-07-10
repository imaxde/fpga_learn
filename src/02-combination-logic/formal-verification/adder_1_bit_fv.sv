module adder_1_bit_fv (
    input logic a,
    input logic b,
    input logic c_in,
    input logic c_out,
    input logic sum
);

    assign sum = a ^ b ^ c_in;
    assign c_out = (a & b) | (c_in & (a ^ b));

    `ifdef FORMAL
        always @* begin
            assert ({c_out, sum} == (a + b + c_in));
            cover (c_in == 1'b1 && sum == 1'b0);
        end
    `endif
endmodule
