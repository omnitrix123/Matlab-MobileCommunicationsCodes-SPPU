%code from Taub and Schilling's book
clc;close all;clear all;

M=4;
x=randint(100,1,M);%1000 random quaternary data is generated
y=pskmod(x,M);%modulation
yn=awgn(y,20);%SNR of 10 db
scatterplot(yn);
yr=pskdemod(yn,M);
[num_error,er_rate]=symerr(x,yr)

yn=awgn(y,5);
scatterplot(yn);
scatterplot(y);
yr=pskdemod(yn,M);
[num_error,er_rate]=symerr(x,yr)