function Floyd(A)
% ��������·�ɾ����Լ�ƽ��·������
% ����㷨����������Floyd�㷨�����������ڵ�ľ���

   N=size(A,2);                                           %���ؾ��������N����������еĽڵ���
   D=A;
   D(find(D==0))=inf;                                 %���ڽӾ����Ϊ�ڽӾ�����������ޱ�����ʱ��ֵΪinf����������ľ���Ϊ0.
   for i=1:N           
       D(i,i)=0;       
   end
   
   E=D;
   save du E
   
    path=zeros(N,N);
    for i=1:N
          for j=1:N
              if D(i,j)~=inf                           %�����
                 path(i,j)=j;                          %path��ֵΪ��ֹ���
              end
              path(i,i)=0;
          end
    end
   for k=1:N                                             %Floyd�㷨��������������̾���
       for i=1:N
           for j=1:N
               if D(i,j)>D(i,k)+D(k,j);
                  D(i,j)=D(i,k)+D(k,j);                 %�����·��
                  path(i,j)=path(i,k);                  %��Ŀ�Ľ����ǰ�ң�����i�����һ�������ӵĽ�㣬�����·������ʼ��㿪ʼ����һ�����
               end
           end
       end
   end
   %������ά��·�ɱ�
    for m=1:N
       for n=1:N
           k=2;                              %��ʾҳ�����ӵڶ�ҳ��ʼD���������֮���·��
           i=m;
           while 1                           %��ʼѰ�����·���ϵĽ��
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
  disp(['���·���㷨·�ɱ�ɹ�����']); 
end