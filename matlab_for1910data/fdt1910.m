% I used EEGlab to filter data and drop non-eeg channels 
data=load('1910.set', '-mat');
eeg=data.data;
%whole night
F7_O1_data_filter = eeg(1,:);       %channel 1
F8_O2_data_filter = eeg(2, :);    % Channel 2
Fp1_F8_data_filter = eeg(3, :);   % Channel 3
F8_F7_data_filter = eeg(4, :);    % Channel 4
Fp1_O1_data_filter = eeg(5, :);   % Channel 5
Fp1_O2_data_filter = eeg(6, :);   % Channel 6
Fp1_F7_data_filter = eeg(7,:);      %channel 7
% quality_index_F7_O1,60.543529971455754
% quality_index_F8_O2,86.12036156041864
% quality_index_Fp1_F8,94.790675547098
% quality_index_F8_F7,94.89771646051379
% quality_index_Fp1_O1,60.16888677450047
% quality_index_Fp1_O2,85.01427212178876
% quality_index_Fp1_F7,96.14058039961941
%part of night 
F8_F7_data_filter_first = eeg(4, 312500:975000);    % Channel 4 1250s to 3900s IMPORTAN NOTE: the second value is not time in seconds, 
% it is the samples, as sample rate is 250, if want o check the first ten seconds we should write: eeg(4,1:2500) not eeeg(4,1:10) 
%% whole night setting 
Fs=250; %Sampling Frequency
frequency_range=[0 25]; %Limit frequencies from 0 to 25 Hz
taper_params=[15 29]; %Time bandwidth and number of tapers
window_params=[30 5]; %Window size is 30s with step size of 5s
min_nfft=0; %No minimum nfft
detrend_opt='constant'; %detrend each window by subtracting the average
weighting='unity'; %weight each taper at 1
plot_on=true; %plot spectrogram
verbose=true; %print extra info
%Compute the multitaper spectrogram
%[spect,stimes,sfreqs] = multitaper_spectrogram(F8_F7_data_filter,Fs,frequency_range, taper_params, window_params, min_nfft, detrend_opt, weighting, plot_on, verbose);
[spect,stimes,sfreqs] = multitaper_spectrogram(F7_O1_data_filter,Fs,frequency_range, taper_params, window_params, min_nfft, detrend_opt, weighting, plot_on, verbose);

%% ultradian setting
Fs=250; %Sampling Frequency
frequency_range=[0 25]; %Limit frequencies from 0 to 25 Hz
taper_params=[3 5]; %Time bandwidth and number of tapers
window_params=[6 0.25]; %Window size is 4s with step size of 1s
min_nfft=0; %No minimum nfft
detrend_opt='constant'; %detrend each window by subtracting the average
weighting='unity'; %weight each taper at 1
plot_on=true; %plot spectrogram
verbose=true; %print extra info
%Compute the multitaper spectrogram
[spect,stimes,sfreqs] = multitaper_spectrogram(F8_F7_data_filter_first,Fs,frequency_range, taper_params, window_params, min_nfft, detrend_opt, weighting, plot_on, verbose);
%Or use multitaper_spectrogram_mex
