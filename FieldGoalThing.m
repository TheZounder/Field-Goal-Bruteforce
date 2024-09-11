%% Field Goal Project
% Brute force the problem
%% Create matrices
% create matrix of velocties to index
bfVel = 10:1:35;

% create matrix of angles to index
angle = 20:5:60;

%% Convert values to meters
rDX = 95 * .9144;

%% Determine the success of the field goal
% Empty arrays for value storage in the for loops 
svel = [];
sangle = [];
syvel = [];
sxvel = [];

% Establish a for loop that indexes 'angle' for each of its nine items with
% 'idxa'
for idxa = 1:9
    % Establish another for loop that runs every time 'angle' is indexed,
    % 'idxv' for loop indexes the values of 'bfVel' for each of its 
    % fifty-one items 
    for idxv = 1:26
        % math to calculate time and then height
        time = rDX/(bfVel(idxv)*cosd(angle(idxa)));
        height = (bfVel(idxv)^2*sind(angle(idxa))^2)/(2*9.8);
        % if statement determines if height is less than 3.25 and weeds out
        % the small height values 
        % Calculates x and y velocities because I needed to do it
        % SOMEWHERE
        yvel = (bfVel(idxv)*sind(angle(idxa)));
        xvel = (bfVel(idxv)*cosd(angle(idxa)));
        % Classifies values as unsuccessful
        if height < 3.25
        elseif height > 3.25
            % Calculates the distance the ball falls in the second half of
            % the graph and then calculates dfg (elab on dfg later)
            dely = .5*9.8*(.5*time)^2;
            dfg = height - dely;
            % dfg (distance from ground) is where the ball will be when x=86.868m 
            % Classifies values as successful
            if dfg > 3.25
                % adds the values to arrays of velocity
                % (svel), angle (sangle), etc. and then adds them all to a
                % table named success
                sangle = [sangle angle(idxa)];
                svel = [svel bfVel(idxv)];
                syvel = [syvel yvel];
                sxvel = [sxvel xvel];
                %makes the table to organize the data but i have to put in
                %the variables myself at the top of the page
                success = cat(2, sangle', svel', syvel', sxvel');
                %classifies values as unsuccessful
            else
            end
        else 
        end
    end
end
%% Plotting 
% plots and labels the points
hold on 
plot(sangle, svel, ".r")
plot(sangle, syvel, ".g")
plot(sangle, sxvel, ".b")
hold off
xlabel("Angles (deg)")
ylabel("Velocity (m/s)")
% creates a legend
legend("Velocity", "Y-Velocity", "X-Velocity")

%% Makes a table using the success matrix

data = array2table(success, "VariableNames",["Angles", "Velocity", "Y-Velocity", "X-Velocity"]);
