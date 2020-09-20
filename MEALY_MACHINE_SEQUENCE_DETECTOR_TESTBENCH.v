module tst;
  reg clk,rst,inp;
  wire det;
  seq101 s(.det(det),.inp(inp),.clk(clk),.rst(rst));
  initial begin
     $dumpfile("dump.vcd");
 	 $dumpvars(1);
    clk=1'b0;
  end
always 
  #5 clk = ~clk;
  
initial begin

 rst = 1'b1;
 
 #10 rst = 1'b0;  
 #10 inp = 1'b0; 
 #10 inp = 1'b1; 
 #10 inp = 1'b0;
 #10 inp = 1'b1;
 #10 inp = 1'b1; 
 #10 inp = 1'b0; 
 #10 inp = 1'b1;
 #10 inp = 1'b1;
 #10 inp = 1'b0; 
 #10 inp = 1'b0; 
 #10 inp = 1'b1;
 #10 inp = 1'b0;
 #10 inp = 1'b1; 
 #10 inp = 1'b1; 
 #10 inp = 1'b0;
 #10 $finish;
end
  initial $monitor($time, "output det = %d and input = %b",det,inp);
endmodule
