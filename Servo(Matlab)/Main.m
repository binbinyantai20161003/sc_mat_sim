%% Simulation Platform for Servo Development in Googoltech  %% Main.m Apr. 28 '2012 (c) by Zhang.WN  clear; clc;  file='Mains';  YMDHMS = clock;  fprintf('\n    '); fprintf(date);  fprintf('  %2.2g:%2.2g',YMDHMS(4),YMDHMS(5));  fprintf('  "'),  fprintf(file),  fprintf('"\n');TransMode=1;%0:Absolute, 1:Relative transform if(TransMode==1)    K_2T3=1;     K_3T2=2/3; else    K_2T3=sqrt(2/3);     K_3T2=sqrt(2/3); endPara_Motor;Tload=Te_rtd*0;%Torque of load Para_Control;%% Reference Setting %%%%%%%%%Qrm=2*pi*5;Arm=Trmax/Jm;                                                              %[rad/s2] Maximum acceleration%Qrm > 1/2*Arm*t^2*2 = a(t)^2 = w*t 两边乘以a得到 Qrm* A = w^2 %这说明给定的位置超过加速部分和对称的减速部分，还有一段匀速部分才能够运行完给定的posif(Qrm*Arm>(Wrmax^2))                                                          Wrm=Wrmax;                                                             %[rad/s] Maximum velocity of reference    ta=Wrm/Arm;                                                            %[s] accelerating time    tb=Qrm/Wrm;                                                            %[s] 匀速时间 tb*wr = Qrm ，tb是在ta基础上的时间，包含加速时间和匀速时间，                                                                           % 当把减速部分和加速部分合为一体，就得到上式else     %达不到最大转速    ta=sqrt(2*0.5*Qrm/Arm);                                                %0.5*s = 1/2*a*t^2 时间是加减速各一半    Wrm=Arm*ta;                                                            %v = at    tb=ta;                                                                 %加减速时间相同，呈现三角形的速度规划end    tc=ta+tb;tfinal=3; twr=[0 ta tb tc tfinal]';                                                  %vector of time Wrr=[0 Wrm Wrm 0 0]';                                                      %vector of velocity referenceif(1)                                                                      %if velociy control    Wrm=240; % Wrmax*2;                                                    %当设定转速指令超过一定的转速，那么也无法跟踪，说明弱磁也无法达到这个转速，                                                                           %这时会脱离弱磁。    twr=[0 1 tfinal]';                                                     %vector of time     Wrr=[0 Wrm Wrm]';                                                      %vector of velocity referenceend%% Start Simulation %%%%%%%%%set_param(0,'CharacterEncoding','Shift_JIS');sim(file);%% Plot Time Response  %%%%%%%%%Graph_Result;YMDHMS = clock;fprintf('finish time: %2.2g:%2.2g',YMDHMS(4),YMDHMS(5)),fprintf('"\n');