module vm(clk,rst,i_1,i_2,drink,change,i_3,buy,giveup);
input clk,rst,i_1,i_2,buy,giveup;
output [3:0]drink,i_3,change;
reg [3:0]change,drink,i_3;
integer cost=3;
/*clk,rst以外の入出力について説明する
　　　　↓↓　　　↓↓　　　↓↓
i_1=タイプ1の硬貨を入れたら立ち上がり。  i_2＝タイプ2の硬貨を入れたら立ち上がり。  i_3=入れた金額の合計。
drink＝買った飲み物の数。  change＝お釣り？。  buy＝購入する。  giveup＝買うのを止める。  cost=飲み物の値段。
　　　　↑↑　　　↑↑　　　↑↑
clk,rst以外の入出力について説明する.*/
always@(posedge clk or posedge rst)begin
   if(rst==1)begin
      i_3<=0;
      drink<=0;
      change<=0;
   end
end
always@(posedge i_1 or posedge i_2)begin //金を入れる
  if(i_1==1) 
    i_3<=i_3+4'b0001;
  if(i_2==1)
    i_3<=i_3+4'd2; 
end
always@(posedge buy)begin //購入する
  if(i_3<cost)begin
    #2
    if(i_3>=cost)begin
    drink<=drink+1;
    i_3<=i_3-cost;
  end
  end
  if(i_3>=cost)begin
    #2
    drink<=drink+1;
    i_3<=i_3-cost;
  end
end
always@(posedge giveup)begin//返却ボタン
  #1
  change<=change+i_3;
  i_3<=0;
end
endmodule
