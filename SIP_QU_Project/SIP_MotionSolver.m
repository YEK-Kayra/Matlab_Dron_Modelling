%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                   SYSTEM FUNCTION ==> (Motion Dynamics)                  %
%                                                                          %
%  Function Name : SIP_MotionSolver                                        %
%                                                                          %
%  Description   : Solves the full nonlinear motion dynamics of the        %
%                  Special Inverted Pendulum (SIP) system mounted on a     %
%                  quadrotor. It computes the acceleration vector (q_ddot) %
%                  given the current system state and control inputs.      %
%                                                                          %
%  Inputs        : q      - Configuration vector                           %
%                             q = [x; y; z; fi; teta; psi; alfa; beta]     %
%                             - x, y, z          : Position of quadrotor   %
%                             - fi, teta, psi    : Orientation (Roll,      %
%                                                  Pitch, Yaw - in rad)    %
%                             - alfa, beta       : Pendulum joint angles   %
%                                                                          %
%                 q_dot  - Velocity vector                                 %
%                             q_dot = [dx; dy; dz; dfi; dteta; dpsi;       %
%                                       dalfa; dbeta]                      %
%                             - Linear and angular velocities              %
%                                                                          %
%                 u      - Control input vector                            %
%                             u = [f; T]                                   %
%                             - f : 3x1 total thrust force in world frame  %
%                             - T : 3x1 total torque on quadrotor          %
%                                                                          %
%  Outputs       : q_ddot - Acceleration vector                            %
%                             q_ddot = [ddx; ddy; ddz; ddfi; ddteta;       %
%                                       ddpsi; ddalfa; ddbeta]             %
%                                                                          %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 18.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function q_ddot = SIP_MotionSolver(q,q_dot,u)
    
    % Load system constants for drone-pendulum model into the workspace
    run('SIP_SystemConstant.m');

    % Assignments were made to the result matrix.
    M_res = Func_M(q);           % Func_M Sub-function are called.
    B_res = Func_B(q);           % Func_B Sub-function are called.
    G_res = Func_G(q);           % Func_G Sub-function are called.
    C_res = Func_C(q, q_dot);    % Func_C Sub-function are called.
   

    % Solving the dynamic equation
    q_ddot = M_res \ (B_res*u - G_res - C_res * q_dot);   

end
