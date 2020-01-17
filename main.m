% 4 particles to start with, first col is position, second ol is velocity
particle_spawn = transpose(linspace(0, 10, 2));
particle_spawn(:,2) = rand(2, 1);
k = 0.5;
rest_spring = 10;

for i = 0:20
    for j = 1:length(particle_spawn);
        if j == 1
            distance = abs(particle_spawn(j, 1) - particle_spawn(j + 1 , 1));
            if distance < rest_spring
                acceleration(j) = -k * (rest_spring - distance)^2;
            else
                acceleration(j) = k * (rest_spring - distance)^2;
            end
        elseif j == length(particle_spawn)
            distance = abs(particle_spawn(j, 1) - particle_spawn(j - 1, 1));
            if distance < rest_spring
                acceleration(j) = k * (rest_spring - distance)^2;
            else
                acceleration(j) = -k * (rest_spring - distance)^2;
            end
        else
            distance1 = abs(particle_spawn(j, 1) - particle_spawn(j + 1 , 1));
            if distance1 < rest_spring
                acceleration1 = -k * (rest_spring - distance1)^2;
            else
                acceleration1 = k * (rest_spring - distance1)^2;
            end
            distance2 = abs(particle_spawn(j, 1) - particle_spawn(j - 1 , 1));
            if distance2 < rest_spring
                acceleration2 = k * (rest_spring - distance2)^2;
            else
                acceleration2 = -k * (rest_spring - distance2)^2;
            end
            acceleration(j) = acceleration1 + acceleration2;
        end
    end
    particle_spawn(:,1) = particle_spawn(:,1) + particle_spawn(:,2);
    particle_spawn(:,2) = particle_spawn(:,2) + transpose(acceleration);
    %particle_spawn(:,2) = particle_spawn(:,2) + transpose(acceleration);
    particle_spawn
    clf
    hold on
    scatter(particle_spawn(:,1), 0.*particle_spawn(:,1), 'ob', 'filled')
    pause(1)
    drawnow
end
