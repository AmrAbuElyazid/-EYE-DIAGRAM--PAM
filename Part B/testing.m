pulse=input('Choose type of encoding: 1 = PNRZ,2 = PRZ,3 = Raised_Cos, 4=Ideal Nyquist Pulse :  ');
level=input('Choose Level: 1 = Binary , 2 = 4-level :  ');
duration=input(' Duration of Eye Diagram (1 = Ts, 2 = 2Ts) :  ');
SnrOrValue=input(' Do you want to enter SNR or N0 (1 = SNR, 2 = N0) :  ');
Value = input(' enter SNR in dB or N0 in watt as you chosed before :  ');
diagram ( pulse, level,duration,SnrOrValue,Value);
%%
%case1
diagram (1,1,1,1,0);
diagram (1,1,2,1,0);
%%
%case2
diagram (3,1,1,1,0);
diagram (3,1,2,1,0);
%%
%case3
diagram (1,1,1,1,10);
diagram (1,1,2,1,10);
%%
%case4
diagram (3,1,1,1,10);
diagram (3,1,2,1,10);

