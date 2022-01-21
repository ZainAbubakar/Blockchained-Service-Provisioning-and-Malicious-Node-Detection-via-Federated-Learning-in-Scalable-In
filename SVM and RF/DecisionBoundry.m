function DecisionBoundry( X,Y,Yn )
figure
hold on
imagesc([min(X(:,1)) max(X(:,1))], [min(X(:,2)) max(X(:,2))], Yn);
scatter(X(Y==1,1),X(Y==1,2),'*b')
scatter(X(Y==-1,1),X(Y==-1,2),'vr')
axis([min(X(:,1)) max(X(:,1)) min(X(:,2)) max(X(:,2))])
xlabel('{x_1}')
ylabel('{x_2}')
legend('Legitimate Nodes','Malicious Nodes')
hold off
end

