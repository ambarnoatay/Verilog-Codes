module full_adder(ss,cc,x,y,ci);
input x,y,ci;
 output ss,cc;
 wire s1,c1,c2; 
  xor(s1,x,y);
  and(c1,x,y);
  xor(ss,ci,s1);
  and(c2,ci,s1);
  or(cc,c1,c2);
endmodule
module full_adder_4b (s,c,a,b,cin);
  input [3:0] a,b;
  input cin;
  output [3:0]s;
  output c;
  wire c1,c2,c3;
  full_adder fa0(s[0],c1,a[0],b[0],cin);
  full_adder fa1(s[1],c2,a[1],b[1],c1);
  full_adder fa2(s[2],c3,a[2],b[2],c2);
  full_adder fa3(s[3],c,a[3],b[3],c3);
  
 
endmodule 
