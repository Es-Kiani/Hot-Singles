close all; clear all; clc

x = -10:0.1:10;
y = sinc(x);
% y = heaviside(x);


plot(x, y)


figure
fourier_transform = fft(y);
stem(x, abs(fourier_transform))

figure
shifted_fourier_transform = fftshift(fourier_transform);
stem(x, abs(shifted_fourier_transform))

figure
stem(linspace(-1, 1, length(shifted_fourier_transform)), abs(shifted_fourier_transform))
xlabel('\times \pi')



