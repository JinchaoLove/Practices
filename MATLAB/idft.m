function w = idft(v)
N = length(v);
vv = conj(v);
y = fft(vv);
w = conj(y) / N;

