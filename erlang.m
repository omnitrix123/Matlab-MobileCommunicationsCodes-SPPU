clc;close all;clear all;

%calculate traffic
%notations used: A = traffic in erlangs,TH=average holding time for a 
%particular call,C=average no of calls made in busy hour
%     A=TH*C/60 (here calls are observed for a period of 60 minutes)

%so in step 1: from user input the value of C and TH
%output the calculated traffic using above formula

noOfCalls=input('enter the no of calls during busy hour');
holdingTime=input('enter the holding time in minutes');
trafficCarried=(noOfCalls*holdingTime)/60;

%calculation of blocking probability
noOfTrunks=6;
dr=0;nr=0;

for j=0:5:50
    dr=0;nr=0;
    trafficCarried=j;
   
    for i=1:(noOfTrunks+1)
        dr=dr+((trafficCarried)^(i-1)/factorial(i-1))
    end
    nr=(trafficCarried^noOfTrunks)/(factorial(noOfTrunks));
    blockingprobability(j+1)=nr/dr;
end
erlangs=0:50;
stem(erlangs,blockingprobability)
xlabel('traffic in erlang');
ylabel('blocking probability');


