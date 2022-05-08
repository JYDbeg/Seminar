module simpleBlackjack(clk,res,win,lose,tie,hit,start,stand,p_c,d_c);
input clk,res,start,hit,stand;
output win,lose,tie;
output [4:0]p_c,d_c;
reg [4:0]p_c,d_c;
reg win,lose,tie;
integer n=3;

always @(posedge clk or posedge res)begin
  if(res==1)begin
  win<=0;
  lose<=0;
  tie<=0;
  p_c<=0;
  d_c<=0;
  end
end
always@(posedge start)begin
    while(n>1)begin
      p_c<=1+p_c+{$random}%10;
      d_c<=1+d_c+{$random}%10;
      n=n-1;
  end
end
always @(posedge hit)begin
  p_c<=p_c+1+{$random}%10;
end
always @(negedge hit)begin
  if(p_c>5'b10101)
  lose<=1;
 end
always @(posedge stand)begin
  while(d_c<=p_c)begin
    d_c<=d_c+1+{$random}%10;
    end
  if(d_c>5'b10101)
  win<=1;
  if(d_c>p_c)
  lose<=1;
  if(d_c==p_c)
  tie<=1;
end
endmodule
