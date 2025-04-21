function SIP_GUI_States()
    % Modern UIFigure aç
    fig = uifigure('Name','SIP Initial State Setup','Position',[100 100 800 500]);

    % GridLayout oluştur
    gl = uigridlayout(fig, [6, 9]);
    gl.RowHeight = {'fit','fit','fit','fit','fit','1x'};
    gl.ColumnWidth = repmat({'1x'}, 1, 9);

    % Başlık
    title = uilabel(gl, 'Text','SIP Initial State Setup', ...
        'FontSize',18,'FontWeight','bold');
    title.Layout.Row = 1;
    title.Layout.Column = [1 9];

    % q (pozisyon-açılar)
    q_labels = {'x','y','z','ϕ','θ','ψ','α','β'};
    q_fields = gobjects(1,8);
    for i = 1:8
        uilabel(gl, 'Text', q_labels{i}, 'HorizontalAlignment','center');
        q_fields(i) = uieditfield(gl, 'numeric', 'Value', 0);
    end

    % q̇ (hızlar)
    q_dot_labels = {'ẋ','ẏ','ż','ϕ̇','θ̇','ψ̇','α̇','β̇'};
    qdot_fields = gobjects(1,8);
    for i = 1:8
        uilabel(gl, 'Text', q_dot_labels{i}, 'HorizontalAlignment','center');
        qdot_fields(i) = uieditfield(gl, 'numeric', 'Value', 0);
    end

    % Boş yer tutucu
    uilabel(gl, 'Text', '');

    % Simülasyonu Başlat butonu
    btnStart = uibutton(gl, 'Text','Start Simulation', ...
        'ButtonPushedFcn', @(btn,event)startSimulation(q_fields, qdot_fields));
    btnStart.Layout.Row = 6;
    btnStart.Layout.Column = 3;

    % Reset Butonu
    btnReset = uibutton(gl, 'Text','Reset', ...
        'ButtonPushedFcn', @(btn,event)resetFields(q_fields, qdot_fields));
    btnReset.Layout.Row = 6;
    btnReset.Layout.Column = 4;

    % Randomize Butonu
    btnRandom = uibutton(gl, 'Text','Randomize', ...
        'ButtonPushedFcn', @(btn,event)randomizeFields(q_fields, qdot_fields));
    btnRandom.Layout.Row = 6;
    btnRandom.Layout.Column = 5;
end

function startSimulation(q_fields, qdot_fields)
    q = arrayfun(@(e) e.Value, q_fields);
    q_dot = arrayfun(@(e) e.Value, qdot_fields);
    disp('Simulation started with:');
    disp(['q: ', mat2str(q)]);
    disp(['q_dot: ', mat2str(q_dot)]);
end

function resetFields(q_fields, qdot_fields)
    arrayfun(@(e) set(e, 'Value', 0), q_fields);
    arrayfun(@(e) set(e, 'Value', 0), qdot_fields);
end

function randomizeFields(q_fields, qdot_fields)
    arrayfun(@(e) set(e, 'Value', randn()*0.1), q_fields);
    arrayfun(@(e) set(e, 'Value', randn()*0.1), qdot_fields);
end
