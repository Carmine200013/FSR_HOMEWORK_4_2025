function plot_quadruped_metrics(tout, Xout, Xdout, Uout, Udout,p)
    
    t = (tout(1):p.simTimeStep:tout(end))';  % tempo uniforme
    X  = interp1(tout, Xout,  t);
    U  = interp1(tout, Uout,  t);
    Xd = interp1(tout, Xdout, t);
    Ud = interp1(tout, Udout, t);
    
    % Costruzione del tempo per U2 a gradino
    t2 = repelem(t, 2); t2(1) = []; t2(end+1) = t2(end);
    U2 = repelem(U, 2, 1);
    
    folderPath = 'C:\Users\maist\Desktop\Università\Magistrale\Field_And_Service_Robotics\Homework_4\quadruped_simulation\quadruped_simulation\Plots';

    % ----- 1. Position -----
    po = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(t, X(:,1), 'r', t, X(:,2), 'g', t, X(:,3), 'b', ...
         t, Xd(:,1), 'r--', t, Xd(:,2), 'g--', t, Xd(:,3), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Position [m]', 'Interpreter', 'latex');
    title('Position', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$x$', '$y$', '$z$', '$x_{des}$', '$y_{des}$', '$z_{des}$', 'FontSize', 14, ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on; 
    exportgraphics(po, fullfile(folderPath, 'Position_Trot.pdf'));
    
    % ----- 2. Linear Velocity -----
    v = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(t, X(:,4), 'r', t, X(:,5), 'g', t, X(:,6), 'b', ...
         t, Xd(:,4), 'r--', t, Xd(:,5), 'g--', t, Xd(:,6), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Velocity [m/s]', 'Interpreter', 'latex');
    title('Velocity', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$v_x$', '$v_y$', '$v_z$', '$v_{x,des}$', '$v_{y,des}$', '$v_{z,des}$', 'FontSize', 14, ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(v, fullfile(folderPath, 'Velocity_Trot.pdf'));

    % ----- 3. Angular Velocity -----
    w = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(t, X(:,16), 'r', t, X(:,17), 'g', t, X(:,18), 'b', ...
         t, Xd(:,16), 'r--', t, Xd(:,17), 'g--', t, Xd(:,18), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Angular velocity [rad/s]', 'Interpreter', 'latex');
    title('Angular Velocity', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$\omega_x$', '$\omega_y$', '$\omega_z$', ...
           '$\omega_{x,des}$', '$\omega_{y,des}$', '$\omega_{z,des}$', 'FontSize', 14, ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(w, fullfile(folderPath, 'Angular_Velocity_Trot.pdf'));
    
    % ----- 4. Fz -----
    f = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(t, U(:,3), 'r', t, U(:,6), 'g', t, U(:,9), 'b', t, U(:,12), 'k', ...
         t, Ud(:,3), 'r--', t, Ud(:,6), 'g--', t, Ud(:,9), 'b--', t, Ud(:,12), 'k--', ...
         'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('$F_z$ [N]', 'Interpreter', 'latex');
    title('$F_z$', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$U_2$ Leg 1', '$U_2$ Leg 2', '$U_2$ Leg 3', '$U_2$ Leg 4', ...
            '$U_d$ Leg 1', '$U_d$ Leg 2', '$U_d$ Leg 3', '$U_d$ Leg 4', 'FontSize', 14, ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(f, fullfile(folderPath, 'Fz_Trot.pdf'));
end
