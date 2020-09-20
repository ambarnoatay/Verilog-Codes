//Johnson's Counter
module johnsoncounter(q,clk,rst);
  input clk,rst;
  output [3:0] q;
  dff dff0(q[3],~q[0],clk,rst);
  dff dff1(q[2],q[3],clk,rst);
  dff dff2(q[1],q[2],clk,rst);
  dff dff3(q[0],q[1],clk,rst);
endmodule
module dff(q,d,clk,rst);
  output q;
  input d,clk,rst;
  reg q;
  always@(posedge rst or negedge clk )
    begin
      if(rst)
        q=1'b0;
      else 
        q = d;
    end
endmodule

      
