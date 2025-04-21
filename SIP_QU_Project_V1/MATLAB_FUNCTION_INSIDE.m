function q_ddot = fcn(q, q_dot, u)
   
%% ====[ System Constants ]====

M_drone = 1.50;   % kg, Mass of the drone (without pendulum)
mc      = 0.65;   % kg, Mass of the pendulum (without drone)
l       = 0.30;   % m,  Length of the pendulum stick
g       = 9.81;   % m/s^2, Gravitational acceleration

%% ====[ State Variable Extraction ]====
% Extract values and their derivatives from q and q_dot arrays 
% and assign them to respective physical quantities

% Content of q array ==> [x; y; z; fi; teta; psi; alfa; beta]
%                    ==> [q(1); q(2); q(3); q(4); q(5); q(6); q(7); q(8)]
% derivatives        ==> [x_dot; y_dot; z_dot; phi_dot; theta_dot; psi_dot; alfa_dot; beta_dot]
%                    ==> [q_dot(1); q_dot(2); q_dot(3); q_dot(4); q_dot(5); q_dot(6); q_dot(7); q_dot(8)]

x     = q(1);     x_dot = q_dot(1);     % x position and its derivative
y     = q(2);     y_dot = q_dot(2);     % y position and its derivative
z     = q(3);     z_dot = q_dot(3);     % z position and its derivative
phi   = q(4);   phi_dot = q_dot(4);     % phi angle and its derivative
theta = q(5); theta_dot = q_dot(5);     % theta angle and its derivative
psi   = q(6);   psi_dot = q_dot(6);     % psi angle and its derivative
alfa  = q(7);  alfa_dot = q_dot(7);     % alfa angle and its derivative
beta  = q(8);  beta_dot = q_dot(8);     % beta angle and its derivative


%% ====[ Trigonometric Shorthand Notations ]====
% To simplify the mathematical model representation, the following notation is used

C_alpha = cos(alfa);
S_alpha = sin(alfa);
C_beta  = cos(beta);
S_beta  = sin(beta);
C_psi   = cos(psi);
S_psi   = sin(psi);



%% ====[ SUBMATRICES FOR SYSTEM MATRIX M,C,G and B ]====  

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
%               Submatrices Contained in the System Matrix G              %
% ------------------------------------------------------------------------%
    
    % Matrix gmu
    M_gmu   = [-mc*l*g*S_alpha;
                      0      ];


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
%               Submatrices Contained in the System Matrix M              %
% ------------------------------------------------------------------------%
    
    % Matrix Theta
    M_theta = (mc*l)*[C_alpha*C_beta, -S_alpha*S_beta;
                      C_alpha*S_beta,  S_alpha*C_beta;
                      S_alpha       ,        0       ];

    % Matrix Tau
    M_Tau   = (mc*l)*[C_alpha*C_beta , -S_alpha*S_beta;
                      -C_alpha*S_beta,  S_alpha*C_beta;     
                          -S_alpha   ,         0     ];
   
    % Matrix Phi
    M_Phi   = [mc*l^2,          0           ;
                 0   , mc*(l^2)*(S_alpha^2)];

%% ====[ SYSTEM MATRIX M,C,G,U and B ]====  
% q_ddot = M \ (B*u - G - C*q_dot);

% ------------------------------------------------------------------------%
%                                Matrix B                                 %
% ------------------------------------------------------------------------%
    
    B =  [M_R*M_e  , zeros(3,3) ;
         zeros(3,1),   eye(3)   ;
         zeros(2,1), zeros(2,3)];

% ------------------------------------------------------------------------%
%                                Matrix G                                 %
% ------------------------------------------------------------------------%
    
    G = [   zeros(2,1)  ;
        g*(M_drone + mc);
            zeros(3,1)  ;
              M_gmu    ];

% ------------------------------------------------------------------------%
%                                Matrix C                                 %
% ------------------------------------------------------------------------%
    
    C = [zeros(3,3), zeros(3,3), M_Gamma   ;
         zeros(3,3), zeros(3,3), zeros(3,2);
         zeros(2,3), zeros(2,3), M_Psi    ];

% ------------------------------------------------------------------------%
%                                Matrix M                                 %
% ------------------------------------------------------------------------%

    M = [(M_drone+mc)*eye(3), zeros(3,3) , M_theta   ;
            zeros(3,3)      ,   eye(3)   , zeros(3,2);
              M_Tau         , zeros(2,3) ,  M_Phi   ];
% ------------------------------------------------------------------------%
%                                Matrix U                                 %
% ------------------------------------------------------------------------%

    U = [1,1;
         1,1;
         1,1];

%% ====[ SOLVING SYSTEM DYNAMIC EQUATION ]====  

 q_ddot = M \ (B*u - G - C*q_dot);  

end
