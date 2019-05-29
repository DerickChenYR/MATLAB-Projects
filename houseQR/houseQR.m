function [A,p] = houseQR(A)
%
% function [A,p] = houseQR(A)
%
% perform QR decomposition using Householder reflections
% Transformations are of the form P_k = I - 2u_k(u_k^T), so
% store effecting vector u_k in p(k) + A(k+1:m,k). Assume m > n.
	[m,n]=size(A); p = zeros(1,n);
	for k = 1:n
	% define u of length = m-k+1
	z = A(k:m,k);               % get subcolumn k from row k to m
	e1 = [1; zeros(m-k,1)];     % unit vector of length m-k+1 with 1 in top entry
	u = z+sign(z(1))*norm(z)*e1;  % u = z +-(||z|| * e1), take u in the direction of z - ||z||e when z positive
	u = u/norm(u);

	A(k,k) = -sign(z(1))*norm(z); %store the value of a
	% so z - u = ae,    u is in the direcion of z-ae
	%    z - ( z +-||z||e1) = +-ae
	%   if z is positive, u = z +||a||e1, A(k,k) = -||z||e1
	%   if z is negative, u = z -||a||e1, A(k,k) = +||z||e1

	A(k+1:m,k) = u(2:m-k+1);    % rewrite the rest of the column with elements of u

	% update nonzero part of A by I-2uu^T
	% only multiply to the next column onward
	A(k:m,k+1:n) = A(k:m,k+1:n)-2*u*(u'*A(k:m,k+1:n));
	% store u
	p(k) = u(1);

	end
end