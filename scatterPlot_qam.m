clc;close all;clear all;
M=4;
x=randint(1000,1,M);%1000 random quaternary data is generated
y=qammod(x,M);%modulation
yn=awgn(y,10,'measured');%SNR of 10 db
scatterplot(yn);
yr=qamdemod(yn,M);
[num_error,er_rate]=symerr(x,yr)

yn=awgn(y,5,'measured');%SNR of 10 db
scatterplot(yn);
yr=qamdemod(yn,M);
[num_error,er_rate]=symerr(x,yr)