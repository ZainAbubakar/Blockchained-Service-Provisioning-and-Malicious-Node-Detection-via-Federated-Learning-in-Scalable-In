close all;
clc;
clear;

dead = 0;
live = 0;
acknowledged_packets = 0;
forwarded_packets = 0;
dropped_packet = 0;
tn = 95;


%Creation of the sink node
    S(5).xd= 50;
    S(5).yd= 100;
    S(5).type='Sn';
%     S(5).Total_Trust_Value = rand(1,1);
    S(5).id = 1;
    S(5).E= 20;
    figure (1);
    plot(S(5).xd,S(5).yd,'-bs');
    hold on;


%Creation of the beacon node
S(1).xd=10;
S(1).yd=50;
S(2).xd=30;
S(2).yd=50;
S(3).xd=70;
S(3).yd=50;
S(4).xd=90;
S(4).yd=50;

for i=1:1:4
    S(i).type='Bn';
    S(i).id = 2;
%     S(2).Total_Trust_Value = rand(1,1);
    S(i).E= 5;
    figure (1);
    plot(S(i).xd,S(i).yd,'+');
    hold on;
    figure (1);
    plot([S(i).xd S(5).xd], [S(i).yd S(5).yd]);
end


%Creation of the unknown node
for i=6:1:100
    S(i).xd=randi([0, 100]);
    S(i).yd=randi([0, 80]);
    S(i).type='Un';
    S(i).id = i;
    S(i).E= 2;
    figure (1);
    plot(S(i).xd,S(i).yd,'o');
    hold on;
    for j=1:1:4
        D(i,j)=sqrt((S(i).xd-(S(j).xd))^2 + (S(i).yd-(S(j).yd))^2); 
    end
    [k_Distance,k_BeaconNode]= min(D(i,:));
    S(i).SmallerDistance = k_BeaconNode;
%     S(i).nei = nei+1;
    figure (1);
    plot([S(i).xd S(k_BeaconNode).xd], [S(i).yd S(k_BeaconNode).yd]);
    
    
end



 %Heartbeat Message
for i=6:1:100
    forwarded_packets = forwarded_packets + 1;
     a = rand(1,1);
    if a <0.07
        S(i).state = 'dead';
        dead = dead + 1;
        dropped_packet = dropped_packet + 1;
        plot(S(i).xd,S(i).yd,'*r');
    else
        S(i).state = 'live';
        live = live + 1;
        acknowledged_packets =  acknowledged_packets + 1;
    end
end

j = 1;
for i=6:1:100
    if S(i).state == 'live'
        L(j) = S(i);
        j = j + 1;
    end
end



% Closeness
% for i=1:1:4
%     S(i).clo1 = onehop/tn;
% end


for i=1:1:30
    M(i).xd=randi([1, 100]);
    M(i).yd=randi([1, 100]);
    M(i).type='M';
    M(i).id = i;
    M(i).E= 5;
    figure (2);
    plot(M(i).xd, M(i).yd,'-bs');
    hold on;
    
    forwarded_packets = forwarded_packets + 1;
     a = rand(1,1);
    if a <0.75
        M(i).state = 'dead';
        dead = dead + 1;
        dropped_packet = dropped_packet + 1;
        plot(M(i).xd,M(i).yd,'*r');
    else
        M(i).state = 'live';
        live = live + 1;
        acknowledged_packets =  acknowledged_packets + 1;
    end

end



%% Detection Accuracy %%
identified5 = 0;
for i=1:1:5
if (M(i).state == 'dead')
    identified5 = identified5 +1;

end
end
DE5 = (identified5/5);

identified10 = 0;
for i=1:1:10
if (M(i).state == 'dead')
    identified10 = identified10 +1;

end
end
DE10 = (identified10/10);

identified15 = 0;
for i=1:1:15
if (M(i).state == 'dead')
    identified15 = identified15 +1;

end
end
DE15 = (identified15/15);

