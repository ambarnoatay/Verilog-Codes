//testbench
// Code your testbench here
// or browse Examples
module half_adder_tb;
 
  reg A,B;
  wire S,C;
  half_adder half_adder_inst
  (S,C,A,B);
 
  initial
    begin
      $monitor("time = %d \t a = %b \t b = %b \t s = %b \t c = %b \t",$time,A,B,S,C);
      A = 1'b0;
      B = 1'b0;
      #10;
     A = 1'b0;
      B = 1'b1;
      #10;
      A = 1'b1;
      B = 1'b0;
      #10;
      A = 1'b1;
      B = 1'b1;
      #10;
    end 
 
endmodule // half_adder_tb
