%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DISK PACKING PROBLEM (Visualization script)
%
% Authors: Giacomo Marciani <gmarciani@acm.org> 
%          Michele Porretta <mporretta@acm.org> 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ISTRUCTIONS:
%
% 1) Change path of file!!!
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Read radius and centers of circles from file
path = '/out-145_res.txt';
f = fopen(path);

start = 0;
radius = 0.01;
figure;

while feof(f) == 0
    line = fgetl(f);
    
       % parse radius
    if startsWith(line,'Objective (radius):')
       toks = regexp(line,'^Objective \(radius\): (?<radius>\d+(?:\.\d+){0,1})$','tokens');
       radius = str2double(toks{1}{1});
       disp(radius);
       equivalent_model = 0;    
       
       % start parsing centers
    elseif strcmp(line,'Solution:') == 1
       start = 1;
    
       % parse centers
    elseif start == 1
       toks = regexp(line,'^\[\d+\] \((?<x>\d+(?:\.\d+){0,1}),(?<y>\d+(?:\.\d+){0,1})\)$','tokens');
       xCenter = str2double(toks{1}{1});
       yCenter = str2double(toks{1}{2});
       disp(xCenter);
       disp(yCenter);
        
       % make circle
       theta = 0:pi/50:2*pi;
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
       
end

fclose(f);
