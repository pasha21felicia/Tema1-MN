function [A b] = generate_probabilities_system(rows)
  nr = 0;
  for i = 1:rows
    for j = 1:i
      nr++;
      Aux(i, j) = nr;
    endfor
     Aux(i, j+1:rows) = 0;
  endfor


 A = zeros(rows); 
 A(1, 1) = 4;    %am observat ca primul rand este fix pentru orice numar de randuri 
 A(1, 2:3) = -1;
 A(1, 4:rows) = 0;
 
 for i = 2:rows
    for j = 1:i;
      p = Aux(i,j);
      if(j == 1 && i != rows)      %orice rand stanga inafara de ultimul
          k2 = Aux(i-1, j);
          k4 = Aux(i, j+1);
          k5 = Aux(i+1, j);
          k6 = Aux(i+1, j+1);
          A(p, k2) = -1;
          A(p, k4) = -1;
          A(p, k5) = -1;
          A(p, k6) = -1;
          A(p,p) = 5;
      elseif (j == i && i != rows)           %orice rand dreapta inafara de ultimul
           k1 = Aux(i-1, j-1);
           k3 = Aux(i, j-1);
           k5 = Aux(i+1, j);
           k6 = Aux(i+1, j+1);
           A(p, k1) = -1;
           A(p, k3) = -1;
           A(p, k5) = -1;
           A(p, k6) = -1;
           A(p,p) = 5;
      elseif (i == rows && j == 1) %ultimul rand stanga
            k2 = Aux(i-1, j);
            k4 = Aux(i, j+1);
            A(p, k2) = -1;
            A(p, k4) = -1;
            A(p,p) = 4;
            b(p) = 1;
      elseif (i == rows && j == rows)   %ultimul rand dreapta
            k1 = Aux(i-1, j-1);
            k3 = Aux(i, j-1);
            A(p, k1) = -1;
            A(p, k3) = -1;
            A(p,p) = 4;
            b(p) = 1;
      elseif (i == rows && j != 1 && j != rows) %ultimul rand mijloc
            k1 = Aux(i-1, j-1);
            k2 = Aux(i-1, j);
            k3 = Aux(i, j-1);
            k4 = Aux(i, j+1);
            A(p, k1) = -1;
            A(p, k2) = -1;
            A(p, k3) = -1;
            A(p, k4) = -1;
            A(p,p) = 5;
            b(p) = 1;
      else                  %in mijloc
            k1 = Aux(i-1, j-1);
            k2 = Aux(i-1, j);
            k3 = Aux(i, j-1);
            k4 = Aux(i, j+1);
            k5 = Aux(i+1, j);
            k6 = Aux(i+1, j+1);
            A(p, k1) = -1;
            A(p, k2) = -1;
            A(p, k3) = -1;
            A(p, k4) = -1;
            A(p, k5) = -1;
            A(p, k6) = -1;
            A(p,p) = 6;
            
      endif
    endfor
  endfor
  b = b';
endfunction