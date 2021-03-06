% Get 3D r0 graphs with respect to phi and either omegae or omegap

% Predefine
phimax = 150;
omegaemax = 900000;
omegapmax = 8000;
r0lim = 2;

%% Graph remus
r0_remus

r0remus = subs(r0remus, paramarr, subsarr);

syms x y
r0remus = subs(r0remus, [phi omegae], [x y]);

figure
grid on
hold on
colormap winter;

xlim([0, phimax])
ylim([0, omegaemax])
zlim([0, 15])%147.135])
caxis([0, 15])

fsurf(r0remus, [0 phimax 0 omegaemax])
patch('XData', [0 0 phimax phimax],...
    'YData', [0 omegaemax omegaemax 0],...
    'ZData', [1 1 1 1],...
    'FaceAlpha', 0.5,...
    'FaceColor', 'w',...
    'DisplayName', 'ℛ_{0}^R = 1')

% Outlines
fixedphivals = [1/4*phimax 1/2*phimax 3/4*phimax];
xspot = 0:omegaemax/100:omegaemax;
for i=1:length(fixedphivals)
    range = zeros(size(xspot, 1), 1);
    
    for j=1:length(xspot)
        range(j) = double(subs(r0remus, [x y], [fixedphivals(i) xspot(j)]))+0.1;
    end
    
    plot3(fixedphivals(i)*ones(size(xspot)), xspot, range, '-r', 'LineWidth', 2)
end

fixedomegaevals = [1/4*omegaemax 1/2*omegaemax 3/4*omegaemax];
yspot = 0:phimax/100:phimax;
for i=1:length(fixedomegaevals)
    range = zeros(size(yspot, 1), 1);
    
    for j=1:length(yspot)
        range(j) = double(subs(r0remus, [x y], [yspot(j) fixedomegaevals(i)]))+0.1;
    end
    
    plot3(yspot, fixedomegaevals(i)*ones(size(yspot)), range, '-r', 'LineWidth', 2)
end

xlabel('\Phi (Host Plants)', 'fontsize', 14)
ylabel('\omega_E (Other Eggs)', 'fontsize', 14)
zlabel('ℛ_{0}^R (Reproduction Number)', 'fontsize', 14)
view([-1 2 1])

%% Graph intricatoria
r0_intricatoria

r0intricatoria = subs(r0intricatoria, paramarr, subsarr);

syms x y
r0intricatoria = subs(r0intricatoria, [phi omegap], [x y]);

figure
grid on
hold on
colormap autumn;

xlim([0, phimax])
ylim([0, omegapmax])
zlim([0, 10])%59.603])
caxis([0, 10])

fsurf(r0intricatoria, [0 phimax 0 omegapmax])
patch('XData', [0 0 phimax phimax],...
    'YData', [0 omegapmax omegapmax 0],...
    'ZData', [1 1 1 1],...
    'FaceAlpha', 0.5,...
    'FaceColor', 'w',...
    'DisplayName', 'ℛ_{0}^I = 1')

% Outlines
fixedphivals = [1/4*phimax 1/2*phimax 3/4*phimax];
xspot = 0:omegapmax/100:omegapmax;
for i=1:length(fixedphivals)
    range = zeros(size(xspot, 1), 1);
    
    for j=1:length(xspot)
        range(j) = double(subs(r0intricatoria, [x y], [fixedphivals(i) xspot(j)]))+0.1;
    end
    
    plot3(fixedphivals(i)*ones(size(xspot)), xspot, range, '-b', 'LineWidth', 2)
end

fixedomegapvals = [1/4*omegapmax 1/2*omegapmax 3/4*omegapmax];
yspot = 0:phimax/100:phimax;
for i=1:length(fixedomegapvals)
    range = zeros(size(yspot, 1), 1);
    
    for j=1:length(yspot)
        range(j) = double(subs(r0intricatoria, [x y], [yspot(j) fixedomegapvals(i)]))+0.1;
    end
    
    plot3(yspot, fixedomegapvals(i)*ones(size(yspot)), range, '-b', 'LineWidth', 2)
end

xlabel('\Phi (Host Plants)', 'fontsize', 14)
ylabel('\omega_P (Other Pupa)', 'fontsize', 14)
zlabel('ℛ_{0}^R (Reproduction Number)', 'fontsize', 14)
view([-1 2 1])
