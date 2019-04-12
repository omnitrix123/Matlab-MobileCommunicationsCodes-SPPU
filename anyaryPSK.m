clc;close all;clear all;

M=4;%no of symobols you want to generate
inputbits=randint(1000,1,M);%1000 random quaternary data is generated
modulatedBits=pskmod(inputbits,M);%modulation

symbolErrorRate=[];
for snr=0:1:20
 noiseCorruptedBits=awgn(modulatedBits,snr);%SNR in db
 receivedbits=pskdemod(noiseCorruptedBits,M);
 [num_error,er_rate]=symerr(inputbits,receivedbits)
 symbolErrorRate=[symbolErrorRate er_rate];
end

snr=0:1:20;
semilogy(snr,symbolErrorRate,'k*','linewidth',2);
hold on;
plot(snr,symbolErrorRate)
grid on;
xlabel('SNR in DB ====>');
ylabel('symbol error rate =====>');

