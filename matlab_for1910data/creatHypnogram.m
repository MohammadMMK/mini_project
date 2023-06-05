% Read data from file
data = readtable('hypnogram.txt', 'ReadVariableNames', false);
oldvalues = {'SLEEP-S0', 'SLEEP-REM', 'SLEEP-S1', 'SLEEP-S2', 'SLEEP-S3', 'SLEEP-MT'};
newvalues = {'5', '4', '3', '2', '1', '0'};
data.Var1 = replace(data.Var1, oldvalues, newvalues);
hypno = data.Var1;
stage_data = repelem(hypno, 30);
fs = 0.0333;  % Sampling rate in Hz
t = (0:length(hypno)-1)/fs;
stage_data_num = str2double(stage_data);
stairs(stage_data_num, 'LineWidth', 2);
% Set the y-axis limits to show the different sleep stages
ylim([-0.5, 6.5]);
xlim([1250,5700])
% Label the y-axis with the different sleep stages
yticks([0, 1, 2, 3, 4, 5]);
yticklabels({'NA', 'N3', 'N2', 'N1', 'rem', 'wake'});
ylabel('Sleep stage');
% Label the x-axis with the time
xlabel('Time (minutes)');
