function C = svmParams(X, y, Xval, yval, c_range, libsvm_options)
%SVMPARAM Find the best performing cost parameter from a set of values.
%
% C = svmParam(X, y, Xval, yval, c_range)
%   Parameters:
%       X, y        :   Training examples and labels.
%       Xval, yval  :   Cross validation examples and labels.
%       c_range     :   A vector of possible parameter values.
%       libsvm_options :   A string of options for svmtrain.
%
%   Returns:
%       C           :   A value from c_range that minimizes prediction error
%                       on the validation set.
%

% Use default range if none given
if ~exist('c_range', 'var') || ~isvector(c_range)
    c_range = [0.01, 0.03, 0.06, 0.1, 0.3, 0.6, 1.0, 3.0, 6.0, 10.0, 30.0, 60.0];
end

% make sure libvsm_options is a string
if ~exist('libsvm_options', 'var') || isempty(libsvm_options)
    libsvm_options = '';
end

% Try all the values and measure resulting accuracy
C = 0;
best = -1;
for c = c_range
    opts = cstrcat( libsvm_options, sprintf('-c %f', c) );
    model = svmtrain(y, X, opts);
    [~, accuracy, ~] = svmpredict(yval, Xval, model); 
    if accuracy > best
      best = accuracy;
      C = c;  
    end
end

end

