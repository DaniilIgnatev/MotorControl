system_name = 'MotorSimulation.slx';
open_system(system_name);

time_input = [0 1 10];
voltage_input = [0 3 3];
input_signal = timeseries(voltage_input, time_input);

simIn = Simulink.SimulationInput(system_name);
simIn = simIn.setExternalInput([input_signal]);

simOut = sim(simIn);


% Access results
simData = simOut.get('yout');
w_ts_out = simData{1};

% PLOT
close("all");

% Plot the speed
plot(w_ts_out.Values, 'b-');
ylabel('Speed, Hz');
ylim([0 100]);
hold off;

% Customize plot
xlabel('Time, s');
xlim([0 10]);
title('Speed control');
legend('Achieved speed');
grid on;

save("data/output/simulate_motor", "w_ts_out");