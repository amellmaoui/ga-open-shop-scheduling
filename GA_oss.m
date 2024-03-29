%GA_oss denote the Genetic Algorithm Open Shop Scheduling Problem

function GA_oss()
clear all
close all
global Pm
global Pc        %probability of crossover
global chromosome
global everyGenResult
global boundGen  % limited generation bound, or just meaning the generations we considered
global numOfGen
global pop_size
global TotalGen
global jobInfo
global timeTable
global numOfJob
global numOfMach
%global someValue
global temp


GA_init            % to generate the initial chromosome, and just iniialize some variables

%如果最近☆200代的最佳值的變化小於「某數」，或世代總數達到要求，則停止
%if TotalGen>boundGen
%   if  everyGenResult{TotalGen,2}-everyGenResult{TotalGen-boundGen,2}<someValue | TotalGen==numOfGen
%       return
%   end   
%end



while TotalGen < numOfGen
    GAMainProc
end
save timeTable
%Graphical Interface output------------------
%Tell the user what kind of Crossover & Mutation they used
%drawGanttChart
drawGanttChart2007
%draw lineChart
%saveToFile