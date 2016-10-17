%% Parameters of Motor %%%%%%%%%%%
%% 
Wmax_motor=1800*2*pi/60;                                                   %[rad/s] Maximum velocity of motor
Jm=0.0532;                                                                 %[kg.m^2]Inertia of motor 
p=4;                                                                       %Number of polar pairs
KEp=305*sqrt(2)/sqrt(3)/(1500*2*pi/60);                                    %[V.s/rad]
Ia_rtd=35;                                                                 %[A]Rated phase current rms value 
Iq_pk=sqrt(2)*Ia_rtd/K_2T3;                                                %[A]Rated q axis current peek value
Ra=0.145;                                                                  %[ohm]Resistance of motor coil
Ld=2.7e-3;%5.67e-3;                                                        %[H] Indutance of motor ld
Lq=Ld;                                                                     % Ld = Lq
La1=(Ld+Lq)/3;                                                             %Inductance of motor phase  
Ofpm=KEp/p;                                                                %[Wb]Flux of magnet phase                                       
Ofq=Ofpm*3/2*K_3T2;                                                        %[Wb]Flux of magnet dq
KE=p*Ofq;                                                                  %KEp means include p in the ke ,at last used ke need to mutiply
KT=KE;                                                                     %torque constant in si unit = ke
Te_rtd=Iq_pk*KT;                                                          %[N.m]Rated torque
Qm0=0;                                                                     %[rad] Initinal position of motor
Dm=0;                                                                      %[Nms/rad]Viscosity Friction Coefficient of Motor2.4e-6*60/2/pi*0.2