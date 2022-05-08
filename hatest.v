`timescale 1ns/1ns
module test;
  reg a,b;
  wire c,s;
ha ha(a,b,c,s);
  parameter STEP=1000;
initial begin
  a=0;b=0;
  #STEP a=1;b=0;
  #STEP a=1;b=1;
  #STEP a=0;b=1;
  #STEP a=1;b=1;
  #STEP a=0;b=0;
  #STEP $finish;

end
initial  begin
$dumpfile("hat.lxt");
$dumpvars(0, ha);
end
initial $monitor($stime,"a=%b b=%b c=%b s=%b",a,b,c,s);
endmodule