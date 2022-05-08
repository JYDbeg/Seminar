module debug(clk,res,p_c,d_c,start);
input clk,res,start;
output [32:0]p_c,d_c;
reg [32:0] p_c,d_c;
always @(posedge clk or posedge res)begin
  if(res==1)begin
  p_c<=0;
  d_c<=0;
  end
end
always@(posedge start)begin
      p_c=1+p_c+{$random}%10;
      d_c=1+d_c+{$random}%10;
end
endmodule