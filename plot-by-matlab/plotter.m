%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CIRCLEPACK - DISK PACKING PROBLEM
%
% INSTRUCTIONS:
% 1) Format input file as 'example.txt';
% 2) Set path of file
% 3) Set limit value with the cardinality of rows in file
% 4) Change the radius value with the best radius obtained with ampl exec
%
% Authors: Giacomo Marciani <gmarciani@acm.org> 
%          Michele Porretta <mporretta@acm.org> 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read centers of circles from file
path = '/example.txt';
f = fopen(path);
g = textscan(f,'%s','delimiter','\n');
fclose(f);

% Plot producer
limit = 10;
figure
for i = 1:limit
    % read row and split: -> x y
    row = strsplit(g{1}{i});
    xCenter = str2double(row{1});
    yCenter = str2double(row{2});    
    
    % make circle
    theta = 0:pi/50:2*pi;
    radius = 0.01;
    x = radius * cos(theta) + xCenter;
    y = radius * sin(theta) + yCenter;
    
    % plot
    hold on;
    plot(x, y);
    axis square;
    xlim([0 1]);
    ylim([0 1]);
    grid on;
    axis equal;
    hold off;
end