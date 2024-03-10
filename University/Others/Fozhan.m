R1 = input('R1 ');
R2 = input('R2 ');
R3 = input('R3 ');
C1 = input('C1 ');
C2 = input('C2 ');
L = input('L ');
W = 800;

Z1 = R1/(i*W*C1)
Z2 = R2*W*L*i
Z3 = R3/(i*W*C2)

z = [1/Z1+1/Z2 -1/Z2; -1/Z2 1/Z2+1/Z3];
i = [5, -10];
v = z/i;

Va = v(1, 1)
Vb = v(2, 1)