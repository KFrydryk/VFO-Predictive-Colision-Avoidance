clear all
close all
global obstacles
obstacle_data = jsondecode(fileread("obstacles.json"));

LEFT_BOUNDARY = obstacle_data.left_boundary;
RIGHT_BOUNDARY = obstacle_data.right_boundary;
LOW_BOUNDARY = obstacle_data.low_boundary
HIGH_BOUNDARY = obstacle_data.high_boundary;
MAX_RADIUS = obstacle_data.max_radius;
NUM_OF_OBSTACLES = obstacle_data.num_of_obstacles;
obstacles = cell2mat(struct2cell(obstacle_data.obstacles))';
% obstacles = create_obstackles(NUM_OF_OBSTACLES,...
%                                 LEFT_BOUNDARY,...
%                                 RIGHT_BOUNDARY,...
%                                 0,...
%                                 HIGH_BOUNDARY,...
%                                 MAX_RADIUS);
                            
%obstacles = {[20.5009032952522 65.1667257526498 2.73224719951534] [17.9776150476640 83.0186773226093 0.903688801273972] [15.1077348097610 4.10715493163691 4.61837806310204] [23.0739977801651 186.522714409713 0.817561842637628] [28.4219451178440 158.931577077751 2.88697098353324]}
                            
mdl = 'untitled1';
load_system(mdl);
simOut = sim(mdl, 'SaveOutput', 'on',...
    'OutputSaveName', 'yOut',...
    'SaveTime', 'on',...
    'TimeSaveName', 'tOut');

t = simOut.get('tOut');
pos = simOut.get('yOut');
x = simOut.q.data(:,2);
y = simOut.q.data(:,3);
axis([0 40 0 200]);
hold on;

%Draw boundaries
line([LEFT_BOUNDARY LEFT_BOUNDARY ], [0 HIGH_BOUNDARY]);
line([RIGHT_BOUNDARY RIGHT_BOUNDARY], [0 HIGH_BOUNDARY]);
for index = 1:NUM_OF_OBSTACLES
    vals = obstacles{index};
    %viscircles([vals(1), vals(2)], vals(3));
    drawObstacles([vals(2), vals(3), vals(4)]);
end
%plot x,y of robot
plot(x, y, 'r');

