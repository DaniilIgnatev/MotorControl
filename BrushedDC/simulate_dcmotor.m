system_name = 'MotorSimulation.slx';
open_system(system_name);

time_input = [0 1.5 10];
voltage_input = [0 1.5 1.5];
input_signal = timeseries(voltage_input, time_input);

simIn = Simulink.SimulationInput(system_name);
simIn = simIn.setExternalInput([input_signal]);

simOut = sim(simIn);


% Access results
simData = simOut.get('yout');
w_ts_out = simData{1};
I_ts_out = simData{3};

% PLOT
close("all");
figure;

% Plot speed
yyaxis left
plot(w_ts_out.Values);
ylabel('Speed, Hz');
ylim([0 300]);
hold on;

% Plot current
yyaxis right
plot(I_ts_out.Values);
ylabel('Current, mA');
ylim([0 500]);
hold off;

% Customize plot
xlabel('Time, s');
title('Motor simulation');
legend('Speed', 'Current');
grid on;

save("data/output/simulate_motor", "w_ts_out");