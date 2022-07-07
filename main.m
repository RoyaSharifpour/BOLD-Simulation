% loop over different beta values for SCN and non-SCN voxels

pp= -5:5;
pn= 5:-1:-5;
SCN=[-(2.^pn),2.^pp];
nonSCN=[-(2.^pn(4:end)),2.^pp((1:end-3))];
NoVoxel=13;
NoiseL=1;

tN = zeros(length(nonSCN),length(SCN));
t = zeros(length(nonSCN),length(SCN));

for iSCN = 1:numel(SCN)
    for inSCN = 1:numel(nonSCN)
        [x,y] = RS_BoldSig(NoVoxel,NoiseL,SCN(iSCN),nonSCN(inSCN));
        T = RS_TValue(x,y);
        t(inSCN,iSCN)= T;
        if T<0
            tN(inSCN,iSCN)= T;
        end
    end
end

% 

close all
figure
imagesc(t);
xlabel('SCNBeta'); ylabel('Non-SCNBeta');
colormap((jet))
%caxis([-10 0])

set(gca,'XTick',(1:1:22))
xlabelOld = get(gca, 'XTick');
xlabelNew = SCN;
set(gca, 'XTick',xlabelOld, 'XTickLabel',xlabelNew)

set(gca,'YTick',(1:1:16))
ylabelOld = get(gca, 'YTick');
ylabelNew = nonSCN;
set(gca, 'YTick',ylabelOld, 'YTickLabel',ylabelNew)


figure
imagesc(tN);

xlabel('SCNBeta'); ylabel('Non-SCNBeta');
colormap((jet))
%caxis([-10 0])

set(gca,'XTick',(1:1:22))
xlabelOld = get(gca, 'XTick');
xlabelNew = [-32 -16 -8	-4 -2 -1 -0.50	-0.25 -0.12 -0.06 -0.03 0.03 0.06 0.12 0.25 0.50	1	2	4	8	16	32];%SCN;%num2str(SCN,'%.2f');
set(gca, 'XTick',xlabelOld, 'XTickLabel',xlabelNew)
xtickangle(90)


set(gca,'YTick',(1:1:16))
ylabelOld = get(gca, 'YTick');
ylabelNew = [-4 -2 -1 -0.50	-0.25 -0.12 -0.06 -0.03 0.03 0.06 0.12 0.25 0.50	1	2	4];nonSCN;
set(gca, 'YTick',ylabelOld, 'YTickLabel',ylabelNew)
set(gca,'fontsize',20)










