//Mealy Machine (FSM) to detect the overlapping sequence 101 
module seq101(det,inp, clk,rst);
  input inp,clk,rst;
  output reg det;
  parameter s0 = 2'b10, s1 = 2'b01, s2 = 2'b11;
  reg[1:0] prs,nxs;
  always@(posedge clk)
    begin
    if(rst)
      prs=s0;
  else
    prs=nxs;
    end
  always@(inp,prs)
    case(prs)
      s0:if(inp)
        	nxs = s1;
      		else
              nxs = s0;
      s1: if(inp)
        	nxs = s1;
      		else
              nxs = s2;
      s2: if(inp)
        	nxs = s1;
      	else
          	nxs = s0;
      default: nxs = s0;
    endcase
  always@(inp,prs)
    case(prs)
      s0: det=1'b0;
      s1: det=1'b0;
      s2: if(inp)
        	det=1'b1;
      	else
          	det=1'b0;
      default: det=1'b0;
    endcase
endmodule