identified20 = 0;
for i=1:1:20
if (M(i).state == 'dead')
    identified20 = identified20 +1;

end
end
DE20 = (identified20/20);

identified25 = 0;
for i=1:1:25
if (M(i).state == 'dead')
    identified25 = identified25 +1;

end
end
DE25 = (identified25/25);

identified30 = 0;
for i=1:1:30
if (M(i).state == 'dead')
    identified30 = identified30 +1;

end
end
DE30 = (identified30/30);



x1=[DE5 DE10 DE15 DE20 DE25 DE30];
figure (3);
plot(x1, '-r*','LineWidth',2.00);
hold on
xticks([1 2 3 4 5 6]);
xticklabels({'5','10','15','20','25','30'});
% legend({'Base Paper'}, 'fontsize', 16);
ylabel('Detection Accuracy');
xlabel('Ratio of Malicious Nodes');
h = get(gca,'xticklabels'); 
set(gca,'xticklabels',h,'fontsize',14)
% xtickangle(45);


%% FNR %%
dt5 = 5-identified5;

fnr5 = dt5/5;

dt10 = 10-identified10;

fnr10 = dt10/10;

dt15 = 15-identified15;

fnr15 = dt15/15;

dt20 = 20-identified20;

fnr20 = dt20/20;

dt25 = 25-identified25;

fnr25 = dt25/25;

dt30 = 30-identified30;

fnr30 = dt30/30;




x1=[fnr5 fnr10 fnr15 fnr20 fnr25 fnr30];
figure (4);
plot(x1, '-r*','LineWidth',2.00);
hold on

xticks([1 2 3 4 5 6]);
xticklabels({'5','10','15','20','25','30'});
% legend({'Base Paper'}, 'fontsize', 16);
ylabel('False Negative Rate');
xlabel('Ratio of Malicious Nodes');
h = get(gca,'xticklabels'); 
set(gca,'xticklabels',h,'fontsize',14)
% xtickangle(45);



%% FPR %%

fpr5 = identified5/5;
fpr10 = identified10/10;
fpr15 = identified15/15;
fpr20 = identified20/20;
fpr25 = identified25/25;
fpr30 = identified30/30;


x1=[fpr5 fpr10 fpr15 fpr20 fpr25 fpr30];
figure (5);
plot(x1, '-r*','LineWidth',2.00);
hold on

xticks([1 2 3 4 5 6]);
xticklabels({'5','10','15','20','25','30'});
% legend({'Base Paper'}, 'fontsize', 16);
ylabel('False Positive Rate');
xlabel('Ratio of Malicious Nodes');
h = get(gca,'xticklabels'); 
set(gca,'xticklabels',h,'fontsize',14)
% xtickangle(45);


totalpackets = 100;
for i = 6:100
    unscucc = 0;
    scucc = 0;
    for j = 1:totalpackets
        a = rand(1,1);
        if a <0.4
           unscucc =  unscucc + 1;
           S(i).unsuccessful = unscucc;
        else
            scucc =  scucc + 1;
            S(i).successful = scucc;
            S(i).pdr = S(i).successful / totalpackets;
        end
    end
end






Delay_PPa2=0;
payload=512*8;
header=81*8;
datarate=250;
v=1500; 

for i = 51:100
    for j=1:1:4
        D(i,j)=sqrt((S(i).xd-(S(j).xd))^2 + (S(i).yd-(S(j).yd))^2); 
    end
    Delay_PPa2=0;
    [k_Distance,k_BeaconNode]= min(D(i,:));
    S(i).SmallerDistancefrom = k_BeaconNode;
    S(i).SmallerDistancefrom11 = k_Distance;
    Delay_PPa2 = Delay_PPa2 + (2*(payload + header) / datarate);
    Delay_PPa2 = Delay_PPa2 + k_Distance/ v;
    Delay_PPa2 = Delay_PPa2 + 0.3;
    if k_Distance>0
     Delay_PPa2 = Delay_PPa2/k_Distance;
     S(i).Delay  = Delay_PPa2;
    else
     Delay_PPa2 = Delay_PPa2/1;
     S(i).Delay  = Delay_PPa2;
    end

 
