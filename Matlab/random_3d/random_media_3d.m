function M=random_media_3d(y,z,x,epsilon,a)
[Y,Z,X]=meshgrid(y-mean(y),z-mean(z),x-mean(x));
%% ACF
if ~exist('acf')
    acf='gaussian';
end
r = sqrt(X.^2+Y.^2+Z.^2);
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
Nx=length(x);
Ny=length(y);
Nz=length(z);
k=sqrt(Nx*Ny*Nz);
M=k*real(ifftn(sqrt(P).*exp(1i*phi)));
