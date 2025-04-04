%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                   SYSTEM FUNCTION ==> (Input Matrix)                     %
%                                                                          %
%  Function Name : Func_U                                                  %
%  Description   : Simulates the system matrix U                           %
%  Inputs        : q - Configuration vector                                %
%                                                                          %
%  Outputs       : U - System matrix                                       %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 04.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function U = Func_U(q)
% Since the sequence q is a time-dependent sequence, 
% there is no need to write "t" separately in the function input.

% content of q array ==> [x, y, z, phi, theta, psi, alfa, beta]
%                    ==> [q(1),q(2),q(3),q(4),q(5),q(6),q(7),q(8)]



% Constant variable of the system
M_drone = 1.50;  %Kg , pure drone weight
mc     = 0.65;  %Kg , pure pendulum weight

% Extract values  from q and arrays and assign them to respective variables
x = q(1);
y = q(2);
z = q(3);
phi = q(4);
theta = q(5);
psi = q(6);
alfa = q(7);
beta = q(8);

%   To simplify the mathematical model representation, the following notation
% is used
C_alpha = cos(alfa);
C_beta  = cos(beta);
S_alpha = sin(alfa);
S_beta  = sin(beta);


% ------------------------------------------------------------------------%
%               Submatrices Contained in the System Matrix U              %
% ------------------------------------------------------------------------%
    
    % Matrix 
    M_force  = [];

tork_phi   = diff(M_force(1),t);
tork_theta = diff(M_force(2),t);
tork_psi   = diff(M_force(3),t);
    % Matrix
    M_tork   = [ tork_phi ;
                tork_theta;
                tork_psi ];
 
% ------------------------------------------------------------------------%
%                                Matrix U                                 %
% ------------------------------------------------------------------------%
    
    U =  [M_force;
          M_tork ;
             0   ;
             0  ];




end
