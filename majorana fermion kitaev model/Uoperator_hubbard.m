function [ e ]=Uoperator_hubbard(H1, H2, H3, H4, J, deltaT , Psi)
H_free  = kron( H2.H , H3.I ) + kron( H2.I , H3.H) + J *( kron( H2.Cdag , H3.C ) +  kron( H2.C , H3.Cdag ) );
[a,b]=eig(H_free);
c=zeros(size(H_free));
for i_func=1:size(H_free)   
c(i_func,i_func)=exp((-i)*deltaT*b(i_func,i_func));
end 
d = a*c*a.';
e = mykron(kron(eye(H1.basis_size), d), eye(H4.basis_size), Psi);
end
function [e] = mykron(a,b,p) 
d = reshape(p,length(b),length(a));
e = b*d*(a.');
e = e(:);
%e2 = e.';
%e3 = e2(:);
end


