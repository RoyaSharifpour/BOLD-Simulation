% Writen by Roya Sharifpour

%this function generates bold signal for 14 voxels.


function [X,y]=RS_BoldSig(NoV,noiseSTD,SCNBeta,NonSCNBeta)
close all
%% HRF
TR = 6.4; % MRI Repeatition Time
h = spm_hrf(TR);

%% LIGHT Blocks

Stim_Interval = 30; %  Stimulus Interval(Darkness periods)
Stim_Duration=20;%  Stimulus Duration
NumberofStim = 9; % Number of Stimuli
Stim_Seq = (Stim_Interval+Stim_Duration)*NumberofStim ;
 
% Light Onsets
LightBlocks = zeros(1,Stim_Seq);
Start=10; % Start of Light Stimulus
for i= 1:NumberofStim
    LightBlocks(Start:Start+Stim_Duration) = 1;
    Start=Start+Stim_Interval+Stim_Duration;
end
D = LightBlocks';
%figure
plot(LightBlocks); 

%% Design Matrix

X = conv2(D,h); 
 

%% Betas
SCN_Beta = 0.8*SCNBeta+0.02*NonSCNBeta ;
NonSCN_Beta = (0.02*SCNBeta+0.95*NonSCNBeta*ones(1,NoV)) ;
beta = [SCN_Beta NonSCN_Beta];
 
 
%% Bold Signal without Noise
y0 = X*beta;
 
%% Bold Signal with Noise
% noiseSTD = max(abs(y0(:)))./SNR; 
noise = randn(size(y0))*noiseSTD ;
y = y0 + noise;


%%
subplot(211);
plot(y);
xlabel('Time (s)'); ylabel('BOLD Signal');
legend({'SCN Voxel' ,'Non-Responsive1', 'Non-Responsive2','Non-Responsive3','Non-Responsive4', 'Non-Responsive5', 'Non-Responsive6', 'Non-Responsive7', 'Non-Responsive8' });
title(' Voxel Responses');

subplot(212);
plot(mean(y,2));
xlabel('Time (s)'); ylabel('MEAN BOLD Signal');
title('Mean VOI  Response');

end
 


