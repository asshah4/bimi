function [ecg] = ExtractECG(filename)
% Function/script to extract ECG from messy BIMI files

%% Read in data

% Open file
file = fopen(filename);
text = textscan(file, '%d %f', 'HeaderLines', 3);
fclose(file);

% Separte out data
index = text{1};
ecg = text{2};

% Save space
clear text file;

end