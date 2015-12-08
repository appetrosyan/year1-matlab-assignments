function chisq = slsine (a, t,y) 
chi = y - (a(1) + a(2) * (t-1961) + a(3) * sin (2*pi*t + a(4)));
chisq = sum (chi.^2)
