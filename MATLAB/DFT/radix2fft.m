function w = radix2fft(v)
% Decimation-in-time Radix-2-FFT

% v should be a length-N column vector
N = length(v);

if ~isequal(unique(factor(N)),2)
    error('N is not a power of 2!');
end

if N == 2
    % Compute length-2 DFT directly (it's super simple)
    w = [1,1;1,-1] * v;
else
    % Split input vector into even and odd parts
    v_even = v(1:2:end-1);  % note that x(0) is x(1) in matlab
    v_odd = v(2:2:end);
    % Take radix 2 FFT of each part
    w_even = radix2fft(v_even);
    w_odd = radix2fft(v_odd);

    % Recombine length N/2 results into length N result
    w = zeros(N,1);
    wn = exp(-1j * 2 * pi / N);
    for k=1:N/2
        w(k) = w_even(k) + w_odd(k) * wn^(k-1);
        w(k+N/2) = w_even(k) - w_odd(k) * wn^(k-1);
    end

end
