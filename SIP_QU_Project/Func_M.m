%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                     SYSTEM FUNCTION ==> (Inertia matrix)                 %
%                                                                          %
%  Function Name : Func_M                                                  %
%  Description   : Simulates the system matrix M   (Inertia matrix)        %
%  Inputs        :                                                         %
%                  q - Configuration vector                                %
%  Outputs       : M - System matrix                                       %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 04.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function M = Func_M(q)
% Since the sequence \( q \) is a time-dependent sequence, 
% there is no need to write "t" separately in the function input.

% content of q array ==> [x, y, z, phi, theta, psi, alfa, beta]
%                    ==> [q(1),q(2),q(3),q(4),q(5),q(6),q(7),q(8)]

% Extract values  from q and arrays and assign them to respective variables
x = q(1);
y = q(2);
z = q(3);
phi = q(4);
theta = q(5);
psi = q(6);
alfa = q(7);
beta = q(8);

% Constant variable of the system
M_drone= 1.50;  %Kg , pure drone weight
mc     = 0.65;  %Kg , pure pendulum weight


%   To simplify the mathematical model representation, the following notation
% is used
C_alpha = cos(alfa);
C_beta  = cos(beta);
S_alpha = sin(alfa);
S_beta  = sin(beta);


% ------------------------------------------------------------------------%
%               Submatrices Contained in the System Matrix M              %
% ------------------------------------------------------------------------%
    
    % Matrix Theta
    M_theta = [C_alpha*C_beta, -S_alpha*S_beta;
               C_alpha*S_beta,  S_alpha*C_beta;
               S_alpha       ,        0       ];

    % Matrix Gamma
    M_Tau   = [C_alpha*C_beta, -C_alpha*S_beta, -S_alpha;
               S_alpha*S_beta,  S_alpha*C_beta,     0  ];
   
    % Matrix Phi
    M_Phi   = [mc*l^2,          0           ;
                 0   , mc*(l^2)*(S_alpha^2)];


% ------------------------------------------------------------------------%
%                                Matrix M                                 %
% ------------------------------------------------------------------------%

    M = [(M_drone+mc)*eye(3), zeros(3,3) , M_theta   ;
            zeros(3,3)     ,   eye(3)   , zeros(3,2);
              M_Tau        , zeros(2,3) ,  M_Phi   ];



end
