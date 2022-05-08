module cnt(rst,clk,counter);
input rst,clk;
output [3:0] counter;
reg [3:0]counter;
always@(posedge clk)
  if(rst==1)
  counter<=0;
  else if(rst==0)
  counter<=counter+1;
endmodule // counterrst,clk,counter)
