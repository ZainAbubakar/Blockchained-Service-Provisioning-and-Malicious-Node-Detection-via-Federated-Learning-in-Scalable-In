%% This file contains the plots for the...
%% Hybrid Blockchain-based ID Authentication for Multi-WSN
% The values are obtained after performing simulation of blockchain
% envirnoment.

%size of registration and authentication packet size in bytes
Registration_size= [370 273 128; 266 162 105];

c = categorical({'Registration Phase','Authentication Phase'});
%ax1 = subplot(1, 2, 1);
figure(1);
bar(c, Registration_size);
legend({'Cluster Head node','Sensor Node','Base station'}, 'FontSize', 13, 'Location', 'best');
%title('Authentication and Registration Message Size for Different Nodes')
ylabel('Message Size (Bytes)')
%ax2 = subplot(1,2,2);
%bar(ax2, Authentication)

%% Time Consumption
Registration_size= [0.4629 0.4257; 0.0723 0.1003];

c = categorical({'Registration Phase','Authentication Phase'});
%ax1 = subplot(1, 2, 1);
figure(2)
bar(c, Registration_size);
legend({'Sensor Node','Cluster Head Node'}, 'FontSize', 13, 'Location', 'best');
%title('Authentication and Registration Message Size for Different Nodes')
ylabel('Execution Time (sec)')
%ax2 = subplot(1,2,2);
%bar(ax2, Authentication)

%% IPFS Response time

upload_response_time = [3.80 3.89 3.99 4.10 4.21 4.30 4.36];
data_size =     [5 10 15 20 25 30 35];
download_response_time = [2.27 2.48 2.68 2.80 2.93 3.36 3.80];


figure(3)
plot(data_size, upload_response_time, '--' ,data_size, download_response_time, '--', 'LineWidth', 1.5, 'Marker', 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
legend({'Data Upload', 'Data Retrieval'}, 'FontSize', 13, 'Location', 'best');
xlabel('Data Size (MB)');
ylabel('Response Time (sec)');