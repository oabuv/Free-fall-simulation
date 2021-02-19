function free_falling

% Author: Bao Vu
% Student ID: e1800948
% School: Vamk

clc
close all
clear all

g = 9.81; %gravitational acceleration

%% INPUT DATA
y = 45; % Original altitude

x = 0;
v = 0;
t = 0;
dt = 0.01; %time interval
s = 0;

t_array = t;
s_array = s;
v_array = v;
a_array = g;

%% FIGURES
fig_object = figure('name','Falling Object','numbertitle','off');
set(fig_object,'Units','normalized','position',[0 0.1 0.2 0.78]);
graph_object = plot(x,y,'gs','MarkerSize',30,'markerfacecolor','r'); %create object size of 20 with green border and red face 

xlabel('X [m]');
ylabel('Y [m]');

axis equal
axis([-5 5 0 50]);

%Distant
fig_distant = figure('name','Distant','numbertitle','off');
set(fig_distant,'Units','normalized','position',[0.6 0.3 0.3 0.35]); %set the nozrmalized unit (min is 0 ans max is 1)
graph_distant = plot(t_array,s_array,'b','linewidth',2);

xlabel('Time [s]');
ylabel('Distant [m]');

%Velocity
fig_velocity = figure('name','Velocity','numbertitle','off');
set(fig_velocity,'Units','normalized','position',[0.22 0.55 0.3 0.35]);
graph_velocity = plot(t_array,v_array,'r','linewidth',2);

xlabel('Time [s]');
ylabel('Velocity [m/s]');

%Acceleration
fig_acceleration = figure('name','Acceleration','numbertitle','off');
set(fig_acceleration,'Units','normalized','position',[0.22 0.1 0.3 0.35]);
graph_acceleration = plot(t_array,a_array,'m','linewidth',2);

xlabel('Time [s]');
ylabel('Acceleration [m/s^2]');

%% CALCULATION
    while y>0
    t = t+dt;
    t_array = [t_array t];
    
    %a = -g because the object go down
    a = -g;
    v = v+a*dt;
    y = y+v*dt+0.5*a*dt.^2;

    s_array = [s_array y];
    %Use abs function for v and a since these value cannot be minus
    v_array = [v_array abs(v)]; 
    a_array = [a_array abs(a)]; %a is constant

    set(graph_object,'xdata',x,'ydata',y);
    
    set(graph_distant,'xdata',t_array,'ydata',s_array);
    
    set(graph_velocity,'xdata',t_array,'ydata',v_array);
    
    set(graph_acceleration,'xdata',t_array,'ydata',a_array);
    pause(0.03);
    end
end
