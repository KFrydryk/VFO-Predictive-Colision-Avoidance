global targets targetIter

% targets = [pi/4, 5, 5;...
%     0, 7,7;...
%     pi/4, 10, 10;...
%     0, 50, 20;...
%     pi/8, 90,70;...
%     0, 100, 100]'
startPos = [pi/2, 20, 0]
targets = [pi/2, 20,200]'
targetIter = 1;

obstacle_data = jsondecode(fileread("obstacles.json"));
LEFT_BOUNDARY = obstacle_data.left_boundary;
RIGHT_BOUNDARY = obstacle_data.right_boundary;
LOW_BOUNDARY = obstacle_data.low_boundary
HIGH_BOUNDARY = obstacle_data.high_boundary;
MAX_RADIUS = obstacle_data.max_radius;
NUM_OF_OBSTACLES = obstacle_data.num_of_obstacles;

obstacles = create_obstackles(NUM_OF_OBSTACLES,...
                                LEFT_BOUNDARY,...
                                RIGHT_BOUNDARY,...
                                LOW_BOUNDARY,...
                                HIGH_BOUNDARY,...
                                MAX_RADIUS);
obstacle_struct = {}
for index = 1:NUM_OF_OBSTACLES
    vals = obstacles{index};
    temp = struct('ID', vals(1), 'posX', vals(2), 'posY', vals(3), 'radius', vals(4))
    obstacle_struct = [obstacle_struct; temp]
end
obstacle_data.obstacles = jsondecode(jsonencode(obstacle_struct))

fid = fopen('obstacles.json', 'w');
fprintf(fid, '%s', prettyjson(jsonencode(obstacle_data)));
fclose(fid);