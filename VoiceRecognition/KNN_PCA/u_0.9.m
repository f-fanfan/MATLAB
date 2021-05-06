%% mu = 0.9
mu = 0.9;
%% 全部
numOfFiles = 128;
fftPoints = 1024;
voice_fft = zeros(fftPoints, numOfFiles);
% 读取并作fft
for i = 1:numOfFiles
    voice_fft(:, i) = fft(audioread(['C:\Users\Vela\OneDrive\桌面\语音信号处理\KNN\数据\训练样本\' num2str(i) '.wav']), fftPoints);
end

%% 人声样本读取处理
num = 16;
% 仿MEl谱方式 提取特征点
human_voice_Mel = MelSpe(voice_fft(:, 1:16), num);
% 人声PCA
human_PCA = PCA(human_voice_Mel, num, mu);

%% 鸟声样本读取处理
num = 15;
% 仿MEl谱方式 提取特征点
bird_voice_Mel = MelSpe(voice_fft(:,17:31), num);
% 鸟声PCA
birds_PCA = PCA(bird_voice_Mel, num, mu);

%% 风声样本读取处理
num = 15;
% 仿MEl谱方式 提取特征点
wind_voice_Mel = MelSpe(voice_fft(:,32:46), num);
% 风声PCA
wind_PCA = PCA(wind_voice_Mel, num, mu);

%% 雨声样本读取处理
num = 24;
% 仿MEl谱方式 提取特征点
rain_voice_Mel = MelSpe(voice_fft(:,47:70), num);
% 雨声PCA
rain_PCA = PCA(rain_voice_Mel, num, mu);

%% 放电声样本读取处理
num = 12;
% 仿MEl谱方式 提取特征点
current_voice_Mel = MelSpe(voice_fft(:, 71:82), num);
% 放电声PCA
current_PCA = PCA(current_voice_Mel, num, mu);

%% 滑动声样本读取处理
num = 28;
% 仿MEl谱方式 提取特征点
roll_voice_Mel = MelSpe(voice_fft(:, 83:110), num);
% 鸟声PCA
roll_PCA = PCA(roll_voice_Mel, num, mu);

%% 正常声样本读取处理
num = 18;
% 仿MEl谱方式 提取特征点
normal_voice_Mel = MelSpe(voice_fft(:, 111:128), num);
% 鸟声PCA
normal_PCA = PCA(normal_voice_Mel, num, mu);

%% 散点图展示
hold on
scatter(human_PCA, zeros(1, length(human_PCA)), 'filled');
scatter(birds_PCA, zeros(1, length(birds_PCA)), '+', 'filled');
scatter(wind_PCA, zeros(1, length(wind_PCA)), 'x', 'filled');
scatter(rain_PCA, zeros(1, length(rain_PCA)), 'v', 'filled');
scatter(current_PCA, zeros(1, length(current_PCA)), 's', 'filled');
scatter(roll_PCA, zeros(1, length(roll_PCA)), 'p', 'filled');
scatter(normal_PCA, zeros(1, length(normal_PCA)), 'h', 'filled');

figure(2)
stem(human_PCA);
figure(3)
stem(birds_PCA);
figure(4)
stem(wind_PCA);
figure(5)
stem(rain_PCA);
figure(6)
stem(current_PCA);
figure(7)
stem(roll_PCA);
figure(8)
stem(normal_PCA);

%% 存储变量
save(['human_PCA_' num2str(mu) '.mat'],'human_PCA');
save(['birds_PCA_' num2str(mu) '.mat'],'birds_PCA');
save(['wind_PCA_' num2str(mu) '.mat'],'wind_PCA');
save(['rain_PCA_' num2str(mu) '.mat'],'rain_PCA');
save(['current_PCA_' num2str(mu) '.mat'],'current_PCA');
save(['roll_PCA_' num2str(mu) '.mat'],'roll_PCA');
save(['normal_PCA_' num2str(mu) '.mat'],'normal_PCA');
