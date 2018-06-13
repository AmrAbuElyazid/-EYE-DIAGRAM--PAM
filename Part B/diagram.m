function diagram ( pulse, level,duration,SnrOrN0,value)
if level == 1
    %% Binary
    data = sign(randn(1,400));
    Tau = 64;
    dataup = upsample(data,Tau);
    if pulse == 1
        %%PNRZ
        pout = ones(1,Tau);
        ynrz = conv(dataup,pout);
        ynrz = ynrz(1:end-Tau+1);
        
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(ynrz)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
            
        rx = awgn(ynrz,SNR,'measured');
        
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
            title('2-PAM NRZ eyediagram with Ts') 
        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('2-PAM NRZ eyediagram with 2Ts') 
        end
        
    elseif pulse ==2
        %% PRZ
        pout = [zeros(1,Tau/4) ones(1,Tau/2) zeros(1,Tau/4)];
        yrz = conv(dataup,pout);
        yrz= yrz(1:end-Tau+1);
         
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yrz)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yrz,SNR,'measured');
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
                        title('2-PAM RZ eyediagram, with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('2-PAM RZ eyediagram , with 2Ts') 
        end
    elseif pulse==3
        %Raisedcoine pulse
        length=input('Enter the number of symbols spanned by the raised cosine');
        alpha=input('Enter the value of the rolloff factor(must be between 0 and 1)');
        prcos=rcosdesign(alpha, length, Tau,'normal');
        yrcos=conv(dataup, prcos);
        yrcos=yrcos(2*length*Tau:end-2*length*Tau+1);
        
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yrcos)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yrcos,SNR,'measured');
        
        if duration == 1
            eye= eyediagram(rx,Tau,Tau);
                        title('2-PAM Rcos eyediagram, with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau,Tau/2);
            title('2-PAM Rcos eyediagram , with 2Ts') 
        end
        
        
    elseif pulse==4
        %% Ideal Nyquist Pulse
        pout=sinc(2*pi*[-Tau/2:Tau/2-1]/Tau);
        yideal=conv(dataup,pout);
        yideal=yideal(1:end-Tau+1);
        
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yideal)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yideal,SNR,'measured');
        
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
                        title('2-PAM Ideal Nyquist Pulse eyediagram, with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('2-PAM Ideal Nyquist Pulse eyediagram , with 2Ts') 
        end
    end
elseif level ==2
    %% 4-PAM
    data = sign(randn(1,400))+ 2*sign(randn(1,400));
    Tau = 32;
    dataup = upsample(data,Tau);    
    if pulse == 1
        pout = ones(1,Tau);
        ynrz = conv(dataup,pout);
        ynrz = ynrz(1:end-Tau+1);
        
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(ynrz)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
            
        rx = awgn(ynrz,SNR,'measured');
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
            title('4-PAM NRZ eyediagram , with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('4-PAM NRZ eyediagram, with Ts') 
        end
    elseif pulse ==2
        %% PRZ
        pout = [zeros(1,Tau/4) ones(1,Tau/2) zeros(1,Tau/4)];
        yrz = conv(dataup,pout);
        yrz= yrz(1:end-Tau+1);
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yrz)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yrz,SNR,'measured');
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
                        title('4-PAM RZ eyediagram, with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('4-PAM RZ eyediagram, with 2Ts') 
        end
    elseif pulse==3
        %%raisedCos
        %Raisedcoine pulse
        length=input('Enter the number of symbols spanned by the raised cosine');
        alpha=input('Enter the value of the rolloff factor(must be between 0 and 1)');
        prcos=rcosdesign(alpha, length, Tau,'normal');
        yrcos=conv(dataup, prcos);
        yrcos=yrcos(2*length*Tau:end-2*length*Tau+1);
        
        if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yrcos)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yrcos,SNR,'measured');
        
        if duration == 1
            eye= eyediagram(rx,2*Tau,Tau);
                        title('2-PAM Rcos eyediagram, with Ts') 
        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau,Tau/2);
            title('2-PAM Rcos eyediagram , with 2Ts') 
        end
    elseif pulse==4
        %% Ideal Nyquist Pulse
        pout=sinc(2*pi*[-Tau/2:Tau/2-1]/Tau);
        yideal=conv(dataup,pout);
        yideal=yideal(1:end-Tau+1);
        
         if SnrOrN0 == 2 %user enterd N0 
            sigpower=10^(bandpower(yideal)/10);
            SNR=pow2db(sigpower/value)
        elseif SnrOrN0==1 %user entered SNR
            SNR = value;
        end
        rx = awgn(yideal,SNR,'measured');

        
        if duration == 1
            eye= eyediagram(rx,Tau,Tau,Tau/2);
                        title('2-PAM Ideal Nyquist Pulse eyediagram, with Ts') 

        elseif duration ==2
            eye = eyediagram(rx,2*Tau,2*Tau);
            title('2-PAM Ideal Nyquist Pulse eyediagram , with 2Ts') 
        end
        
        
    end
end