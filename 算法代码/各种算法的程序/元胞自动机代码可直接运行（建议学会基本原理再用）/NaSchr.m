% Nagel Schreckenberg model simulation
%Written by Alexander Farley
%Feb 6 2012
%alexander.farley at utoronto.ca
%This script implements the Nagel Schreckenberg cellular automata based
%traffic model. Flow vs density curves are displayed.
%
%
%Update June 5 2012: Fixed problem in vehicle velocity updates
%Update Jan 13 2013: Fixed problem with vmax=1 showing no flow
%Update June 12 2013: Corrected calculation of flow rate for FD plot
%


%Parameters
vmax = 10;
p = 0.6;%原始数据0.8
road_length = 1000;
simulation_steps = 1000;
render_on = 0;
pause_on = 0;
delay_on = 0;
delay_length = 0.02; %10 FPS

road = zeros(1,road_length);       %Contains occupation state
road_next = road;
velocities = zeros(1,road_length); %Contains velocity state
velocities_next = velocities;

%Sampling
num_samples = 2000;
samples = zeros(2,num_samples); %Contains density and flow rate
density_step = 1/num_samples;

history = zeros(simulation_steps, road_length);
velocity_history = zeros(simulation_steps, road_length);

figure

for g=1:num_samples;
    
    %Generate traffic
    road = zeros(1,road_length);       %Contains occupation state
    road_next = road;
    density = g/num_samples;
    
    %Generate traffic
    
    for i=1:road_length
        if rand < density
            road(i) = 1;
        end
    end
    
    if render_on
        imshow(road);
        drawnow
    end
    
    %Run simulation
    for i=1:simulation_steps
        history(i, :) = road;
        velocity_history(i,:) = velocities;
        %--------------------Velocity update ------------------------%
        for j=1:road_length
            if road(j) == 1
                distance = 0;
                %Seek vmax ahead
                bf = 0;
                for k=1:vmax
                    distance = k;
                    
                    if j+k <= road_length %The index is the "cell under consideration" - is it safe to land here?
                        index = j+k;
                    else
                        index = j+k-road_length; %Deal with wrapping
                    end
                    
                    if road(index) == 1
                        bf = 1;
                    end
                    
                    if bf == 1, break, end
                end
                
                if velocities(j) < vmax %Acceleration
                    velocities(j) = velocities(j) + 1;
                end
                
                if (velocities(j) > distance - 1) && bf == 1 %Collision avoidance
                    velocities(j) = distance - 1;
                end
                
                if rand < p && velocities(j) > 0 %Random braking
                    velocities(j) = velocities(j) - 1;
                end
                
                
            end
        end
        
        %--------------------Movement -------------------------------%
        for j=1:road_length
            if road(j) ==1
                if j+velocities(j) <= road_length
                    index = j+velocities(j);
                else
                    index = j+velocities(j) - road_length; %Deal with wrapping
                end
                %Collision detection
                if road_next(index) == 1
                    disp('Collision detected')
                end
                road_next(index) = 1;
                velocities_next(index) = velocities(j);
            end
        end
        
        velocities = velocities_next;
        
        road = road_next;
        road_next = zeros(1,road_length);
        
        if render_on
            imshow(road);
            drawnow
        end
        
        if pause_on
            pause
        end
        
        if delay_on
            pause(delay_length)
        end
        
    end
    
    %Record density and flow rate
    velocity_history = velocity_history.*history;
    samples(:,g) = [mean2(history) (sum(velocity_history(:))/sum(history(:)))*mean2(history)];
    
    disp('Sample step:')
    g
end

scatter(samples(1,:), samples(2,:));
axis([0 1 0 1]);
xlabel('Density')
ylabel('Flow (normalized)')
title('Flow-density Curve')

%imshow(history)
% ts(simulation_steps,history)

