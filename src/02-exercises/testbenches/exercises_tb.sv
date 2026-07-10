module exercises_tb;

  logic a, b;
  logic c_imp, c_nimp, c_pierce, c_sheffer;

  const logic [3:0] AParams = 4'b0011;
  const logic [3:0] BParams = 4'b0101;

  const logic [3:0] ImpExpected    = 4'b1101;
  const logic [3:0] NImpExpected   = 4'b0010;
  const logic [3:0] PierceExpected = 4'b1000;
  const logic [3:0] ShefferExpected= 4'b1110;

  implication imp (
    .a(a),
    .b(b),
    .c(c_imp)
  );

  nimplication nimp (
    .a(a),
    .b(b),
    .c(c_nimp)
  );

  pierce_arrow pierce (
    .a(a),
    .b(b),
    .c(c_pierce)
  );

  sheffer_stroke sheffer (
    .a(a),
    .b(b),
    .c(c_sheffer)
  );

  initial begin
    for (int i = 0; i < 4; i++) begin
      a = AParams[i];
      b = BParams[i];
      #10;
      assert (ImpExpected[i] === c_imp &&
              NImpExpected[i] === c_nimp &&
              PierceExpected[i] === c_pierce &&
              ShefferExpected[i] === c_sheffer)
        $display("a=%b b=%b | imp=%b nimp=%b pierce=%b sheffer=%b",
                 a, b, c_imp, c_nimp, c_pierce, c_sheffer);
      else begin
        $display("\nошибка:");
        $display("a=%b b=%b | imp=%b (expect %b) nimp=%b (expect %b) pierce=%b (expect %b) sheffer=%b (expect %b)",
                 a, b, c_imp, ImpExpected[i], c_nimp, NImpExpected[i],
                 c_pierce, PierceExpected[i], c_sheffer, ShefferExpected[i]);
        $fatal;
      end
    end
  end
endmodule