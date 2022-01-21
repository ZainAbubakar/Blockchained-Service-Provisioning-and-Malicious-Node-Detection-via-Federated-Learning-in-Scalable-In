X = [25902,25671
     22368,21983
     21568,21270
     21736,21447
     22532,22331
     21640,21428
     24763,24161];
figure (1)
h=bar(X);
h(1).FaceColor = 'r';
h(2).FaceColor = 'b';
xticklabels({'1','2','3','4','5','6','7'});
% xticklabels({'Request','Publish','Signatured Data','Confirmation 1','Sending Key','Confirmation 2','Feature Evaluation'})
legend({'PoW','PoA'}, 'fontsize', 16);
xlabel('Service Provisioning Steps')
ylabel('Gas Consumption (Gwei)')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
% xtickangle(45);

X = [22929,22606
     22368,21983
     23568,22270
     22736,21447
     22532,22331
     22640,22428
     21763,21161
     22332,21931
     21640,21428
     21763,21161];
figure (10)
h=bar(X);
h(1).FaceColor = 'r';
h(2).FaceColor = 'b';
xticklabels({'Region-1','Region-2','Region-3','Region-4','Region-5','Region-6','Region-7','Region-8','Region-9','Region-10'});
% xticklabels({'Request','Publish','Signatured Data','Confirmation 1','Sending Key','Confirmation 2','Feature Evaluation'})
legend({'PoW','PoA'}, 'fontsize', 16);
% xlabel('Service Provisioning Steps')
ylabel('Average Gas Consumption (Gwei)')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
xtickangle(45);






keccack1 = [0 25.7 48.9 74 98.9 148.9];
data_size =[0 5 10 15 20 25];
sha1 = [0 28.8 50.6 81.7 102.2 151.3];


figure(2)
plot(data_size, keccack1, '--' ,data_size, sha1, '--', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
legend({'Keccak256','SHA256'}, 'FontSize', 13, 'Location', 'best');
xlabel('No. of Transactions');
ylabel('Transaction Latency (sec)');
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)


keccack1 = [0 257.6 515.2 802.8 1070.4 1468.9];
data_size = [0 50 100 150 200 250];
sha1 = [0 274.1 548.2 852.7 1132.2 1651.3];


figure(20)
plot(data_size, keccack1, '--' ,data_size, sha1, '--', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
legend({'Keccak256','SHA256'}, 'FontSize', 13, 'Location', 'best');
xlabel('No. of Transactions');
ylabel('Transaction Latency (sec)');
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)



keccack = [0 11.03 23.54 40.96 47.47 64.77 80.35 83.99 100.90 114.36 131.07];
data_size = [0 10 20 30 40 50 60 70 80 90 100];
sha = [0 16.7 33.23 51.94 63.08 79.34 96.99 107.85 121.31 140.31 148.89];
figure(3)
plot(data_size, keccack, '--' ,data_size, sha, '--', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
legend({'Arbitration Transactions','Non-Repudiation Transactions'}, 'FontSize', 13, 'Location', 'best');
xlabel('No. of Transactions');
xticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
ylabel('Transaction Latency (sec)');
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16);



keccack = [0 131.07 248.54 396.96 517.47 664.77 780.35 910.99 1080.90 1264.36 1410.07];
data_size = [0 100 200 300 400 500 600 700 800 900 1000];
sha = [0 148.89 297.23 451.94 603.08 739.34 896.99 1057.85 1211.31 1420.31 1548.89];
figure(30)
plot(data_size, keccack, '--' ,data_size, sha, '--', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
legend({'Arbitration Transactions','Non-Repudiation Transactions'}, 'FontSize', 13, 'Location', 'best');
xlabel('No. of Transactions');
xticklabels({'0','100','200','300','400','500','600','700','800','900','1000'});
ylabel('Transaction Latency (sec)');
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)



X = [0.79,0.95
     0.87,0.96
     1,0.92
     0.78,1];
figure (4)
h=bar(X);
h(1).FaceColor = 'g';
h(2).FaceColor = 'b';
xticklabels({'Accuracy','F1 Score','Precision','Recall'});
% xticklabels({'Request','Publish','Signatured Data','Confirmation 1','Sending Key','Confirmation 2','Feature Evaluation'})
legend({'SVM','RF'}, 'fontsize', 16);
xlabel('')
ylabel('Values')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
% xtickangle(45);



X = [0.76,0.963
     0.84,0.97
     0.9,0.87
     0.79,1];
figure (40)
h=bar(X);
h(1).FaceColor = 'g';
h(2).FaceColor = 'b';
xticklabels({'Accuracy','F1 Score','Precision','Recall'});
% xticklabels({'Request','Publish','Signatured Data','Confirmation 1','Sending Key','Confirmation 2','Feature Evaluation'})
legend({'SVM','RF'}, 'fontsize', 16);
xlabel('')
ylabel('Average Values')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
% xtickangle(45);
