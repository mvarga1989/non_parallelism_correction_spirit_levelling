function C0=non_parallelism_correction_spirit_levelling(lat_1,H_1,lat_2, H_2)
% non_parallelism_correction_spirit_levelling  Calculates the non parallelism correction to spirit levelling.
%   Vectorized.
% Version: 29 Apr 21
% Usage:   rad=dms2rad(dms)
% Input:   lat_1 - latitude of the first (beginning point) in [radians]
%            H_1 - orthometric height of the first (beginning) point in [m]
%          lat_2 - latitude of the second (ending point) in [radians]
%            H_2 - orthometric height of the second (end) point in [m]
% Output:  C0 - correction for non-parallelism of equipotential surfaces in [m]
% Reference: Albarici, F. L., Foroughi, I., Guimarães, G. D. N., Santos, M., & Trabanco, J. (2019). 
%                      A new perspective for physical heights in brazil. Boletim de Ciências Geodésicas, 25(1).
% Example: C0=non_parallelism_correction_spirit_levelling([41.1, 130.5] *pi/180,[100,990],[41.2,130.51]*pi/180, [105,1100])
%
%
% Copyright (c) 2021, Matej Varga
% All rights reserved.
% Email: mvarga1989@gmail.com

C_1= 0.0053023655;
C_2= -0.0000059;
lat_m=(lat_1+lat_2)/2;
delta_lat=lat_2-lat_1;
H_m = (H_1+H_2)/2;

a1=H_m.*(C_1*sin(2*lat_m)+2.*C_2.*sin(4.*lat_m).*delta_lat);
a2=1+C_1.*sin(lat_m).^2+C_2.*sin(2.*lat_m).^2;
C0=-a1./a2;

end
