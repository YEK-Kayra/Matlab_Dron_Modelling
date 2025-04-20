%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                   SYSTEM FUNCTION ==> (Control Matrix)                   %
%                                                                          %
%  Function Name : Func_B                                                  %
%  Description   : Simulates the system matrix B                           %
%  Inputs        : q - Configuration vector                                %
%                                 q = [x; y; z; phi; teta; psi; alfa; beta]%  
%  Outputs       : B - System matrix                                       %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 04.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% There is no need to write "t" separately in the function input.
% Since q = q(t), all components of q in the system are already time-dependent.
function B = Func_B(q)


% Content of q array ==> [x; y; z; fi; teta; psi; alfa; beta]
%                    ==> [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8)]

% Extract values  from q and arrays and assign them to respective variables
x = q(1);
y = q(2);
z = q(3);
phi   = q(4);
theta = q(5);
psi   = q(6);
alfa  = q(7);
beta  = q(8);

% To simplify the mathematical model representation, the following notation is used
C_alpha = cos(alfa);
S_alpha = sin(alfa);
C_beta  = cos(beta);
S_beta  = sin(beta);
C_psi   = cos(psi);
S_psi   = sin(psi);


% ------------------------------------------------------------------------%
%               Submatrices Contained in the System Matrix B              %
% ------------------------------------------------------------------------%
    
    % Matrix e
    M_e   = [0;
             0;
             1];

    % Matrix R
    M_R   =  [              C_beta*C_psi         ,              S_psi*S_beta            ,     -S_beta     ;
             C_psi*S_beta*S_alpha - S_psi*C_alpha,  S_psi*S_beta*S_alpha + C_psi*C_alpha,  C_beta*S_alpha ;
             C_psi*S_beta*C_alpha + S_psi*S_alpha,  S_psi*S_beta*C_alpha - C_psi*S_alpha,  C_beta*C_alpha];
 
% ------------------------------------------------------------------------%
%                                Matrix B                                 %
% ------------------------------------------------------------------------%
    
    B =  [M_R*M_e  , zeros(3,3) ;
         zeros(3,1),   eye(3)   ;
         zeros(2,1), zeros(2,3)];


end
