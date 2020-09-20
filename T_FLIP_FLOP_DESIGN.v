
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
  always@(posedge rst or posedge clk)
    if(rst)
      q = 1'b0;
  	else 
      q=d;
endmodule
           
