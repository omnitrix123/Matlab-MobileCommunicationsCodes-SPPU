%Matlab code to simulate Hata-Okumura Models
%please refer manual for the formulas

clc;clear all;
%----------Input Section---------------
Hbts= 50 ;%Height measured from the base of the BTS tower to the radiation centerline
Tbts = 350 ;%Terrain elevation at the location of the BTS
Htav= 300;%Height of the average terrain (from 3 Km to 15 km distance from the BTS)
Hm=3 ;%Height of the mobile antenna in meters
f=900 ;%100:100:3000; %Range of frequencies in MHz
d=0.5:0.5:15; %Range of Tx-Rx separation distances in Kilometers
Pt = 0.020; %Power transmitted by the BTS antenna in Watts
Gt= 10; %BTS antenna gain in dBi
%--------------------------------------
Hb=Hbts+Tbts-Htav ;%Effective Height of the BTS antenna in meters

display('1:Big City (Urban model 2:Small & Medium City (Urban model) 3:Sub-urban environment 4:Open Rural environment');
display('Hata-Okumura Model');
reply = input('Select Your choice of environment=');

switch reply
case 1
    C=0;
    if f<=200
        aHm=8.29*(log10(1.54*Hm))^2-1.1;
    else
        aHm=3.2*(log10(11.75*Hm))^2-4.97;
    end

case 2
    C=0;
    aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
case 3
    aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
    C=-2*(log10(f/28))^2-5.4;

case 4
     aHm = (1.1*log10(f)-0.7)*Hm-(1.56*log10(f)-0.8);
     C=-4.78*(log10(f))^2+18.33*log10(f)-40.98;

otherwise ,
     error('Invalid model selection');
end
 
A = 69.55 + 26.16*log10(f) - 13.82*log10(Hb)-aHm;
B = 44.9 - 6.55*log10(Hb);

PL=A+B*log10(d)+C;
subplot(2,1,1)
plot(d,PL,'r','LineWidth',2);
title(['Hata-Okumura Model for case ' int2str(reply)]);
xlabel('Distance - Kilometers');
ylabel('Path Loss (dB)');

%Compute Received Signal Level
Pr = 10*log10(Pt*1000)+Gt-PL
subplot(2,1,2)
plot(d,Pr,'r','LineWidth',2);
title(['Hata-Okumura Model for case ' int2str(reply)]);
xlabel('Distance - Kilometers');
ylabel('Received Signal Level (dBm)');

