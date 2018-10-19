
clear
% forceGravity
earthRadius = 6378.14;
earthMass = 5.9737e+24;
gravity = 6.67259e-11;
forceGravity = ForceGravity(gravity,earthMass,earthRadius);


% forceFriction
airDensity = 1.225;
dragCoeff = 2; % 2-4
area = 1; %
fFriction = 0;

% massRocket
massShuttle = 1;
massFuel = 1;
massTank = 1;


% massFuel
ODensity = 1.14;
HDensity = 0.071;
OHRatio = 5.00;
fuelDensity = FuelDensity(OHRatio,ODensity,HDensity);
fuelVolumeInit = 

% initial horizontal velocity
earthPeriod = 24;
velocHorInit = VelocHorInit(earthRadius,earthPeriod);

% launch
launchAngle = pi/2;


% setup constants
function f = ForceGravity(G,Mp,r)    
    f = sqrt((G*Mp)/(r^2));
end

function p = FuelDensity(OHRatio,ODensity,HDensity)
    p = (OHRatio * ODensity + HDensity) / 6;
end

function v = VelocHorInit(bodyRadius, periodHours)
    v = (2 * pi * bodyRadius) / (periodHours * 60 * 60);% metres/second
end

