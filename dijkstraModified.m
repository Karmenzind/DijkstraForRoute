function dijkstraModified(N,D,Origem,Destino)
    % N -> ������Ŀ
    % D -> �������
    % DA -> �ۼƾ������
    % NovaDA -> ���ź���ۼƾ������
    % Ant -> ǰ�ڵ����
    % ExpA -> ��չ�ڵ����
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
    ExpA = [];
    C = Origem;
    res = [];
    
    disp('��ʼ���ۼƾ������...');
    disp(DA);
    fprintf('��ʼ����ǰ�ڵ�Ϊ %d\n', C);
    
    for i = 1:N
        ExpA(i) = 0;
        DA(i) = Inf;
    end
    disp('����չ�ڵ����Ϊ');
    fprintf('(���ÿ���չ�ڵ�Ϊ0������չΪ1)\n');
    disp(ExpA);
    disp('��ʼ����㵽���ڵ����·��ΪInf');
    disp('��ʱ�ۼƾ������Ϊ');
    disp(DA);
    
    itr = 0;
    DA(C) = 0;
    disp('��ʼ��չ...')
    while (C ~= Destino)&&(C ~= 0)
        disp('----------------------------');
        fprintf('[��ǰ�ڵ�] %d\n', C);
        itr = itr + 1;
        fprintf('[��ǰ��������] %d\n', itr);
        sub_keys = ngLst{C}.keys();
%         for i = sub_dct.keys()
        for tmp_i = 1:py.len(sub_keys)
            i = sub_keys{tmp_i};
%             disp(tmp_i); disp(i);
            if (ngLst{C}{i}~=0) && (ExpA(i)==0)
                fprintf('�ӵ�ǰ��㵽 �ڵ�%d��\n', i )
                fprintf('\tȨ��Ϊ%d\n', ngLst{C}{i});
                NovaDA = DA(C) + ngLst{C}{i};
                fprintf('\tȨ���뵱ǰ���·����ӽ��Ϊ��%d\n', NovaDA);
                if NovaDA < DA(i)
                    DA(i) = NovaDA;
                    Ant(i) = C;
                    fprintf('\t���С�����е����·�����ɳڳɹ�\n');
                else
                    fprintf('\t�����С�����е����·�����ɳ�ʧ��\n');
                end
                fprintf('\t��ʱ���·��Ϊ%d\n', DA(i));
            end
        end
        
        ExpA(C) = 1;
        fprintf('�ӵ�ǰ���%d�������ڽڵ���չ��ϣ�ˢ�¿���չ����\n', C);
        disp(ExpA);
        disp('��ǰ���·������Ϊ');
        disp(DA);
        
        Min = Inf;
        C = 0;
        disp('����Ѱ����һ���ڵ�...');
        disp('������:����չ�����·��С�ڵ�ǰ�������·����');
        for i = 1:N
            if(ExpA(i)==0)&&(DA(i)<Min)
                Min = DA(i);
                C = i;
            end
        end
        fprintf('������������һ���ڵ�Ϊ%d\n', C);
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