function [X_norm, mu, sigma] = featureNormalize(X)
  %FEATURENORMALIZE Normalizes the features in X
  %   FEATURENORMALIZE(X) returns a normalized version of X where
  %   the mean value of each feature is 0 and the standard deviation
  %   is 1. This is often a good preprocessing step to do when
  %   working with learning algorithms.
  % You need to set these values correctly
  X_norm = X;
  mu = zeros(1, size(X, 2));
  sigma = zeros(1, size(X, 2));

  % ====================== YOUR CODE HERE ======================
  % Instructions: First, for each feature dimension, compute the mean
  %               of the feature and subtract it from the dataset,
  %               storing the mean value in mu. Next, compute the
  %               standard deviation of each feature and divide
  %               each feature by it's standard deviation, storing
  %               the standard deviation in sigma.
  %
  %               Note that X is a matrix where each column is a
  %               feature and each row is an example. You need
  %               to perform the normalization separately for
  %               each feature.
  %
  % Hint: You might find the 'mean' and 'std' functions useful.

  num_datasets = length(X(1,:));
  examples = length(X(:,1));

  % Go through each column/dataset
  for col_iter = 1:num_datasets

    % Set respective vector, mean, Standard Deviation for each dataset
    dataset = X_norm(:,col_iter);
    m = mean(dataset);
    sd = std(dataset);

    % Update each example
    for ex_iter = 1:examples
      X_norm(ex_iter, col_iter) = (dataset(ex_iter) - m)/sd;
    end

    % Store values
    mu(col_iter) = m;
    sigma(col_iter) = sd;
  end

  % ============================================================
end
