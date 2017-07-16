function [ res ] = mat2lst(mat)
%UNTITLED4 Summary of this function goes here
%   邻接矩阵转化成邻接表
%   方便起见，数据结构借用python的dict表示

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

