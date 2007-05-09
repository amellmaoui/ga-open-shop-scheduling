function GAMainProc()
global Pm
global Pc        %probability of crossover
global chromosome
global everyGenResult
global boundGen  % the limited generation bound, or say: the generation range we considered
global numOfGen
global pop_size
global TotalGen
global jobInfo
global someValue
global swDynaGraph
global temp
global c          %every job of machine makespan
global TotalGen
global swMutation
global objValue;

TotalGen = TotalGen+1;
fprintf('\n\n==================Now is the %d th generation==============================\n',TotalGen)
%Pc���Ϊk�O�A�A������pop_size�Ӥ���0�P1�������H���ơA�o���H���ƭY��0.3�h��ܥ��̭ncrossover
%�M��ncrossover���A�A���H���֨��t��A��M�o�A�o�ëD�ثe�ڪ��@�k
for i=1:(pop_size*Pc/2)  %�]��crossover�O�H�אּ���
     t=mod(abs(ceil(rand(1,2)*10)),size(chromosome,1))  ;   
     a=t(1);
     b=t(2);
     if a==0 
        a=a+1;
     elseif b==0
        b=b+1;
     end
     
     Va=chromosome(a,:);
     Vb=chromosome(b,:);
     [newVa,newVb]=GACros(Va,Vb);
     chromosome(size(chromosome,1)+1,:) = newVa;
     chromosome(size(chromosome,1)+1,:) = newVb;
end

for i=1:round(pop_size*Pm)
   a=abs(ceil(rand(1,1)*pop_size));
   if a==0
      a=a+1 ;  
   end
   Va=chromosome(a,:);
   newVa=GAMut(Va);
   chromosome(size(chromosome,1)+1,:)=newVa;
end

%GA_object            %�p��Ҧ��V���骺�ؼЭ�
%maxValue = 0;
%for ix=1:size(chromosome,1)
%    if maxValue < completeTime(chromosome(ix,:))
%       maxValue = completeTime(chromosome(ix,:));
%    end
%end

for ix=1:size(chromosome,1)
   objValue(ix)= completeTime(chromosome(ix,:));
end
objValue;
ObjChromosome=[objValue',chromosome];

%GA_selection         %�|�^�O�ؼЭȸ��t���V����
%sortedOandC=flipud(sortrows(ObjChromosome)) ;                %�`�N�ثe���V����w�Ƨ� �A�ȥΦp�����覡
sortedOandC=(sortrows(ObjChromosome)) ;                %�`�N�ثe���V����w�Ƨ� �A�ȥΦp�����覡
ObjChromosome=sortedOandC(1:pop_size,:);

chromosome=ObjChromosome(:,2:size(ObjChromosome,2) );

everyGenResult{TotalGen,1}=chromosome;
everyGenResult{TotalGen,2}=sortedOandC(1,1);

fprintf('��ثe����̨� complete time �O%d\n',  completeTime(chromosome(1,:)));
fprintf('��ثe����̨�job_seq�O %d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d-%d \n' ,  chromosome(1,:) );



%Draw the dynamic line---------------------------------------------------------------------
close all
if swDynaGraph==1
  shg
  %set(gcf,'')
  whitebg(1,'k')

  for ix=TotalGen:size(everyGenResult,1)
     temp(ix)=completeTime(everyGenResult{ix,1}(1,:) );
  end



  for ix=1:size(everyGenResult,1)-1
     plot([ix,ix+1],[temp(ix),temp(ix+1)],'y--');
     hold on;
  end
    drawnow

  for ix=TotalGen:size(everyGenResult,1)
     plot(ix,temp(ix),'gs--','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','y','MarkerSize',10);   
     hold on;   
  end
  grid on
  xlabel('�@�N��')
  ylabel('Weighted Complete Time')
  title(['�ϥΰ�]�t��k��Weighted Complete Time�ܤƧ�u��,  ��1�N���',num2str(TotalGen),'�N'] )

  %axis fill tight
  try
  graphYMin = min(temp(:));
  graphYMax = max(temp(:));
  set(gca,'ylim',[graphYMin-20,   graphYMax+20])
catch
    graphYMin
    graphYMax
end
end


