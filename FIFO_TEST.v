// Code your testbench here
// or browse Examples
module tst;
  reg clk, reset, we, re;
	reg [7:0] in;
	wire [7:0] out;
	wire empty, full;
  	wire [7:0] counter;
  reg[7:0] tmp;
  FIFO ffo(clk,reset,in,out,we,re,empty,full,counter);
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      clk = 0;
      reset = 1;
      re = 0;
      we = 0;
      in = 0;
       tmp =0;
      #50 reset = 0;
      push(1);
        pop(tmp);

        // Test 2
        push(1); push(2); push(3); push(4);
        push(5); push(6); push(7); push(8);
        push(9);

        // Test 3
        pop(tmp); pop(tmp);
        push(10); 
    end
  always
   #100 clk = ~clk;
  task push;
        input[7:0] data;
        if (full)
            $display("---Cannot push: Buffer Is Full---");
        else begin
            $display("Pushed ", data);
            in = data;
            we = 1;
            @ (posedge clk);
                #1 we = 0;
        end
    endtask

    task pop;
        output [7:0] data;
        if (empty)
            $display("---Cannot Pop: Buffer Is Empty---");
        else begin
            re = 1;
            @(posedge clk);
                #1 re = 0;
            data = out;
          $display("-------------------------------Popped ", data);
        end
    endtask

      
endmodule
