function cost = compute_cost_pc(points, centroids)
	[rows dim] = size(points);
  nr_centroids = size(centroids, 1);
  cost = 0; 
  i = 1;
  %calc. distanta de la un punct catre fiecare centroid si o gasesc pe ce minima
  %assignez fiecarui punct centroidul corespunzator
  %adaug la cost distanta gasita
  while (i <= rows) 
    min_dist = norm(points(i,1:dim) - centroids(1,1:dim));
    j = 2;
    while(j <= nr_centroids)
      x = norm(points(i,1:dim) - centroids(j,1:dim)) ;
      if(min_dist > x)
        min_dist = x;
      endif
      j++;
    endwhile
    cost = cost + min_dist; 
    i++;
  endwhile
end
