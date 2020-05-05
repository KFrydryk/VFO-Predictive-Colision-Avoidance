clear all
close all
global obstacles
LEFT_BOUNDARY = 10;
RIGHT_BOUNDARY = 30;
FINISH = 200;
MAX_RADIUS = 5;
num_of_obstackles = 5;

obstacles = create_obstackles(num_of_obstackles,...
                                LEFT_BOUNDARY,...
                                RIGHT_BOUNDARY,...
                                0,...
                                FINISH,...
                                MAX_RADIUS);
                            
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
line([LEFT_BOUNDARY LEFT_BOUNDARY ], [0 FINISH]);
line([RIGHT_BOUNDARY RIGHT_BOUNDARY], [0 FINISH]);
for index = 1:num_of_obstackles
    vals = obstacles{index};
    %viscircles([vals(1), vals(2)], vals(3));
    drawObstacles([vals(1), vals(2), vals(3)]);
end
%plot x,y of robot
plot(x, y, 'r');

