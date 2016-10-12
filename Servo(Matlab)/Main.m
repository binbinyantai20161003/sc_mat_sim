%% Simulation Platform for Servo Development in Googoltech  %% Main.m Apr. 28 '2012 (c) by Zhang.WN  clear; clc;  file='Mains';  YMDHMS = clock;  fprintf('\n    '); fprintf(date);  fprintf('  %2.2g:%2.2g',YMDHMS(4),YMDHMS(5));  fprintf('  "'),  fprintf(file),  fprintf('"\n');TransMode=1;%0:Absolute, 1:Relative transform if(TransMode==1)    K_2T3=1;     K_3T2=2/3; else    K_2T3=sqrt(2/3);     K_3T2=sqrt(2/3); endPara_Motor;Tload=Te_rtd*0;%Torque of load Para_Control;%% Reference Setting %%%%%%%%%Qrm=2*pi*2;Arm=Trmax/Jm;%[rad/s2] Maximum velocityif(2*Qrm*Arm>Wrmax^2)    Wrm=Wrmax;%[rad/s] Maximum velocity of reference    ta=Wrm/Arm;%[s] accelerating time    tb=Qrm/Wrm; else     ta=sqrt(2*Qrm/Armax);     Wrm=Arm*ta;    tb=ta;end    tc=ta+tb;tfinal=3; twr=[0 ta tb tc tfinal]';%vector of time Wrr=[0 Wrm Wrm 0 0]';%vector of velocity referenceif(1) %if velociy control    Wrm=Wrmax;%1500*2*pi/60;%    twr=[0 ta tfinal]';%vector of time     Wrr=[0 Wrm Wrm]';%vector of velocity referenceend%% Start Simulation %%%%%%%%%set_param(0,'CharacterEncoding','Shift_JIS');sim(file);%% Plot Time Response  %%%%%%%%%Graph_Result;YMDHMS = clock;fprintf('finish time: %2.2g:%2.2g',YMDHMS(4),YMDHMS(5)),fprintf('"\n');