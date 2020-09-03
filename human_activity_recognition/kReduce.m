function [Z, K] = kReduce(X, epsilon)
%KREDUCE Reduce X to minimum K such that the variance ratio remains less then
% threshold.

[m, n] = size(X);

r = 0;
K = 1;
[U, S] = pca(X);
s = diag(S);
while r < epsilon && K < n
    r = sum( s(1:K) ) / sum( s(1:n) );
    K = K + 1;
end

Z = projectData(X, U, K);

end
