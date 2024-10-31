% Open Simulink model
open_system('BrushedDC');

% Set model parameters
set_param('BrushedDC', 'Solver', 'ode45', 'StopTime', '10');

% Example time and input data
time = [0 1 10];

speed_data = [0 100 100];
speed_set_hz_ts_in = timeseries(speed_data, time);

torque_load_data = [0 0 0];
torque_load_nm_ts_in = timeseries(torque_load_data, time);

simIn = Simulink.SimulationInput('BrushedDC');
simIn = simIn.setVariable("speed_set_hz", speed_set_hz_ts_in);
simIn = simIn.setVariable("torque_load_nm", torque_load_nm_ts_in);

% Run simulation and retrieve output
simOut = sim('BrushedDC');

% Access results
simData = simOut.get('yout');
v_ts_out = simData{1};
w_hz_ts_out = simData{2};


% PLOT
close("all");

% Plot the set speed
figure;
yyaxis left;
plot(speed_set_hz_ts_in, 'b-');
ylabel('Speed, Hz');
ylim([0 120]);
hold on;

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
legend('Target speed', 'Achieved speed', 'Output Voltage');
grid on;