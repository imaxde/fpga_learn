module adder_1_bit_tb;

  logic c_in, c_out, a, b, sum;

  const logic [7:0] CInParams = 8'b0000_1111;
  const logic [7:0] AParams = 8'b0011_0011;
  const logic [7:0] BParams = 8'b0101_0101;

  const logic [7:0] SumExpected = 8'b0110_1001;
  const logic [7:0] COutExpected = 8'b0001_0111;

  adder_logic_1_bit add (
      .a(a),
      .b(b),
      .sum(sum),
      .c_in(c_in),
      .c_out(c_out)
  );

  initial begin
    for (
        int i = 0; i < 8; i++
    )
        begin
      c_in = CInParams[i];
      a    = AParams[i];
      b    = BParams[i];
      #10;
      assert (SumExpected[i] === sum & COutExpected[i] === c_out)
        $display(
            "%b (из переполнения) + %b + %b = %b (%b в переполнении)",
            c_in,
            a,
            b,
            sum,
            c_out
        );
      else begin
        $display({"\nЧто-то тут не так:",
                  "\nc_in = %b, a = %b, b = %b, sum = %b, c_out = %b",
                  "\nsum_expect = %b, c_out_expect = %b"}, c_in, a, b, sum, c_out, SumExpected[i],
                   COutExpected[i]);
        $fatal;
      end
    end
  end
endmodule