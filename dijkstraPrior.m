function dijkstraPrior(N,D,Origem,Destino)
    % N -> ������Ŀ
    % D -> �������
    % DA -> �ۼƾ������
    % Ant -> ǰ�ڵ����
    % Origem -> ���
    % Destino -> �յ�
    % C -> ��ǰ��
    
    ngLst = mat2lst(D);
    disp(ngLst);
    disp('-----------------------------------------------');
    fprintf('·�ɽڵ�������%d\n��㣺%d\n�յ㣺%d\n', N, Origem, Destino);
    disp('�ڵ�Ȩ���ڽӱ����£�'); 
    for idx = 1:N
        fprintf([idx ' ']);
        fprintf('%s', py.str(ngLst{idx}));
        fprintf('\n');
    end
    
    DA = zeros();
    Ant = [];
    C = Origem;
    res = [];
    
    fprintf('��ʼ����ǰ�ڵ�Ϊ %d\n', C);
    fprintf('��ʼ�����ȶ���');
    PriQ = py.priority.PriorityQueue();  % based on heap
 
    for i = 1:N
        DA(i) = Inf;
        PriQ{i} = Inf;
    end
    PriQ{Origem} = 0;
    
    disp('��ʼ����㵽���ڵ����·��ΪInf');
    disp('��ʱ�ۼƾ������Ϊ');
    DA(C) = 0;
    disp(DA);
    itr = 0;
    
    disp('��ʼ��չ...')
    while (C~=Destino) && (py.len(PriQ)~=0)
        disp('----------------------------');
        C = PriQ.pop_smallest();
        disp('�����ȶ����л�ȡ���ȼ���ߵĽڵ�');
        fprintf('[��ǰ�ڵ�] %d\n', C);
        itr = itr + 1;
        fprintf('[��ǰ��������] %d\n', itr);
        sub_keys = ngLst{C}.keys();
        for tmp_i = 1:py.len(sub_keys)
            i = sub_keys{tmp_i};
            if (ngLst{C}{i}~=0) && (isequal(i, C)||PriQ.has_key(i))
                fprintf('�ӵ�ǰ��㵽 �ڵ�%d��\n', i )
                fprintf('\tȨ��Ϊ%d\n', ngLst{C}{i});
                NovaDA =DA(C) + ngLst{C}{i};
                fprintf('\tȨ���뵱ǰ���·����ӽ��Ϊ��%d\n', NovaDA);
                if NovaDA < DA(i)
                    DA(i) = NovaDA;
                    PriQ{i} = NovaDA;
                    Ant(i) = C;
                    fprintf('\t���С�����е����·�����ɳڳɹ�\n');
                else
                    fprintf('\t�����С�����е����·�����ɳ�ʧ��\n');
                end
                fprintf('\t��ʱ���·��Ϊ%d\n', PriQ{i});
            end
        end
        disp('��ǰ���ȶ���Ϊ');
        disp(PriQ);
    end
    if C == Destino
        disp('�����յ�...');
        disp('--------------------');
        disp('���·�����£�');
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
        disp('����·��֮��û��ͨ·');
    end

end