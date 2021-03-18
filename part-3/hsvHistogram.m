function [sol] = hsvHistogram(path_to_image, count_bins)
  
  [H S V] = convert_rgb_to_hsv(path_to_image, count_bins);				
  %creez 3 vectori auxiliari
  R1 = zeros(1,count_bins);				
  G1 = zeros(1,count_bins);
  B1 = zeros(1,count_bins);
  
  for i = 1: count_bins

    X = (double(H) >= double((i-1)*1.01)/double(count_bins) & double(H) < double((i-1)+1)*1.01/double(count_bins));
    R1(i)=sum(sum(X));
    
    Q = (double(S) >= double((i-1)*1.01)/double(count_bins) & double(S) < double((i-1)+1)*1.01/double(count_bins));
    G1(i)=sum(sum(Q));
    
    Z = (V >= double((i-1)*1.01)/count_bins & double(V) < double(((i-1)+1)*1.01)/count_bins);
    B1(i)=sum(sum(Z));

  endfor

  sol = [R1, G1, B1];
end