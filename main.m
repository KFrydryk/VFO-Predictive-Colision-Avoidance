global obstackles
LEFT_BOUNDARY = 10;
RIGHT_BOUNDARY = 30;
FINISH = 200;
MAX_RADIUS = 5;
num_of_obstackles = 5;

obstackles = create_obstackles(num_of_obstackles,...
                                LEFT_BOUNDARY,...
                                RIGHT_BOUNDARY,...
                                0,...
                                FINISH,...
                                MAX_RADIUS);
%Simulation something something
mdl = 'make_simulation';
load_system(mdl);
simOut = sim(mdl, 'SaveOutput', 'on',...
    'OutputSaveName', 'yOut',...
    'SaveTime', 'on',...
    'TimeSaveName', 'tOut');

t = simOut.get('tOut');
pos = simOut.get('yOut');
x = pos{1}.Values.Data;
y = pos{2}.Values.Data;
axis([0 40 0 200]);
hold on;
%Draw boundaries
line([LEFT_BOUNDARY LEFT_BOUNDARY ], [0 FINISH]);
line([RIGHT_BOUNDARY RIGHT_BOUNDARY], [0 FINISH]);
for index = 1:num_of_obstackles
    vals = obstackles{index};
    viscircles([vals(1), vals(2)], vals(3));
    
end
%plot x,y of robot
plot(x, y, 'r');


