% Open Simulink model
open_system('BrushedDC');

% Set model parameters
set_param('BrushedDC', 'Solver', 'ode45', 'StopTime', '10');

% Run simulation and retrieve output
simOut = sim("BrushedDC");

% Access results
simData = simOut.get('yout');
v_ts_out = simData{1};
w_hz_ts_out = simData{2};


% PLOT
close("all");

% Plot the current speed
yyaxis left;
plot(w_hz_ts_out.Values, 'b--');
ylabel('Speed, Hz');
ylim([0 120]);
hold on;

% Plot the required voltage
yyaxis right;
plot(v_ts_out.Values, 'r--');
ylabel('Voltage, V');
ylim([0 5]);
hold off;

% Customize plot
xlabel('Time, s');
title('Speed control');
legend('Achieved speed', 'Output Voltage');
grid on;

save("data\simulate", "v_ts_out");