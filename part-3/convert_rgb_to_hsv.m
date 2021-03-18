function [H S V] = convert_rgb_to_hsv(path_to_image, count_bins)
HSV=imread(path_to_image);						

H = zeros(1,size(path_to_image));
S = zeros(1,size(path_to_image));
V = zeros(1,size(path_to_image));

dim = size(HSV);

for i=1:dim(1,1)
  for j=1:dim(1,2)
      R = HSV(:,:,1);					
      G = HSV(:,:,2);  					
      B = HSV(:,:,3);					

      r = double(R)/255;
      g = double(G)/255;
      b = double(B)/255;
	
      M(i,j) = max([r(i,j),g(i,j),b(i,j)]);		
 
      m(i,j) = min([r(i,j),g(i,j),b(i,j)]);		
      x(i,j) = M(i,j) - m(i,j);				

      
	if (x(i,j) == 0)
		 H(i,j) = 0;
	else     
       		 if (M(i,j) == r(i,j))
          		 H(i,j) = 60 * mod(((g(i,j)-b(i,j))/x(i,j)),6);
          	 end
      		 if (M(i,j) == g(i,j))
           		 H(i,j) = 60 * (((b(i,j)-r(i,j))/x(i,j)) + 2);
          	 end
       		 if (M(i,j)==b(i,j))
          		 H(i,j) = 60 * (((r(i,j)-g(i,j))/x(i,j)) +4);
      		 end
	end

	H(i,j) =double(H(i,j))/360;

	if (M(i,j) == 0)
            S(i,j) = 0
	else
            S(i,j) = x(i,j)/M(i,j);
      	end
	
	V(i,j) = M(i,j);
   endfor
endfor
sol = [H, S, V];

endfunction
