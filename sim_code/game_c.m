epsilon=-.005;
Mtotal = zeros(1,100);
for loop=1:10000 %iterations
    m = 0;
    samplefunction = zeros(1,100); 
    for flips = 1:100 %flips
        whichgame = rand; %randomly decide which game to play
        if whichgame < 0.5 %play Game A
            outcome = rand;
            if outcome < 0.5 + epsilon
                m = m+1;
            else
                m = m-1;
            end
        else               %play Game B
            if rem(m,3) == 0
                outcome = rand;
                if outcome < 0.1 + epsilon
                    m = m+1;
                else
                    m = m-1;
                end
            else
                outcome = rand;
                if outcome < 0.75 + epsilon
                    m = m+1;
                else
                    m = m-1;
                end
            end
        end
        samplefunction(flips) = m;
    end
    Mtotal = Mtotal + samplefunction;
end
Mtotal = Mtotal/10000;
plot(Mtotal)
