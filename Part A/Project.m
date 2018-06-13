pulse=input('Choose type of encoding: 1 = PNRZ,2 = PRZ,3 = Raised_Cos, 4=Ideal Nyquist Pulse :  ');
level=input('Choose Level: 1 = Binary , 2 = 4-level :  ');
duration=input(' Duration of Eye Diagram (1 = Ts, 2 = 2Ts) :  ');
diagram ( pulse, level,duration);