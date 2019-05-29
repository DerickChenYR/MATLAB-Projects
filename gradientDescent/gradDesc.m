function[xk, r_v] = gradDesc(A,b)

	tol = 1e-16;
	max_iteration = 100;   %arbituary max to prevent infinite loop
	ite = 1;
	xk = zeros(size(b));
	rk = b - A*xk;
	r_norm = norm(rk);


	%loop to perform gradient descent
	while r_norm > tol && ite < max_iteration
	    sk = A*rk;
	    
	    ak = (rk'*rk)/(rk'*sk);
	    if ak < 0
	        error("ak less than zero!")
	        return
	    end
	    
	    x_new = xk + ak*rk;
	    r_new = rk - ak*sk;
	    
	    r_norm = norm(rk);

	    r_v (1,ite) = r_norm;   %vector to store residual norms
	    xk = x_new;
	    rk = r_new;
	   
	    ite = ite + 1;
	    
	end

end