module ripple_carry_counter(q,clk,rst);
  input clk,rst;
  output [3:0]q;
  tff tff0(q[0],clk,rst);
  tff tff1(q[1],q[0],rst);
  tff tff2(q[2],q[1],rst);
  tff tff3(q[3],q[2],rst);
endmodule
module tff(q,clk,rst);
  input clk,rst;
  output q;
  wire d;
  dff dff0(q,d,clk,rst);
  not(d,q);
endmodule
module dff(q,d,clk,rst);
  output q;
  input d,clk,rst;
  reg q;
  always@(posedge rst or negedge clk)
    if(rst)
      q = 1'b0;
  	else 
      q=d;
endmodule
           
