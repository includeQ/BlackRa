clear;
%导入数据
File=["E2270K.txt" "E2330K.txt" "E2360K.txt" "E2400K.txt" "E2440K.txt" ...
    "E2500K.txt" "E2580.txt"];
Lab_Data=load("Data\"+File(4));
lambda=Lab_Data(:,1);%横坐标
E_e=Lab_Data(:,2);%纵坐标

% %静态图
% plot(lambda,E_e);
% axis([800,2500,0,4000]);%坐标轴范围

%模拟实验过程进行动态绘图

% %动画法
% h=animatedline;%创建动画
% axis([800,2500,0,4000]);%坐标轴范围
% 
% pic_num=1;
% for i=1:length(lambda)
%     addpoints(h,lambda(i),E_e(i));
% 
%     F=getframe(gcf);
%     I=frame2im(F);
%     [I,map]=rgb2ind(I,256);
%     if pic_num==1
%         imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);
%     elseif mod(pic_num,3)==1
%         imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',...
%             0.2);
%     end
%     pic_num=pic_num+1;
%     drawnow limitrate
% end

% %右边界运动法
% plot(lambda(1),E_e(1),'-r');
% rlim=801;%右边界
% axis([800,rlim,0,4000]);
% grid("on");
% 
% for i=1:1699
%     hold("on");
%     plot(lambda,E_e,'-r');
%     rlim=rlim+1;
%     axis([800,rlim,0,4000]);
%     pause(0.0001);
% end

% %画点法
% axis([800,2500,0,4000]);%坐标轴范围
% grid("on");%网格
% 
% for i=1:length(lambda)%循环画点
%     hold("on");
%     plot(lambda(i),E_e(i),'.-b');
%     pause(0.0001);
% end
% plot(lambda,E_e,'-b');

%线条法
axis([800,2500,0,4000]);
grid("on");

for j=2:length(lambda)
    hold("on");
    i=j-1;
    plot(lambda(i:j),E_e(i:j),'-g');
    pause(0.0001);
end

