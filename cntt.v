`timescale 1ns/1ns
module test;
reg rst,clk;
wire [3:0]counter;
parameter STEP=1000;
cnt cnt(rst,clk,counter);
always #(STEP/2) clk=~clk;
initial begin
  rst=0;clk=0;
  #(STEP/2) rst=1;
  #STEP rst=0;
  #(5*STEP) rst=1;
  #STEP $finish;

end
initial  begin
$dumpfile("cnt.lxt");
$dumpvars(0, cnt);
end
initial $monitor($stime,"rst=%b clk=%b counter=%b",rst,clk,counter);
endmodule