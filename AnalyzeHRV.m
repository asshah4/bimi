%% AnalyzeHRV.m
% Pseudocode
	% Identify each file in folder
	% Extract ECG from each patient
	% Convert to HRV
	
%% Set up workspace

% Clear workspace
clear; clc; close all;

% Add necessary files to path
% Need to be in highest biobank folder
addpath(genpath(pwd));

% Folder holding data
data_folder =  [pwd filesep 'data'];

% Identify all patients in folder
files = dir(fullfile(data_folder, '*.txt'));
patients = regexprep({files.name}, '.txt', '');
numsub = length(patients);

%% Iterative loop through all patients

parfor i = 1:numsub
	
	% Extrat raw ECG signal
	ecg = ExtractECG(files(i).name);
	name = patients{i};
	
	% Initialize HRV parameters
	HRVparams = InitializeHRVparams(name);
	HRVparams.readdata = [data_folder filesep name];
	HRVparams.writedata = [data_folder filesep name];
	HRVparams.MSE.on = 0; % No MSE analysis for this demo
	HRVparams.DFA.on = 0; % No DFA analysis for this demo
	HRVparams.HRT.on = 0; % No HRT analysis for this demo
	HRVparams.output.separate = 1; % Write out results per patient

	% Graphing parameters (optional)
	Fs = HRVparams.Fs;
	tm = 0:1/Fs:(length(ecg)-1)/Fs;
%	r_peaks = jqrs(ecg, HRVparams);
%	plot(tm, ecg, r_peaks./Fs, ecg(r_peaks), 'o');

	% Run the HRV analysis
	[results, resFilenameHRV] = ...
	  Main_HRV_Analysis(ecg, [], 'ECGWaveform', HRVparams, name);

end
