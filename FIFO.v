module FIFO (clk,rst,buf_in,buf_out,wr_en,rd_en,buf_empty,buf_full,fifo_counter);
  input clk,rst,wr_en,rd_en;
  input [7:0] buf_in;
  output [7:0] buf_out;
  output buf_empty,buf_full;
  output [7:0] fifo_counter;
  reg [7:0] buf_out;
  reg buf_empty,buf_full;
  reg [6:0] fifo_counter;
  reg [3:0] rdptr,wrptr;
  reg [7:0] buf_mem[63:0];
  always@(fifo_counter)
    begin
      buf_empty = (fifo_counter==0);
      buf_full = (fifo_counter== 64);
    end
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        fifo_counter<=0;
      else if((!buf_full&&wr_en)&&(!buf_empty&&rd_en))
        fifo_counter<=fifo_counter;
      else if(!buf_full&&wr_en)
        fifo_counter<=fifo_counter+1;
      else if(!buf_empty&&rd_en)
        fifo_counter<=fifo_counter-1;
      else
        fifo_counter<=fifo_counter;
    end
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        buf_out<=0;
      else 
        begin
          if(rd_en&&!buf_empty)
            buf_out<=buf_mem[rdptr];
          else
            buf_out<=buf_out;
        end
    end
  always@(posedge clk)
    begin
      if(wr_en && !buf_full)
        buf_mem[wrptr] <= buf_in;
      else
        buf_mem[wrptr]<=buf_mem[wrptr];
    end
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          wrptr<=0;
          rdptr<=0;
        end
      else
        begin
          if(!buf_full && wr_en)
            wrptr<=wrptr+1;
          else
            wrptr<=wrptr;
          if(!buf_empty && rd_en)
            rdptr<=rdptr+1;
          else
            rdptr<=rdptr;
        end
    end
endmodule
        
      
