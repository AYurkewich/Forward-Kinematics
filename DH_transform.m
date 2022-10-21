%Class example - DH Transforms
clear all; close all; clc
syms d1 l2 l3 d1 t2 t3
%  t2 = 0; 
%  t3 = pi/4;
%  l2 = 1;
%  l3 = 2;
%  d1 = 1;

T1 = [1 0 0 0;
      0 1 0 0;
      0 0 1 d1;
      0 0 0 1];
  
T2 = [cos(t2) -sin(t2) 0 0;
      sin(t2) cos(t2)  0 0;
      0         0      1 0;
      0         0      0 1];
  
T3 = [cos(t3) -sin(t3) 0 l2;
      sin(t3) cos(t3)  0 0;
      0         0      1 0;
      0         0      0 1];
  
T4 = [1 0 0 l3;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];
  
 T5 = T1*T2*T3*T4


    
    