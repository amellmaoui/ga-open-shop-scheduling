%GA_oss denote the Genetic Algorithm Open Shop Scheduling Problem

function GA_oss()
global Pm
global Pc        %probability of crossover
global chromosome
global everyGenResult
global boundGen  % limited generation bound, or just meaning the generations we considered
global numOfGen
global pop_size
global TotalGen
global jobInfo
%global someValue
global c          %every job of machine makespan
global temp

GA_init            % to generate the initial chromosome, and just iniialize some variables

%�p�G�̪�200�N���̨έȪ��ܤƤp��u�Y�ơv�A�Υ@�N�`�ƹF��n�D�A�h����
%if TotalGen>boundGen
%   if  everyGenResult{TotalGen,2}-everyGenResult{TotalGen-boundGen,2}<someValue | TotalGen==numOfGen
%       return
%   end   
%end



while TotalGen < numOfGen
    GAMainProc
end

%Graphical Interface output------------------
%Tell the user what kind of Crossover & Mutation they used
drawGanttChart
%draw lineChart
%saveToFile