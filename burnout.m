% Calculating radius of apogee and perigee 
% burnout at desired altitude produces an apogee of Ra,
% and a perigee of Rp radius from centre of earth.
% if desiredAltKM == burnoutAltKM, then Ra == Rp,
% a circular orbit of ecentricity = 0
% 

%ORBITAL MECHANICS 

%variable
desiredAltKM = 400;
burnoutAltKM = 400;
angleAtBurnout = pi/2;

%constant
global earthRadiusKM GM;
earthRadiusKM = 6378.14;
GM = 3.986005e+14;

% calculate velocity at desired altitude in a circular orbit
radiusM = radiusFromEarthCenterM(desiredAltKM);

% uniform circular motion eq(4.6)
velocityMps = sqrt(GM/radiusM);

% eccentricity should be 0, :. circle
eccentricity(radiusM,velocityMps)


v1 = velocityMps;
r1 = radiusFromEarthCenterM(burnoutAltKM);
y1 = angleAtBurnout;

% eq(4.25)
c = (2*GM) / (r1 * v1^2);
rootLarge = (-c + sqrt( c^2 -4*(1-c)*(-1 * sin(y1).^2))) / (2*(1-c));
rootSmall = (-c - sqrt( c^2 -4*(1-c)*(-1 * sin(y1).^2))) / (2*(1-c));

if(rootLarge < rootSmall)
    swap = rootLarge;
    rootLarge = rootSmall;
    rootSmall = swap;
end

% radius of apogee and perigee in metres from center of earth
RaM = r1*rootLarge
RpM = r1*rootSmall 

% altitude of apogee and perigee in km from surface of earth.
AaKM = RaM / 1000 - earthRadiusKM
ApKM = RpM / 1000 - earthRadiusKM

% eccentricity of the orbit
eccentricity(RpM,velocityMps)

% requires earthRadiusKM, earth radius in km
% @param altKM: desired altitude from surface of earth in km.
% @return the radius from the center of the earth to desired altitude in
% metres.
function r = radiusFromEarthCenterM(altKM)
    global earthRadiusKM;
    r = (earthRadiusKM + altKM) * 1000;
end

% eq(4.20)
% returns 0 for circular orbit.
% requires GM, gravity * mass of earth
% @param r: radius in metres from center of earth to the perigee
% @param v: velocity metres/second at the perigee
% @return the eccentricity of the orbit.
function e = eccentricity(r,v)
    global GM;
    e = sqrt((r*v^2/GM)-1);
end
