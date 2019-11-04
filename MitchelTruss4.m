clear; clf; figure(1);clc;
% Free [Q=Q_(dim x q)] and fixed [P=P_(dim x q)] node locations
Si = pi/8;
beta = pi/6;
a = sin(beta)/sin(beta+Si);
c = sin(Si)/sin(beta+Si);
r0 = 5; r1 = a*r0; r2 = a*r1; r3 = a*r2; r4 = a*r3;

P(:,1)=[0;r4];
P(:,2)=[r4*cos(2*Si);r4*sin(2*Si)];
P(:,3)=[r4;0];
P(:,4)=[r4*cos(2*Si);-r4*sin(2*Si)];
P(:,5)=[0;-r4];

Q(:,1)=[r3*cos(3*Si);r3*sin(3*Si)];
Q(:,2)=[r3*cos(1*Si);r3*sin(1*Si)];
Q(:,3)=[r3*cos(1*Si);-r3*sin(1*Si)];
Q(:,4)=[r3*cos(3*Si);-r3*sin(3*Si)];
Q(:,5)=[r2*cos(2*Si);r2*sin(2*Si)];
Q(:,6)=[r2;0];
Q(:,7)=[r2*cos(2*Si);-r2*sin(2*Si)];
Q(:,8)=[r1*cos(1*Si);r1*sin(1*Si)];
Q(:,9)=[r1*cos(1*Si);-r1*sin(1*Si)];
Q(:,10)=[r0;0];
[dim,q]=size(Q), p=size(P,2), n=q+p; 

C(  1,9)=1; C(  1,10)=-1;       % bars 
C(  2,7)=1; C(  2,9)=-1;    
C(  3,4)=1; C(  3,7)=-1;                                              
C(  4,15)=1; C(  4,4)=-1;
C(  5,6)=1; C(  5,8)=-1;
C(  6,3)=1; C(  6,6)=-1;
C(  7,14)=1; C(  7,3)=-1;
C(  8,13)=1; C(  8,2)=-1;
C(  9,2)=1; C(  9,5)=-1;
C(  10,12)=1; C(  10,1)=-1;b=10;    
C(b+1,11)=1; C(b+1,1)=-1;       % strings 
C(b+2,1)=1; C(b+2,5)=-1;    
C(b+3,5)=1; C(b+3,8)=-1;    
C(b+4,8)=1; C(b+4,10)=-1;
C(b+5,12)=1; C(b+5,2)=-1; 
C(b+6,2)=1; C(b+6,6)=-1; 
C(b+7,6)=1; C(b+7,9)=-1; 
C(b+8,13)=1; C(b+8,3)=-1; 
C(b+9,3)=1; C(b+9,7)=-1; 
C(b+10,14)=1; C(b+10,4)=-1; 

s=10; m=b+s;

% Applied external force U=U_(dim x q)
% U(1:dim,1:4)=0; U(1,1)=1; U(1,3)=-1.6; U(1,4)=.3; U(1,5)=.3;
U(1:dim,1:9)=0; U(2,10)=-10; U(1,10)=0;


% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,2.0); grid on;

% end script TBar




