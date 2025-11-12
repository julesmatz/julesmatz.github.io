# Matrix Inversion
Inverse of matrix \( A \) is \( A^{-1} \) such that \( AA^{-1}=A^{-1}A=I \).

### Adjugate Method

Inverse of \( A \) using the adjugate method:

$$ A^{-1} = \frac{1}{\det(A)} \text{adj}(A) $$

\( \text{adj}(A) = C^T \) with \( C \) the cofactor matrix, whose element \(c_{i,j} \) is \((-1)^{i+j}\) times the determinant of \(A\) without the \(i\)-th line and \(j\)-th column.



### Example for \(n=2\)

$$ A = \begin{pmatrix} a & b \\ c & d \end{pmatrix} $$

$$ A^{-1} = \frac{1}{ad - bc} \begin{pmatrix} d & -b \\ -c & a \end{pmatrix} $$

### Example for \(n=3\)

$$ A = \begin{pmatrix} a & b & c \\ d & e & f \\ g & h & i \end{pmatrix} $$

$$ C = \begin{pmatrix} ei-fh & -(di-fg) & dh-eg \\
-(bi-ch) & ai-cg & -(ah-bg) \\
bf-ce & -(af-cd) & ae-bd \end{pmatrix}$$

$$ A^{-1} = \frac{1}{\det(A)} C^T $$
