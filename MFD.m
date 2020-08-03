clc
close all
clear all
samples = 0:1/8191:1;
fs = 4000;
L = 8192;
ts = 1/fs;
fm = 16;
f0 = 512;
l = 32;
m = 256;
zn = 2.*cos(2*pi*fm.*samples) .*cos(2*pi*f0.*samples);
snr_dB = -22;% SNR in decibels
snr = 10.^(snr_dB./10); % Linear Value of SNR

x=1;%Uncertainty in noise variance(I chose it randomly)
beta = 10^(x/10);

%% Simulation to plot Probability of Detection (Pd) vs. Probability of False Alarm (Pf)
for j=1:L
    noise = sqrt(1/snr)*randn(1,L) +1i*sqrt(1/snr)*randn(1,L);  
    signal = sqrt(1/snr)*randn(1,L)+ 1i*sqrt(1/snr)*randn(1,L) + zn;
    taumfd_h0(j) = sum(noise.*zn);    
    taumfd_h1(j) = sum(signal.*zn);
end

thresh = linspace((1/beta),beta,1000);
pf = zeros(length(gamma),1);
pd = zeros(length(gamma),1);
for i = 1:length(thresh)
    PF = find(taumfd_h0>=thresh(i));
    PD = find(taumfd_h1>=thresh(i));
    
end


%% Theoritical plot




