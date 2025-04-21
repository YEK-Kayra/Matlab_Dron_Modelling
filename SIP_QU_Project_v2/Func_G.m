%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                   SYSTEM FUNCTION ==> (Gravity Matrix)                   %
%                                                                          %
%  Function Name : Func_G                                                  %
%  Description   : Simulates the system matrix G                           %
%  Inputs        : q - Configuration vector                                %
%                                 q = [x; y; z; phi; teta; psi; alfa; beta]%                                                                         %
%  Outputs       : G - System matrix                                       %
%  Author        : Yunus Emre Kayra                                        %
%  Date          : 04.04.2025                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% There is no need to write "t" separately in the function input.
% Since q = q(t), all components of q in the system are already time-dependent.
function G = Func_G(q)


% Content of q array ==> [x; y; z; fi; teta; psi; alfa; beta]
%                    ==> [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8)]

% Extract values  from q and arrays and assign them to respective variables
x   = q(1);
y   = q(2);
z   = q(3);
phi = q(4);
theta = q(5);
psi   = q(6);
alfa  = q(7);
beta  = q(8);

% To simplify the mathematical model representation, the following notation is used
C_alpha = cos(alfa);
C_beta  = cos(beta);
S_alpha = sin(alfa);
S_beta  = sin(beta);


% ------------------------------------------------------------------------%
%               Submatrices Contained in the System Matrix G              %
% ------------------------------------------------------------------------%
    
    % Matrix gmu
    M_gmu   = [-mc*l*g*S_alpha;
                      0      ];
 
% ------------------------------------------------------------------------%
%                                Matrix G                                 %
% ------------------------------------------------------------------------%
    
    G = [   zeros(2,1)  ;
        g*(M_drone + mc);
            zeros(3,1)  ;
              M_gmu    ];


end
