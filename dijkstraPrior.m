function dijkstraPrior(N,D,Origem,Destino)
    % N -> 顶点数目
    % D -> 距离矩阵
    % DA -> 累计距离矩阵
    % Ant -> 前节点矩阵
    % Origem -> 起点
    % Destino -> 终点
    % C -> 当前点
    
    ngLst = mat2lst(D);
    disp(ngLst);
    disp('-----------------------------------------------');
    fprintf('路由节点总数：%d\n起点：%d\n终点：%d\n', N, Origem, Destino);
    disp('节点权重邻接表如下：'); 
    for idx = 1:N
        fprintf([idx ' ']);
        fprintf('%s', py.str(ngLst{idx}));
        fprintf('\n');
    end
    
    DA = zeros();
    Ant = [];
    C = Origem;
    res = [];
    
    fprintf('初始化当前节点为 %d\n', C);
    fprintf('初始化优先队列');
    PriQ = py.priority.PriorityQueue();  % based on heap
 
    for i = 1:N
        DA(i) = Inf;
        PriQ{i} = Inf;
    end
    PriQ{Origem} = 0;
    
    disp('初始化起点到各节点最短路径为Inf');
    disp('此时累计距离矩阵为');
    DA(C) = 0;
    disp(DA);
    itr = 0;
    
    disp('开始扩展...')
    while (C~=Destino) && (py.len(PriQ)~=0)
        disp('----------------------------');
        C = PriQ.pop_smallest();
        disp('从优先队列中获取优先级最高的节点');
        fprintf('[当前节点] %d\n', C);
        itr = itr + 1;
        fprintf('[当前迭代次数] %d\n', itr);
        sub_keys = ngLst{C}.keys();
        for tmp_i = 1:py.len(sub_keys)
            i = sub_keys{tmp_i};
            if (ngLst{C}{i}~=0) && (isequal(i, C)||PriQ.has_key(i))
                fprintf('从当前结点到 节点%d：\n', i )
                fprintf('\t权重为%d\n', ngLst{C}{i});
                NovaDA =DA(C) + ngLst{C}{i};
                fprintf('\t权重与当前最短路径相加结果为：%d\n', NovaDA);
                if NovaDA < DA(i)
                    DA(i) = NovaDA;
                    PriQ{i} = NovaDA;
                    Ant(i) = C;
                    fprintf('\t结果小于已有的最短路径，松弛成功\n');
                else
                    fprintf('\t结果不小于已有的最短路径，松弛失败\n');
                end
                fprintf('\t此时最短路径为%d\n', PriQ{i});
            end
        end
        disp('当前优先队列为');
        disp(PriQ);
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