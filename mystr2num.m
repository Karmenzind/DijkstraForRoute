function [ res ] = mystr2num( str )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

try
    global V_NUM;
    eval(str);
    res = str2num(str);
    assert( (res<=V_NUM)&&(res>=1) )
catch
    error('输入有误，请输入1-6之间的数字');
end
end

