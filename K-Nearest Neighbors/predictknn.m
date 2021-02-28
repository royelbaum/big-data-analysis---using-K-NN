

function retval = predictknn (classifier, Xtest)
  Ytest=[];
  for i=1:length(Xtest)
    dists=[];
    for j=1:classifier.m
      dists(j,1)=norm(double(Xtest(i,:))-double(classifier.Xtrain(j,:)));
      #disp(double(Xtest(i,:)));
      #disp(["not double"])
      #disp(Xtest(i));
      dists(j,2)=j;
    endfor
    dists=sortrows(dists);
    #disp(dists);
    dists=dists(:,2);
    #disp(dists);
    k_first=dists(1:classifier.k);
    #disp(k_first);
    #Yset= containers.Map('KeyType','double','ValueType','double');
    Yset=[];        #Yset contains the labels
    Ycount=[];      #Ycount holds the number of times each label occur
    for j=1:classifier.k
      tag=classifier.Ytrain(k_first(j));
      #if ~isKey(Yset,tag)
        #addEntry(Yset,tag,1);
       if ~ismember(tag,Yset)
        Yset(length(Yset)+1)=tag;
        Ycount(length(Yset)+1)=1;
        #disp(Yset(tag))
       
        #Yset(tag)=Yset(tag)+1;
      endif
      if ismember(tag,Yset)
        indx=find(Yset==tag);
        Ycount(indx)=Ycount(indx)+1;
       
      endif
    endfor
    
    y=0;
    valMax=0;
    #disp(Yset);
      
    for t=1:length(Yset)
      #disp(key);
      key=Ycount(t);
      if valMax<key
        valMax=key;
        y=Yset(t);
      endif

      endfor
    Ytest(i)=y;
   
  
  endfor
  
retval=Ytest';
endfunction
