function GATinit()
global Pm
global Pc
global chromosome
global everyGenResult
global numOfGen    %�n�]���`�@�N�ƤW��
global swCrossover %��ܦU�إ�t���}��
global swMutation    %��ܦU�ج��ܪ��}��
global swDynaGraph
global pop_size
global NowGen
global jobInfo
global numOfMach
global numOfJob
global TotalGen
global EachRunResult
global EachRunChr
global TotalRun
%global AllRunChr
%global AllRunAns


close all
Ans=menu('�A�O�_�n�ϥ��H�����D���;�?','�O���A�ڭn��','���ΤF�A��Ū���ɮפ����d�ҧY�i');
if Ans==1
   %gaProblemgen
   load Problem
   jobInfo=Problem
else   
   load jobInfo.txt
end

chromosome=[];
everyGenResult=[];

numOfMach=size(jobInfo,1)-1
numOfJob=size(jobInfo,2)

 %prompt={'Enter the generations you want to run:'};
 %  def={'10'};
 %  dlgTitle=['Please input the generations you want to run'];
 %  lineNo=1;
 %  answer=inputdlg(prompt,dlgTitle,lineNo,def);
 %  AddOpts.Resize='on';
 %  AddOpts.WindowStyle='normal';
 %  AddOpts.Interpreter='tex';  
   
 %  numOfGen=str2num(answer{1})
 numOfGen=100 
 TotalGen=numOfGen;
 TotalRun=20

EachRunResult=[];
EachRunChr=[];
%AllRunChr=[];
%AllRunAns=[];
