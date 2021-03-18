function [centroids]  = clustering_pc(points, NC)
  %partea de initializare
  [rows dim] = size(points);
  nr = rows/NC;
  suma = zeros(1,dim);
  media = zeros(1:dim);
  k = 1;
  centroids = zeros(NC, dim);
  for i = 1:NC
      suma = zeros(1,dim);
      media = zeros(1:dim);
    for j = k:NC:rows
      cluster(i, 1:dim) = points(j, 1:dim);
      suma = suma + cluster(i, 1:dim);
    endfor
    media = suma/nr;
    centroids(i, :) = media; 
    k++;
  endfor
  
  maxiter = 20; 
  iter = 1;
  while(iter <= maxiter)
    % caluleaza distanta euclidiana a punctelor din fiecare cluster centroid
    % si se assigneaza cel cu distanta minima
    indices = zeros(rows,1);
    i = 1;
    while (i <= rows)
      center = 1;
      min_dist = sum((points(i,:) - centroids(1,:)) .^2);
      j = 2;
      while (j <= NC)
        dist = sum((points(i,:) - centroids(j,:)) .^2);
        if(dist < min_dist)
          min_dist = dist;
          center = j;
        endif
        j++;
      endwhile
      indices(i) = center;
     i = i+1;
    endwhile
    % se recalculeaza centroizii din clustere pana cand nu isi mai schimba pozitia
    i = 1;
    while(i <= NC)
      xi = points(indices==i,:);
      ck = size(xi,1);
      centroids(i, :) = (1/ck)*sum(xi);
      
      if (dim == 3)
        centroids(i, :) = (1/ck)*[sum(xi(:,1)) sum(xi(:,2)) sum(xi(:,3))];
      elseif (dim == 4)
        centroids(i, :) = (1/ck)*[sum(xi(:,1)) sum(xi(:,2)) sum(xi(:,3)) sum(xi(:,4))];
      endif
    i++;
    endwhile
    iter++;
  endwhile 
endfunction
