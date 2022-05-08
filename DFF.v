module DFF(clk,Q,QB,D);
input clk,D;
output Q,QB;
reg Q;
always@(posedge clk )
  if(D==1)
    Q<=D;
  else Q<=0;
assign QB=~Q;
endmodule
