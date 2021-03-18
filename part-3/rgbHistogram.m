function [sol] = rgbHistogram(path_to_image, count_bins)
  %Creez matricea RGB- Matricea imaginii citite.
  RGB = imread(path_to_image);					
  %Creez 3 vectori auxiliari R1,G1,B1 
  R1 = zeros(1,count_bins);
  G1 = zeros(1,count_bins);
  B1 = zeros(1,count_bins);

	for i = 1: count_bins
    %extrag matricea r pentru red
		r = RGB(:,:,1); 			
		X = (r >= (i-1)*256/count_bins & r < ((i-1)+1)*256/count_bins);
		R1(i) = sum(sum(X));
    
    %extrag matricea g pentru green
		g = RGB(:,:,2);						
		Y = (g >= (i-1)*256/count_bins & g < ((i-1)+1)*256/count_bins);
		G1(i) = sum(sum(Y));
    
    %extrag matricea b pentru blue
		b = RGB(:,:,3);					
    Z = (b >= (i-1)*256/count_bins & b < ((i-1)+1)*256/count_bins);
    B1(i) = sum(sum(Z));
    
	endfor
	sol = [R1,G1,B1];
end