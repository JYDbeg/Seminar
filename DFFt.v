`timescale 1ns/1ns
module test;
  reg clk,D;
  wire Q,QB;
parameter STEP=1000;
DFF DFF(clk,Q,QB,D);
always #(STEP/2) clk=~clk;
initial begin
  D=0;clk=0;
  #STEP D=0;
  #STEP D=1;
  #STEP D=1;
  #STEP D=0;
  #STEP D=1;
  #STEP $finish;

end
initial  begin
$dumpfile("DFF.lxt");
$dumpvars(0, DFF);
end
initial $monitor($stime,"clk=%b D=%b Q=%b QB=%b",clk,D,Q,QB);
endmodule