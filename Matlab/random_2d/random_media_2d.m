function M=random_media_2d(y,z,epsilon,a,acf,k)
[Y,Z]=meshgrid(y-mean(y),z-mean(z));
%% ACF
if ~exist('acf')
    acf='gaussian';
end
r = sqrt(Y.^2+Z.^2);
switch acf     
    case 'von karman'
        R = fftshift(((epsilon^2)*(2^(1-k))/gamma(k))*((r/a).^k).*besselk(k,r/a));
        R(isnan(R)) = 0;
    case 'exponential'
        R = fftshift((epsilon^2)*exp(-r/a));
    case 'gaussian'
        R = fftshift((epsilon^2)*exp(-(r.^2)/a^2));
end      
%% PSDF
P=fftn(R);
%% Random phase
A=sqrt(rand(size(P)));
Af=fftn(A);
phi=angle(Af);
%% Random media
Ny=length(y);
Nz=length(z);
k=sqrt(Ny*Nz);
M=k*real(ifftn(sqrt(P).*exp(1i*phi)));