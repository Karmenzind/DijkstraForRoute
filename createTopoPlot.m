function [] = createTopoPlot(A)
    % 画出路由拓扑结构
    % 离散点随机生成
    
    DEF=length(A);
    x=100*rand(1,DEF);
    y=100*rand(1,DEF);

    plot(x,y, 'o');      
    for i=1:DEF 
        clear a;
        a = find(A(i,:)>0); 
        if ~isempty(a)
            for j=1:length(a)
                if isequal(A(i, a(j)), Inf)
                    continue
                end
                c = [num2str(A(i,a(j)))]; 
                text((x(i)+x(a(j)))/2,(y(i)+y(a(j)))/2, c,'Fontsize',12);
                hold on; 
                line([x(i) x(a(j))],[y(i) y(a(j))]); 
            end  
        end
    end         
    title('路由拓扑结构'); 
    e=num2str(DEF); 
    legend(e);
    for m=1:DEF 
         A(m,m)=m; 
         f=num2str(A(m,m)); 
         hold on;
         text((x(m)+x(m))/2,(y(m)+y(m))/2,f,'Fontsize',20, 'Color', 'red'); 
end 
