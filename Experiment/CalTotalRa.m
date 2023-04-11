%使用数值积分法计算实验数据的总辐出度
clear;
%导入数据
File=["E2270K.txt" "E2330K.txt" "E2360K.txt" "E2400K.txt" "E2440K.txt" ...
    "E2500K.txt" "E2580.txt"];
Lab_Data=load("Data\"+File(1));
lambda=Lab_Data(:,1);%横坐标
E_e=Lab_Data(:,2);%能量密度实验值

T=2270;

%使用理论值补全波长小于800nm，大于2500nm时的能量密度
Eel=CalEth(0:799,T);%波长小于800时的能量密度理论值
Eem=transpose(E_e);%实验值
Eer=CalEth(2501:10000,T);%波长大于2500时的能量密度理论值
E_e=[Eel Eem Eer];%补全后的实验值
E_e(1)=0;
lambda=0:10000;
bar(lambda,E_e);
axis([0,10000,0,6000]);

%使用数值积分计算总辐出度R
R=0;
for i=1:10000
    R=R+E_e(i);
end

delta=R/power(T,4);

function E_t = CalEth(lambda,T) %计算能量密度的理论值的函数
%物理常数
h=6.62607015*10^-34;
c=299792458;
k=1.380649*10^-23;
%经验参数
c1=2*pi*h*c^2;
c2=h*c/k;
%自变量
Lambda=lambda*10^-9;%单位m
%普朗克公式的代码形式
E_t=(c1./power(Lambda,5)).*...
    (1./(exp(c2./(Lambda.*T))-1))*10^-9;
end
