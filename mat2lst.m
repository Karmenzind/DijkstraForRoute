function [ res ] = mat2lst(mat)
%UNTITLED4 Summary of this function goes here
%   �ڽӾ���ת�����ڽӱ�
%   ������������ݽṹ����python��dict��ʾ

    res = py.dict();
    for v = 1:length(mat)
        sub_dct = py.dict();
        for s = 1: length(mat)
            distance = mat(v, s);
            if (distance==Inf)
                continue
            end
            sub_dct{s} = distance;
        end
        res{v} = sub_dct;
    end
end

