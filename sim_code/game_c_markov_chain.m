x = -0.005
M = [0 5/8-x 3/8+x;7/10+x 0 5/8-x; 3/10-x 3/8+x 0]
[v,d] = eig(M)
ss = v(1:end,1)
ss_sum = sum(ss)
p1 = ss(1)/ss_sum
p2 = ss(2)/ss_sum
p3 = ss(3)/ss_sum
p1+p2+p3
