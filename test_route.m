function Floyd(A)
% 求复杂网络路由矩阵以及平均路径长度
% 求解算法：首先利用Floyd算法求解出任意两节点的距离

   N=size(A,2);                                           %返回矩阵的列数N，即网络的中的节点数
   D=A;
   D(find(D==0))=inf;                                 %将邻接矩阵变为邻接距离矩阵，两点无边相连时赋值为inf，自身到自身的距离为0.
   for i=1:N           
       D(i,i)=0;       
   end
   
   E=D;
   save du E
   
    path=zeros(N,N);
    for i=1:N
          for j=1:N
              if D(i,j)~=inf                           %无穷大
                 path(i,j)=j;                          %path赋值为终止结点
              end
              path(i,i)=0;
          end
    end
   for k=1:N                                             %Floyd算法求解任意两点的最短距离
       for i=1:N
           for j=1:N
               if D(i,j)>D(i,k)+D(k,j);
                  D(i,j)=D(i,k)+D(k,j);                 %求最短路径
                  path(i,j)=path(i,k);                  %从目的结点往前找，存离i最近的一个相连接的结点，即最短路径从起始结点开始的下一个结点
               end
           end
       end
   end
   %构造三维的路由表
    for m=1:N
       for n=1:N
           k=2;                              %表示页数，从第二页开始D存两个结点之间的路由
           i=m;
           while 1                           %开始寻找最短路径上的结点
                  D(m,n,k)=path(i,n);
               k=k+1;
               if path(i,n)==0||path(i,n)==n;
                   break;
               end
               i=path(i,n);
           end
       end
    end
    save rount D  
  disp(['最短路径算法路由表成功建立']); 
end