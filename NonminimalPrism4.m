clear; clf; figure(1);clc;

Q(:,1)=[0; 0; 0];
Q(:,2)=[0; 2; 0];
Q(:,3)=[2; 2; 0]; 
Q(:,4)=[2; 0; 0];
Q(:,5)=[1-2^0.5; 1; 10];
Q(:,6)=[1; 1+2^0.5; 10];
Q(:,7)=[1+2^0.5; 1; 10]; 
Q(:,8)=[1; 1-2^0.5; 10]; 
P=[];
[dim,q]=size(Q); p=size(P,2); n=q+p;

% Connectivity matrix
C(  1,3)=1; C(  1,5)=-1;       % bars 
C(  2,2)=1; C(  2,8)=-1;
C(  3,4)=1; C(  3,6)=-1;
C(  4,1)=1; C(  4,7)=-1;b=4;
C(b+1,1)=1; C(b+1,2)=-1;       % strings 
C(b+2,1)=1; C(b+2,3)=-1;    
C(b+3,1)=1; C(b+3,4)=-1;    
C(b+4,1)=1; C(b+4,5)=-1;    
C(b+5,1)=1; C(b+5,6)=-1;    
C(b+6,1)=1; C(b+6,8)=-1;    
C(b+7,2)=1; C(b+7,3)=-1;    
C(b+8,2)=1; C(b+8,4)=-1;    
C(b+9,2)=1; C(b+9,5)=-1;
C(b+10,2)=1; C(b+10,6)=-1;
C(b+11,2)=1; C(b+11,7)=-1;
C(b+12,3)=1; C(b+12,4)=-1;
C(b+13,3)=1; C(b+13,6)=-1;
C(b+14,3)=1; C(b+14,7)=-1;
C(b+15,3)=1; C(b+15,8)=-1;
C(b+16,4)=1; C(b+16,5)=-1;
C(b+17,4)=1; C(b+17,7)=-1;
C(b+18,4)=1; C(b+18,8)=-1;
C(b+19,5)=1; C(b+19,6)=-1;
C(b+20,5)=1; C(b+20,7)=-1;
C(b+21,5)=1; C(b+21,8)=-1;
C(b+22,6)=1; C(b+22,7)=-1;
C(b+23,6)=1; C(b+23,8)=-1;
C(b+24,7)=1; C(b+24,8)=-1;s=24; m=b+s;

U(1:dim,1:8)=0; 
U(1:dim,1:8)=0; U(3,1)=-1; U(3,2)=-1;U(3,3)=-1;U(3,4)=-1;U(3,5)=1; U(3,6)=1;U(3,7)=1;U(3,8)=1;


[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;


