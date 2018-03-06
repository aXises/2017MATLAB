A = [3 -1 -1; 5 -4 -2; -1 -1 3];
disp('The matrix A is:')
disp(A)
if det(A) == 0
    disp('Determinant is 0, A has no inverse')
else
    disp('The inverse of A is:')
    disp(inv(A))
end
