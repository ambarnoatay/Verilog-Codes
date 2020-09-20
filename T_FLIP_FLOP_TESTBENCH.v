module tst;
  reg clk,rst;
  wire q;
  tff t1(.q(q), .rst(rst), .clk(clk));
  initial begin
    $dumpfile("tst.vcd");
      $dumpvars(1);
    clk = 1'b0;
  end
  always
    #5 clk = ~clk;
  initial begin
    rst = 1'b0;
    #15 rst = 1'b1;
    #10 rst = 1'b0;
    #180 rst = 1'b1;
    #10 $finish;
  end
  initial $monitor($time, "output q = %d",q);
endmodule
