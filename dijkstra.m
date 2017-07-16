function dijkstra(N,D,Origem,Destino)
    % N -> 顶点数目
    % D -> 距离矩阵
    % DA -> 累计距离矩阵
    % NovaDA -> 扩张后的累计距离矩阵
    % Ant -> 前驱节点矩阵
    % ExpA -> 扩展节点矩阵
    % Origem -> 起点
    % Destino -> 终点
    % C -> 当前点

    disp('-----------------------------------------------');
    fprintf('路由节点总数：%d\n起点：%d\n终点：%d\n', N, Origem, Destino);
    fprintf('节点权重邻接矩阵如下：\n(Inf为infinite无限大，代表两点不相邻)\n'); 
    disp(D);

    DA = zeros();
    Ant = [];
    ExpA = [];
    C = Origem;
    res = [];
    
    disp('初始化累计距离矩阵...');
    disp(DA);
    fprintf('初始化当前节点为 %d\n', C);
    
    for i = 1:N
        ExpA(i) = 0;
        DA(i) = Inf;
    end
    disp('可扩展节点矩阵为');
    fprintf('(设置可扩展节点为0，已扩展为1)\n');
    disp(ExpA);
    disp('初始化起点到各节点最短路径为Inf');
    disp('此时累计距离矩阵为');
    disp(DA);
    
    itr = 0;  % iteration，记录当前迭代次数
    DA(C) = 0;
    disp('开始扩展...')
    while (C ~= Destino)&&(C ~= 0)
        disp('----------------------------');
        fprintf('[当前节点] %d\n', C);
        itr = itr + 1;
        fprintf('[当前迭代次数] %d\n', itr);
        for i = 1:N
            if (D(C,i)~=0) && (ExpA(i)==0)
                fprintf('从当前结点到 节点%d：\n', i )
                fprintf('\t权重为%d\n', D(C,i));
                NovaDA = DA(C) + D(C,i);
                fprintf('\t权重与当前最短路径相加结果为：%d\n', NovaDA);
                if NovaDA < DA(i)
                    DA(i) = NovaDA;
                    Ant(i) = C;
                    fprintf('\t结果小于已有的最短路径，松弛成功\n');
                else
                    fprintf('\t结果不小于已有的最短路径，松弛失败\n');
                end
                fprintf('\t此时最短路径为%d\n', DA(i));
            end
        end
        
        ExpA(C) = 1;
        fprintf('从当前结点%d到各相邻节点扩展完毕，刷新可扩展矩阵\n', C);
        disp(ExpA);
        disp('当前最短路径矩阵为');
        disp(DA);
        
        Min = Inf;
        C = 0;
        disp('遍历寻找下一个节点...');
        disp('（条件:可扩展，最短路径小于当前已有最短路径）');
        for i = 1:N
            if(ExpA(i)==0)&&(DA(i)<Min)
                Min = DA(i);
                C = i;
            end
        end
        fprintf('满足条件的下一个节点为%d\n', C);
    end
    if C == Destino
        disp('到达终点...');
        disp('--------------------');
        disp('最短路径如下：');
        while C ~= Origem
            res = [C; res];
            C = Ant(C);
        end
        res = [Origem; res];
        for p=1:(length(res)-1)
            fprintf('%d --> ', res(p));
        end
        fprintf('%d\n', res(p+1));
    else
        disp('两个路由之间没有通路');
    end

end