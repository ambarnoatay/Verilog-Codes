module half_adder_tb;
 
  reg[3:0] A,B;
  reg Cin;
  wire[3:0] S;
  wire C;
  full_adder_4b fa4(S,C,A,B,Cin);
 
  initial
    begin
      $monitor("time = %d \t a = %b \t b = %b \t cin = %b \t  s = %b \t carry_out = %b  \t",$time,A,B,Cin,S,C);
      A = 4'd0;
      B = 4'd0;
      Cin = 1'b0;
      #10 A = 4'd2;
      B = 4'd5;
      #10
      A = 4'd9;
      B = 4'd9;
      #10
      A = 4'd10;
      B = 4'd15;
      #10
      A = 4'd10;
      B = 4'd5; Cin = 1'b1;
      
    end 
 
endmodule
