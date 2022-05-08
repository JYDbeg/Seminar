`timescale 1ns/1ns
module test(
    
);

reg clk,res,start;
wire [32:0]p_c,d_c;
debug debug(clk,res,p_c,d_c,start);
parameter STEP =1000 ;
always #(STEP/2) clk=~clk;
initial begin
  clk=0;res=0;start=0;
  #STEP res=1;
  #STEP res=0;
  #STEP start=1;
  #(STEP/10) start=0;
  #STEP start=1;
  #(STEP/10) start=0;
  #STEP $finish;

end
initial  begin
$dumpfile("db.lxt");
$dumpvars(0, debug);
end
endmodule // test