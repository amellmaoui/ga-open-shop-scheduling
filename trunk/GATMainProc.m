function GATMainProc()
% This program is the project of jiing in 2002

global Pm
global Pc        %probability of crossover
global chromosome
global everyGenResult
global boundGen  %����@�N�ƽd��A�λ��n�Ҽ{���@�N�ƽd��
global numOfGen
global pop_size
global TotalGen
global jobInfo
global someValue
global swDynaGraph
global temp
global c          %every job of machine makespan
global elapsedTime
global NowGen
global ObjChromosome
global Run

fprintf('\n\n==================�{�b�O��%d�^�X===��%d�N==========================\n',Run,NowGen)

%Pc���Ϊk�O�A�A������pop_size�Ӥ���0�P1�������H���ơA�o���H���ƭY��0.3�h��ܥ��̭ncrossover
%�M��ncrossover���A�A���H���֨��t��A��M�o�A�o�ëD�ثe�ڪ��@�k

%now, I randomly choose two chromosome and let them crossover
%GA_crossover----------------------------------------------------------------
for i=1:(pop_size*Pc/2)  %�]��crossover�O�H�אּ���
     t=mod(abs(ceil(rand(1,2)*10)),size(chromosome,1))  ;   
     a=t(1);
     b=t(2);
     if a==0      %let a and b do not equal to 0
        a=a+1;
     elseif b==0
        b=b+1;
     end
     
     Va=chromosome(a,:);
     Vb=chromosome(b,:);
     [newVa,newVb]=GACros(Va,Vb);
     chromosome(size(chromosome,1)+1,:)=newVa;
     chromosome(size(chromosome,1)+1,:)=newVb;
  end
  
%GA_mutation----------------------------------------------------------------
for i=1:round(pop_size*Pm)
   a=abs(ceil(rand(1,1)*10));
   if a==0
      a=a+1 ;  
   end
   Va=chromosome(a,:);
   newVa=GAMut(Va);
   chromosome(size(chromosome,1)+1,:)=newVa;
end

%GA_object            %�p��Ҧ��V���骺�ؼЭ�--------------------------------
for ix=1:size(chromosome,1)
   objValue(ix)=1/makespan(chromosome(ix,:));
end

ObjChromosome=[objValue',chromosome];

%GA_selection         %�|�^�O�ؼЭȸ��t���V����-------------------------------------
sortedOandC=flipud(sortrows(ObjChromosome))  ;               %�`�N�ثe���V����w�Ƨ� �A�ȥΦp�����覡
ObjChromosome=sortedOandC(1:pop_size,:);

chromosome=ObjChromosome(:,2:size(ObjChromosome,2) );
everyGenResult{NowGen,1}=chromosome;
everyGenResult{NowGen,2}=sortedOandC(1,1);
elapsedTime=toc;                     %record the execution time of run #TotalGen 
everyGenResult{NowGen,3}=elapsedTime;

fprintf('��ثe����̨�makespan�O%d\n',  makespan(chromosome(1,:)));

StrResult{1,1}=num2str(chromosome(1,1) );
for ix=2:size(chromosome(1,:),2) 
  StrResult{1,ix}=strcat('-',num2str(chromosome(1,ix)));
end
Best_job_seq=strcat(StrResult{1,:});
fprintf('��ثe����̨�job_seq�O:%s',Best_job_seq);




