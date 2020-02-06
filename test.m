n = 2^10%input('Give n = ');
d = 1/n;

cmd = sprintf("./test %d", n);

A = sprandsym(n,d);

in = fopen('data.in', 'w');
fwrite(in, A, 'double');
fclose(in);

system(cmd);

out = fopen('data.out', 'rb');
r = fread(in, 'int');
fclose(out);

r = r' + 1;

p = symrcm(A);

subplot(2,2,1), spy(A), title('Original A');
subplot(2,2,2), spy(A(r,r)), title('My RCM implemention');
subplot(2,2,3), spy(A(p,p)), title('Matlabs RCM implementation');
subplot(2,2,4), plot(graph(A));
