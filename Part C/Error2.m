length1=4
alpha=1;
value=20
f=0;
number_of_bits=200
N=64

%% Random input

data_upsampled = upsample( data_randombits, N);

prcos=rcosdesign(alpha, length1, N,'normal');
yrcos=conv(data_upsampled, prcos);
yrcos=yrcos(2*length1*N:end-2*length1*N+1);

data_randombits = sign(randn(1,number_of_bits));
pulse_shape = yrcos;
pulse_shape = pulse_shape/sqrt(N);


%% PAM signal

Tx = conv(pulse_shape, data_upsampled);
Tx= Tx(1: N*number_of_bits);


%% Matching filter
matching_filter = fliplr(pulse_shape);
    


for SNR = 0:24
    
    %% Adding AWGN to PAM signal
    pam_AWGN = awgn(Tx,SNR,'measured');    
    output = conv(matching_filter, pam_AWGN);

    output= output(1:length(Tx));
    output_downsampled = downsample(output,N,N-1);
    f=f+1;
    BER(f) = 0;
    
    for i= 1:number_of_bits
        output_downsampled(i)=round(output_downsampled(i));
        if output_downsampled(i) ~= data_randombits(i)
            BER(f)= BER(f)+1;
        end
        
    end 
    BER(f)= (BER(f)/number_of_bits);
    
end

SNR2 = (1:25)';
BER=BER';

figure
semilogy(SNR2,BER)
title('2 -PAM')
xlabel('SNR (dB)') % x-axis label
ylabel('BER') % y-axis label
savefig('Error.fig')
