`timescale 1ns/1ns
module test;
reg clk,res,start,hit,stand;
wire win,lose,tie;
wire [4:0]p_c,d_c;
simpleBlackjack simpleBlackjack(clk,res,win,lose,tie,hit,start,stand,p_c,d_c);
parameter STEP =1000 ;
always #(STEP/2) clk=~clk;
initial begin
    clk=0;res=0;hit=0;start=0;stand=0;
    #STEP res=1;
    #STEP res=0;
    #(STEP/10) start=1;
    #(STEP/50) hit=1;
    #(STEP/50) hit=0;
    #(STEP/50) stand=1;
    #STEP $finish;
end
initial  begin
$dumpfile("bl.lxt");
$dumpvars(0, simpleBlackjack);
end
endmodule // test