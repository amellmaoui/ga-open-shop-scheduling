function GATotal()
global Pm
global Pc        %probability of crossover
global chromosome
global everyGenResult
global boundGen  %����@�N�ƽd��A�λ��n�Ҽ{���@�N�ƽd��
global numOfGen
global pop_size
global TotalGen
global jobInfo
global c          %every job of machine makespan
global temp
global numOfMach
global numOfJob
global NowGen
global Run
global TotalGen
global swMutation
global swCrossover
global EachRunResult
global EachRunChr
global TotalRun
%global AllRunChr
%global AllRunAns

GATinit            %��l�Ƥ@���ܼ�
a=0;
if a==1
   prompt={'Enter the Probability of mutation (Pm) :','Enter the Probability of crossover (Pc):',...
           'Enter the generations you want to run:','Enter the population size(pop_size):' };
   def={'0.1','0.3','10','30'};
   dlgTitle='Input initial parameters for Genetic Algorithm ';
   lineNo=1;
   answer=inputdlg(prompt,dlgTitle,lineNo,def);
   AddOpts.Resize='on';
   AddOpts.WindowStyle='normal';
   AddOpts.Interpreter='tex';
   
   
   Pm=str2num(answer{1})
   Pc=str2num(answer{2})
   numOfGen=str2num(answer{3})
   pop_size=str2num(answer{4})
end
Pm=0.4
Pc=0.8
numOfGen=100
pop_size=30
   
   %swCrossover=menu('�A�Q�n�έ���Crossover��k�O�H','PartialMapXover','OrderXover','CyclicXover','PosBasedOX','OrderBasedOX')
   swCrossover=2
   %swMutation=menu('�A�Q�b��ӵ{���̥έ��ج��ܤ�k�O ? ', ' randExMut ','ShiftMut' )
   swMutation=1
   
  %for Pm=0.1:0.1%:0.9
  %   for Pc=0.1:0.1%:0.9
  %      for pop_size=10:10%:30
  %         for swCrossover=2:2
  %            for swMutation=1:1
                 for Run=1:TotalRun        %Run is for to get average performance

                       tic

                  gen_chromosome(pop_size,numOfJob)   %chromosome length represent how many jobs
                     for NowGen=1:TotalGen
                         GATMainProc                   
                      end                                  
                         GAT_stat  %collect Run times data and calculate it
                  end   
                    GAT_statDraw  
                    GATDrawGantt   %you can ask user that "draw the best gantt chart or not"
                    
 %             end
 %          end
 %       end
%     end
  %Graphical Interface output------------------
  %Tell the user what kind of Crossover & Mutation they used
  %drawBarChart %Record the frequency of all the solution 
  
%for ix=1:TotalRun
%  AllRunChr(size(AllRunChr,1)+1:size(AllRunChr,1)+size(EachRunChr{ix},1),:) =[EachRunChr{ix}];
%end
%for ix=1:size(AllRunChr,1)
%   AllRunAns(ix,:)=[makespan(AllRunChr(ix,:)),AllRunChr(ix,:)   ];
%end   
%patterns=unique(AllRunAns,'rows');
%
%for ix=1:size(patterns,1)
%   patterns(ix,7)=length(find(AllRunAns(:,1)==patterns(ix,1) ));
%end   
%
%forPieData=[patterns(:,1),patterns(:,7)]
%figure(gcf+1)
%pie( patterns(:,7),[1,zeros(1,length(patterns(:,7))-1) ]);
%suptitle(['�b�Ҧ�Run����,�ثe�̨θ�(best value)=',num2str(patterns(1,1)),' ,�X�{�����:',num2str(patterns(1,7)/sum(patterns(:,7))*100 ),'%'])
%set(gcf,'position',[ 1 29 1024 672 ]) %1024*768�N�ù����̤j�A�n�`�N�ѪR�ת����D

%and the speed of finding the best current solution  ***
     
%     drawPieChart %Record the percent all the best solution be found
     %draw lineChart
     %saveToFile
