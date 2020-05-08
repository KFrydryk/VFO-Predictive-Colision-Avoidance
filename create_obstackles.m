function[out] = create_obstackles(num, min_size_x,...
                                        max_size_x,...
                                        min_size_y,...
                                        max_size_y,...
                                        max_radius)
%Create number of obstackles
o = {};
for index = 1:num
    randx = (max_size_x - min_size_x) * rand() + min_size_x;
    randy = (max_size_y - min_size_y) * rand() + min_size_y;
    rad = max_radius*rand();
    o{index} = [index, randx, randy, rad];
end
out = o;
end
