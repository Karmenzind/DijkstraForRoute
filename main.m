
% 清场
close all
clc
clear;

% 将当前路径加入搜索路径
if count(py.sys.path, pwd) == 0
    insert(py.sys.path,int32(0), pwd);
end

% 载入路由拓扑结构
global topo;
global V_NUM;
% topo = tmp1;
V_NUM = length(topo);
load('RouteTopo.mat');

% 展示拓扑图
global initFig; 
global from_;
global to_;
global origem_ui;
global distino_ui;
initFig = figure;
set(initFig, 'position', [500 300 1000 618]);
createButton();
createTopoPlot(topo);