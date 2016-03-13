
function []=example_test
d1='./cover/';

b= strcat(d1,'*.pgm');
files=dir(b);

d2='./stego/';

% set payload
payload = 0.4;

% set params
params.p = -1;  % holder norm parameter
% 2n + 1 is eventually the size of second order derivative
params.n=4 ; 

mkdir(d2);
d2=strcat(d2,'/');

MEXstart = tic;

kl = load('polynomialkernels.mat');
kl = kl.k;    
 
%figure;

%% Run embedding simulation
for i = 1:1 %length(files)
    na=num2str(i);
    c1=strcat(d1,na,'.pgm');
    cover=imread(c1);
    %[stego, distortion,rho] = poly_n(cover, payload,params,kl);
    [stego, distortion,rho] = local_extrema_n(cover, payload,params);
   
   figure;
   imshow(cover ~= stego); 
   
   s1=strcat(d2,na,'.pgm');
   imwrite(uint8(stego),s1);
   

end
