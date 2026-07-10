module pierce_sheffer_tb;

  logic a, b;
  logic pand, por, pimp, sand, sor, simp;

  const logic [3:0] AParams = 4'b0011;
  const logic [3:0] BParams = 4'b0101;

  const logic [3:0] AndExpected = 4'b0001;
  const logic [3:0] OrExpected  = 4'b0111;
  const logic [3:0] ImpExpected = 4'b1101;

  pierce_and pd1(.a(a), .b(b), .c(pand));
  pierce_or pd2(.a(a), .b(b), .c(por));
  pierce_implication pd3(.a(a), .b(b), .c(pimp));
  sheffer_and sd1(.a(a), .b(b), .c(sand));
  sheffer_or sd2(.a(a), .b(b), .c(sor));
  sheffer_implication sd3(.a(a), .b(b), .c(simp));

  initial begin
    for (int i = 0; i < 4; i++) begin
      a = AParams[i];
      b = BParams[i];
      #10;
      assert (AndExpected[i] === pand && AndExpected[i] === sand &&
              OrExpected[i]  === por  && OrExpected[i]  === sor  &&
              ImpExpected[i]  === pimp && ImpExpected[i]  === simp)
        $display("a=%b b=%b | and=%b or=%b imp=%b", a, b, pand, por, pimp);
      else begin
        $display("\nошибка:");
        $display("a=%b b=%b | pand=%b(exp %b) por=%b(exp %b) pimp=%b(exp %b) sand=%b(exp %b) sor=%b(exp %b) simp=%b(exp %b)",
                 a, b, pand, AndExpected[i], por, OrExpected[i], pimp, ImpExpected[i],
                 sand, AndExpected[i], sor, OrExpected[i], simp, ImpExpected[i]);
        $fatal;
      end
    end
  end
endmodule