end 
for i = 51:100
    if (S(i).pdr < 0.55 && S(i).Delay > 1 )
        S(i).pdrlabel = -1;
    else
        S(i).pdrlabel = 1;
    end
end



X = [S(51).Delay S(52).Delay S(53).Delay S(54).Delay S(55).Delay S(56).Delay S(57).Delay S(58).Delay S(59).Delay S(60).Delay S(61).Delay S(62).Delay S(63).Delay S(64).Delay S(65).Delay S(66).Delay S(67).Delay S(68).Delay S(69).Delay S(70).Delay S(71).Delay S(72).Delay S(73).Delay S(74).Delay S(75).Delay S(76).Delay S(77).Delay S(78).Delay S(79).Delay S(80).Delay S(81).Delay S(82).Delay S(83).Delay S(84).Delay S(85).Delay S(86).Delay S(87).Delay S(88).Delay S(89).Delay S(90).Delay S(91).Delay S(92).Delay S(93).Delay S(94).Delay S(95).Delay S(96).Delay S(97).Delay S(98).Delay S(99).Delay S(100).Delay];
figure (6)
h=bar(X);
h(1).FaceColor = 'b';
xticklabels({'0','5','10','15','20','25','30','35','40','45','50'});
xlabel('Sensor Nodes')
ylabel('End-to-End Delay (sec)')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
% xtickangle(45);

X = [S(51).Delay S(52).Delay S(53).Delay S(54).Delay S(55).Delay S(56).Delay S(57).Delay S(58).Delay S(59).Delay S(60).Delay];
figure (70)
h=bar(X);
h(1).FaceColor = 'g';
xticklabels({'Region-1','Region-2','Region-3','Region-4','Region-5','Region-6','Region-7','Region-8','Region-9','Region-10'});
xlabel('Sensor Nodes')
ylabel('Average Delay (sec)')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
xtickangle(45);




XX = [S(51).pdr S(52).pdr S(53).pdr S(54).pdr S(55).pdr S(56).pdr S(57).pdr S(58).pdr S(59).pdr S(60).pdr S(61).pdr S(62).pdr S(63).pdr S(64).pdr S(65).pdr S(66).pdr S(67).pdr S(68).pdr S(69).pdr S(70).pdr S(71).pdr S(72).pdr S(73).pdr S(74).pdr S(75).pdr S(76).pdr S(77).pdr S(78).pdr S(79).pdr S(80).pdr S(81).pdr S(82).pdr S(83).pdr S(84).pdr S(85).pdr S(86).pdr S(87).pdr S(88).pdr S(89).pdr S(90).pdr S(91).pdr S(92).pdr S(93).pdr S(94).pdr S(95).pdr S(96).pdr S(97).pdr S(98).pdr S(99).pdr S(100).pdr];
figure (7)
h=bar(XX);
h(1).FaceColor = 'm';
xticklabels({'0','5','10','15','20','25','30','35','40','45','50'});
xlabel('Sensor Nodes')
ylabel('Honesty')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
% xtickangle(45);


XX = [S(51).pdr S(52).pdr S(53).pdr S(54).pdr S(55).pdr S(56).pdr S(57).pdr S(58).pdr S(59).pdr S(60).pdr];
figure (60)
h=bar(XX);
h(1).FaceColor = 'r';
xticklabels({'Region-1','Region-2','Region-3','Region-4','Region-5','Region-6','Region-7','Region-8','Region-9','Region-10'});
xlabel('Sensor Nodes')
ylabel('Average Honesty')
h = get(gca,'XTickLabel'); 
set(gca,'XTickLabel',h,'fontsize',16)
xtickangle(45);