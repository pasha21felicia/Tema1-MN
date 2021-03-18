function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  M = 3 * count_bins;
  if (histogram  = 'HSV')
    X(i) = hsvHistogram(path_to_image, count_bins);
  endif
  
endfunction
