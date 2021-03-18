function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [n m]= size(c);
  x0 = zeros(n, 1);
  iter = 0;
  maxiter = 1000;
  prev_x = x0;
  
  while 1
     x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
     err = norm(x - prev_x);
     if (( ++iter == maxiter) || (err < tol))
       return;
     endif
     prev_x = x;
  endwhile
  
endfunction