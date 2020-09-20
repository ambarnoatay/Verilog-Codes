module tst;
  reg clk,rst;
  wire [3:0] q;
  ripple_carry_counter r1(q,clk,rst);
  initial 
    begin
      $dumpfile("tst.vcd");
      $dumpvars(1);
    clk = 1'b0;
    end
  always
    #5 clk = ~clk;
  initial begin
    rst = 1'b1;
    #15 rst = 1'b0;
    #180 rst = 1'b1;
    #10 rst = 1'b0;
    #20 $finish;
  end
  initial 
    $monitor($time, "output q = %d",q);
endmodule
    
