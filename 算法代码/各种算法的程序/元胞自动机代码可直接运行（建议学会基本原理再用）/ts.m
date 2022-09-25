function ts(simulation_steps,history)
figTS=figure;
axes1 = axes('Parent',figTS,'FontSize',12,'FontName','Arial');
for i=1:1:simulation_steps
    [~,col]=find(history(i,:)==1);
    plot(i*ones(1,length(col)),col,'k.');
    hold on
end
xlabel('Time','FontSize',12,'FontName','Arial')
ylabel('Space','FontSize',12,'FontName','Arial')