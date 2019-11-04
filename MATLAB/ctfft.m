function w = ctfft(v)

% v should be a length-N column vector
N = length(v);

if isprime(N)           % the length is prime
    w = directdft(v);   % From Problem 4.1, copy this code in below
else
    % factor the length into two integers N1 and N2
	N1 = min(factor(N));
	N2 = N / N1;
	% do several calls to ctfft using N1 and N2 as the factors
	vv = reshape(v,[N2,N1])';
	tmp = zeros(N1,N2);
	for i=1:N2
        tmp(:,i) = ctfft(vv(:,i));
    end
	n1 = 0:N1-1;
    n2 = 0:N2-1;
    WN = exp(-1j * 2 * pi / N * n1' .* n2);
    w1 = WN .* tmp;
    
    ww = zeros(N1,N2);
    for i=1:N1
%         ww(i,:) = ctfft(w1(i,:)')';
        ww(i,:) = directdft(w1(i,:)');
    end
    
    w = zeros(N,1);
    w(1) = ww(1);
    for i=1:N2
        if i==1
            w(end-N1+2:end) = flip(ww(2:end,i));
        else
            w(2+(i-2)*N1:1+(i-1)*N1) = flip(ww(:,i));
        end
    end

end





