syms x(t) y(t) z(t) phi(t) theta(t) psi(t) alfa(t) beta(t)

% Sembolik q dizisini tanımla
q = [x(t), y(t), z(t), phi(t), theta(t), psi(t), alfa(t), beta(t)];

% Yeni gelen q değerleri (sayısal değerler)
q_values = [1, 2, cos(3*t), pi/6, pi/4, 0, 0.1, -0.2];

% Değişkenleri yeni gelen q_values ile güncelle
q_substituted = subs(q, {x(t), y(t), z(t), phi(t), theta(t), psi(t), alfa(t), beta(t)}, q_values);

% q'nun türevini al
q_dot = diff(q, t);

% q_dot için sayısal değerleri yerleştir
q_dot_substituted = subs(q_dot, {x(t), y(t), z(t), phi(t), theta(t), psi(t), alfa(t), beta(t)}, q_values);

% Türev alınmış hali ve güncellenmiş q'yu görüntüle
disp('q_substituted (Sayısal değerler ile q):');
disp(q_substituted);

disp('q_dot (Sembolik türev):');
disp(q_dot);

disp('q_dot_substituted (Türev alınmış hali sayısal değerlerle):');
disp(q_dot_substituted);
