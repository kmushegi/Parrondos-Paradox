clear
epsilon = 0;
listEp = zeros(1,10)
for iter = 1:10
    epsilon= -.001 + epsilon;
    listEp(iter) = epsilon;
    total_Nth_turn = zeros(1,100);  %vector which will store the average

                               
    for loop=1:10000                %repeat experiment 10000 times
        m = 0; 
        runningtotal = zeros(1,100);            %vector to store M, the amount of money in your pocket at each of 100 coin flips
        for flips = 1:100                       %flip a coin 100 time
            outcome = rand;                 
            if outcome < 0.5 + epsilon     
                m = m +1 ;                 %you win
            else 
                m = m- 1;                  %you lose
            end
            runningtotal(flips) = m;
        end
        total_Nth_turn = total_Nth_turn + runningtotal;   %compare what happened on this turn with all the other experiments
    end 
        total_Nth_turn=total_Nth_turn/10000;  
        plot(total_Nth_turn,'DisplayName',['Epsilon = ' num2str(epsilon)]);
        legend('-DynamicLegend');
        xlabel('# of Flips')
        ylabel('Average Returns')
        title('Values of Epsilon vs Game A')
%         legend(gca,'show')
        hold on;
    %plot what M is on the Nth turn (averaged over 10000 experiments)
end 