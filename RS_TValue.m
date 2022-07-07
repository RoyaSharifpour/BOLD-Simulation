% writen by Roya Sharifpour

% T-test for linear regression to have a measure for output (average) BOLD signal 

function [t_val]=RS_TValue(x,y)


xf = [ones(length(x),1) x];
%  beta_all = xf\y; % Beta estimated from noisy signal
% 

beta_av = xf\mean(y,2); %Average of betas
% 
essq = sum((mean(y,2)-xf*beta_av).^2); 
t_val = beta_av(2)/sqrt(essq/length(x)); 

end
