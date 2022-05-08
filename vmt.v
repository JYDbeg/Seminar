`timescale 1ps/1ps
module test(
    
);

reg clk,rst,i_1,i_2,buy,giveup;
wire [3:0]change,drink;
wire [3:0] i_3;
vm vm(clk,rst,i_1,i_2,drink,change,i_3,buy,giveup);
parameter STEP =1000 ;
always #(STEP/2) clk=~clk;
initial begin
  clk=0;rst=0;i_1=0;i_2=0;buy=0;giveup=0;i_1=0;i_2=0;
  #STEP rst=1;
  #STEP rst=0;
  #STEP i_1=1;
  #(STEP/10) giveup=1;i_1=0;
  #(STEP/100) i_2=1;giveup=0;
  #(STEP/100) i_2=0;
  #(STEP/10)  i_2=1;
  #(STEP/10) i_2=0;buy=1;
  #(STEP/10) i_2=1;buy=0;
  #STEP giveup=1;
  #STEP $finish;

end
initial  begin
$dumpfile("vm.lxt");
$dumpvars(0, vm);
end
endmodule // test