function F = dtft(f, T, N, w)
%{
Input:
    f, continuous-time function to be sampled
    T, sampling period
    N, number of samples
    w, vector of frequencies
Output:
    F, vector corresponding to the DTFT sampled at the points in w
%} 

F = zeros(1, length(w));
for i = 1:length(w)
    for n = -N:N
        F(i) = F(i) + f(n * T) * exp(-1j * w(i) * n);
        % note: '(-N:N) * T' corresponds to time vector
    end
end
%{
% Plot the normalized DTFT magnitude
Fnorm = abs(F) * T;
figure
plot(w, Fnorm);

% Scale the y axis to go from 0 to the max value
set(gca, 'ylim', [0 max(Fnorm(:))])
%}
