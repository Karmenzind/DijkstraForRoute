
% �峡
close all
clc
clear;

% ����ǰ·����������·��
if count(py.sys.path, pwd) == 0
    insert(py.sys.path,int32(0), pwd);
end

% ����·�����˽ṹ
global topo;
global V_NUM;
% topo = tmp1;
V_NUM = length(topo);
load('RouteTopo.mat');

% չʾ����ͼ
global initFig; 
global from_;
global to_;
global origem_ui;
global distino_ui;
initFig = figure;
set(initFig, 'position', [500 300 1000 618]);
createButton();
createTopoPlot(topo);