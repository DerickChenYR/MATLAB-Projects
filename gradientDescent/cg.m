%Implementation for Conjugate Gradient Descent
function[xk, r_v] = cg(A,b)

    tol = 1e-8;
    max_iteration = 1000;   %arbituary max to prevent infinite loop
    ite = 1;
    xk = zeros(size(b));
    rk = b - A*xk;
    pk = rk;
    delta = rk'*rk;
    r_norm = sqrt(delta);


    %loop to perform gradient descent
    while delta > tol.^2*(b'*b) && ite < max_iteration
        sk = A*pk;
        
        ak = delta/(pk'*sk);
        if ak < 0
            disp(ite)
            error("ak less than zero!")
            return
        end
        
        x_new = xk + ak*pk;
        r_new = rk - ak*sk;
        delta_new = r_new'*r_new;
        pk = r_new+ (delta_new/delta)*pk;
        
        r_norm = sqrt(delta_new);

        r_v (1,ite) = r_norm;   %vector to store residual norms
        xk = x_new;
        rk = r_new;
        delta = delta_new;
       
        ite = ite + 1;
        
    end


end