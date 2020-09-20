//Design
module half_adder (s,c,a,b);
  input a,b;
  output s;
  output c;
  
  
 
  assign s = a^b;  
  assign c = a&b;  
 
endmodule 
