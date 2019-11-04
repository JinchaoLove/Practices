function w = directdft(v)

% v should be a length-N column vector
if size(v,1) == 1
  v = v';
end
N = length(v);

% create N x N DFT matrix
n = 0:N-1;
k = 0:N-1;
WN = exp(-1j * 2 * pi / N);
F = WN.^(n'*k);

% compute w using a matrix-vector product
w = F * v;
