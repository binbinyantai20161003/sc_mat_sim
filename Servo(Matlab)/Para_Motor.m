%% Parameters of Motor %%%%%%%%%%%
%% 
Wmax_motor=1800*2*pi/60;%[rad/s] Maximum velocity of motor
Jm=0.0532; p=4;%Inertia of motor, Number of polar pairs
KEp=305*sqrt(2)/sqrt(3)/(1500*2*pi/60);%[V.s/rad]
Ia_rtd=35; Iq_rtd=sqrt(2)*Ia_rtd/K_2T3;%[A]Rated current/phase or dq
%Te_rtd=105; KT=Te_rtd/Ia_rtd; KE=KT; KEp=KE*sqrt(2/3);
Ra=0.145; %[ohm]Resistance of motor coil
Ld=2.7e-3; Lq=Ld;%5.67e-3; %[H] Indutance of motor 
La1=(Ld+Lq)/3;
Ofpm=KEp/p; Ofq=Ofpm*3/2*K_3T2;%[Wb]Flux of magnet/pase or dq
KE=p*Ofq; KT=KE;
Te_rtd=Iq_rtd*KT; %[N.m]Rated torque
Qm0=0; %[rad] Initinal position of motor
Dm=0; %Viscosity Friction Coefficient of Motor2.4e-6*60/2/pi*0.2