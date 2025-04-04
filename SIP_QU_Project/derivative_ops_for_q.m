
%System inputs array
% (x,y,z        ) dron&pendulum cordinats
% (phi,theta,psi) roll,pitch,yaw d
% (alpha,beta   ) pendulum angles
syms x(t) y(t) z(t) phi(t) theta(t) psi(t) alfa(t) beta(t)
q = [x(t), y(t), z(t), phi(t), theta(t), psi(t), alfa(t), beta(t)];


q_dot    = diff(q, t);      %first derivative

q_dotdot = diff(q_dot,t);   %second derivative

disp(q_dotdot);

