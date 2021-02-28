
function classifier = learnknn(k, Xtrain, Ytrain)
  [m,d]=size(Xtrain);
  classifier=struct('k',k,'m',m,'d',d,'Xtrain',Xtrain,'Ytrain',Ytrain);
endfunction

