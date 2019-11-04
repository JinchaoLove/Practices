function w = idft(v)
% inverse DFT using 'fft'

N = length(v);
vv = conj(v);
y = fft(vv);
w = conj(y) / N;
