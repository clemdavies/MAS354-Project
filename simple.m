
% 4.6
% velocity of satelite orbiting earth at 400km
G = 9.8;
earthRadius = 6378.14;
GM = 3.986005e+14;
desiredAlt = 400;

r = (earthRadius + desiredAlt) * 1000; % metres
v = sqrt(GM/r);
%v ~= 7666.86 m/s

% solving for orbit, radius from earth center for burnout to 400km orbit

r1 = r; %km from center of earh
y1 = pi/2; % angle between position and velocity vectors
v1 = v; % m/s
% 
% solve for Rp = Ra = 400km = 400000m

c = (2*GM) / (r1 * v1^2);
c2 = (2*GM)/(v1^2); % c2 = c*r1
c3 = (2*GM)/(r1);   % c3 = c*v1^2

% Rp = perigee radius from center 
% Ra = apogee radius from center 
%
Rp = (400 + earthRadius) * 1000;
Ra = Rp;
r1 = (400 + earthRadius) * 1000;

% two roots, r1a 
r1a = (c2 * Rp^2 - Rp * sqrt(c2^2 * Rp^2 - 4 * c2 * Rp - 4*sin(y1).^2 )) / (2 * (c2 * Rp + sin(y1).^2))
r1b = (c2*Rp^2 + Rp*sqrt(c2^2*Rp^2-4*c2*Rp-4*sin(y1).^2) ) / (2*(c2*Rp+sin(y1).^2))
% r1a/1000-earthRadius
 
% vList = v:100:v*2;
%  cList = 2.*GM ./ vList.^2;
% plot(vList,root1(cList))


% burnout at 400km
r1 = (400 + earthRadius) * 1000;
c = (2*GM) / (r1 * v1^2);
roo1 = (-c + sqrt( c^2 -4*(1-c)*(-1 * sin(y1).^2))) / (2*(1-c));
roo2 = (-c - sqrt( c^2 -4*(1-c)*(-1 * sin(y1).^2))) / (2*(1-c));

Ra = r1*roo1 /1000 - earthRadius
Rp = r1*roo2 /1000 - earthRadius

% e = sqrt((r1*v1^2/GM)-1)


% calculating apogee using perigee altitude and perigee velocity
% Vp = v
% Ra = Rp / ( 2*GM/(Rp* Vp^2) -1 )
% 
% Ra/1000 - earthRadius


function y = root1(c2)
    global Rp y1 GM;
    y = (c2 .* Rp^2 - Rp .* sqrt(c2.^2 .* Rp^2 - 4 .* c2 .* Rp - 4*sin(y1).^2 )) ./ (2 .* (c2 .* Rp + sin(y1).^2))
end

function y = root2(v1)
    global Rp y1 GM;
    c2 = (2*GM)./(v1.^2);
    y = (c2.*Rp^2 + Rp.*sqrt(c2.^2.*Rp^2-4.*c2.*Rp-4*sin(y1).^2) ) ./ (2.*(c2.*Rp+sin(y1).^2))
end
