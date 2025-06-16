function plot_quadruped_metrics(tout, Xout, Xdout, Uout, Udout)

    folderPath = 'C:\Users\maist\Desktop\Università\Magistrale\Field_And_Service_Robotics\Homework_4\quadruped_simulation\quadruped_simulation\Plots';

    % ----- 1. Position -----
    p = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(tout, Xout(:,1), 'r', tout, Xout(:,2), 'g', tout, Xout(:,3), 'b', ...
         tout, Xdout(:,1), 'r--', tout, Xdout(:,2), 'g--', tout, Xdout(:,3), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Position [m]', 'Interpreter', 'latex');
    title('Position', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$x$', '$y$', '$z$', '$x_{des}$', '$y_{des}$', '$z_{des}$', ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(p, fullfile(folderPath, 'Position_Trot.pdf'));
    
    % ----- 2. Linear Velocity -----
    v = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(tout, Xout(:,4), 'r', tout, Xout(:,5), 'g', tout, Xout(:,6), 'b', ...
         tout, Xdout(:,4), 'r--', tout, Xdout(:,5), 'g--', tout, Xdout(:,6), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Velocity [m/s]', 'Interpreter', 'latex');
    title('Velocity', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$v_x$', '$v_y$', '$v_z$', '$v_{x,des}$', '$v_{y,des}$', '$v_{z,des}$', ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(v, fullfile(folderPath, 'Velocity_Trot.pdf'));

    % ----- 3. Angular Velocity -----
    w = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(tout, Xout(:,16), 'r', tout, Xout(:,17), 'g', tout, Xout(:,18), 'b', ...
         tout, Xdout(:,16), 'r--', tout, Xdout(:,17), 'g--', tout, Xdout(:,18), 'b--', 'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('Angular velocity [rad/s]', 'Interpreter', 'latex');
    title('Angular Velocity', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$\omega_x$', '$\omega_y$', '$\omega_z$', ...
           '$\omega_{x,des}$', '$\omega_{y,des}$', '$\omega_{z,des}$', ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(w, fullfile(folderPath, 'Angular_Velocity_Trot.pdf'));
    
    % ----- 4. Fz -----
    f = figure('Renderer','painters','Position',[10 10 900 350]);
    plot(tout, Uout(:,3), 'r', tout, Uout(:,6), 'g', tout, Uout(:,9), 'b', tout, Uout(:,12), 'k', ...
         tout, Udout(:,3), 'r--', tout, Udout(:,6), 'g--', tout, Udout(:,9), 'b--', tout, Udout(:,12), 'k--', ...
         'LineWidth', 1.2);
    set(gca, 'FontSize',12);
    xlabel('Time [s]', 'Interpreter', 'latex');
    ylabel('$F_z$ [N]', 'Interpreter', 'latex');
    title('$F_z$', 'FontSize', 16, 'Interpreter', 'latex');
    legend('$U_2$ Leg 1', '$U_2$ Leg 2', '$U_2$ Leg 3', '$U_2$ Leg 4', ...
            '$U_d$ Leg 1', '$U_d$ Leg 2', '$U_d$ Leg 3', '$U_d$ Leg 4', ...
           'Interpreter', 'latex', 'Location', 'eastoutside');
    grid on;
    exportgraphics(f, fullfile(folderPath, 'Fz_Trot.pdf'));
end
