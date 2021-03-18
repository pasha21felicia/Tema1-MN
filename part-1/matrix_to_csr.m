function [values, colind, rowptr] = matrix_to_csr(A)
  n = size(A);
  %gasesc mai intaii vectorii values si colind
  nz = 1; m = 1; k = 1;
  for i = 1:n
    for j = 1:n
      if (A(i,j) != 0)
        values(nz++) = A(i,j);
        colind(m++) = j;
      endif
    endfor 
  endfor
  %aici gasesc vectorul rowptr in functie de colind
  rowptr(1) = 1;
  z = 2;
  for i = 2:nz-1
    if (colind(i) < colind(i-1))
      rowptr(z++) = i;
    endif
  endfor
  rowptr(n+1) = nz;
endfunction