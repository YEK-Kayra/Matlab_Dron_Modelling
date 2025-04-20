%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%         SYSTEM FUNCTION ==> (Coriolis and virtual force matrix)          %
%                                                                          %
%  Function Name : Func_C                                                  %
%  Description   : Simulates the system matrix C                           %
%  Inputs        : q - Configuration vector                                %
%                           q = [x; y; z; phi; teta; psi; alfa; beta]      %
%                                                                          %
%                  q_dot- first derivative of Configuration vector         %
%                       q_dot = [dx; dy; dz; dfi; dteta; dpsi;dalfa; dbeta]%
%                                                                          %
%  Outputs       : C - System matrix                                       %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 04.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% There is no need to write "t" separately in the function input.
% Since q = q(t), all components of q in the system are already time-dependent.
function C = Func_C(q,q_dot)


% Content of q array ==> [x; y; z; fi; teta; psi; alfa; beta]
%                    ==> [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8)]
% derivatives        ==> [x_dot; y_dot; z_dot; phi_dot; theta_dot; psi_dot; alfa_dot; beta_dot]
%                    ==> [q_dot(1); q_dot(2); q_dot(3); q_dot(4); q_dot(5); q_dot(6); q_dot(7); q_dot(8)]

% Extract values and their derivatives from q and q_dot arrays and assign them to respective variables
x     = q(1);     x_dot = q_dot(1);     % x position and its derivative
y     = q(2);     y_dot = q_dot(2);     % y position and its derivative
z     = q(3);     z_dot = q_dot(3);     % z position and its derivative
phi   = q(4);   phi_dot = q_dot(4);     % phi angle and its derivative
theta = q(5); theta_dot = q_dot(5);     % theta angle and its derivative
psi   = q(6);   psi_dot = q_dot(6);     % psi angle and its derivative
alfa  = q(7);  alfa_dot = q_dot(7);     % alfa angle and its derivative
beta  = q(8);  beta_dot = q_dot(8);     % beta angle and its derivative



% To simplify the mathematical model representation, the following notation is used
C_alpha = cos(alfa);
C_beta  = cos(beta);
S_alpha = sin(alfa);
S_beta  = sin(beta);

% ------------------------------------------------------------------------%
%               Submatrices Contained in the System Matrix C              %
% ------------------------------------------------------------------------%
    
    % Matrix Psi
    M_Psi   = (mc*(l^2))*[         0             , -beta_dot*S_alpha*C_alpha;
                          beta_dot*S_alpha*C_beta, alfa_dot*S_alpha*C_beta ];
    
    % Matrix Gamma
    M_Gamma = (mc*l)*[-(alfa_dot*S_alpha + beta_dot*C_alpha*S_beta), -(alfa_dot*C_alpha*C_beta + beta_dot*S_alpha);
                      -(alfa_dot*S_alpha + beta_dot*C_alpha*S_beta), -(alfa_dot*C_alpha*C_beta + beta_dot*S_alpha);
                            -alfa_dot*C_alpha               ,                       0                            ];


% ------------------------------------------------------------------------%
%                                Matrix C                                 %
% ------------------------------------------------------------------------%
    
    C = [zeros(3,3), zeros(3,3), M_Gamma   ;
         zeros(3,3), zeros(3,3), zeros(3,2);
         zeros(2,3), zeros(2,3), M_Psi    ];



end
