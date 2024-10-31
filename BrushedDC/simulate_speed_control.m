system_name = 'SpeedControl.slx';
open_system(system_name);

% Run simulation and retrieve output
simOut = sim(system_name);

% Access results
simData = simOut.get('yout');
v_ts_out = simData{1};
w_hz_ts_out = simData{2};


% PLOT
close("all");
figure;

% Plot the current speed
yyaxis left;
plot(w_hz_ts_out.Values);
ylabel('Speed, Hz');
ylim([0 120]);
hold on;

% Plot the required voltage
yyaxis right;
plot(v_ts_out.Values);
ylabel('Voltage, V');
ylim([0 5]);
hold off;

% Customize plot
xlabel('Time, s');
title('Speed control');
legend('Achieved speed', 'Output Voltage');
grid on;

save("data/output/simulate_speed_control", "v_ts_out");