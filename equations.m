%
% Using brandon's equations
%

% forceGravity
earthRadius = 6371; %6378.14?
earthMass = 5.972e+24;
gravity = 6.67e-11;

% forceFriction
airDensity = 1.225;
cDrag = 2; % 2-4
area = 1; % 

% massRocket


% massFuel
ODensity = 1.14;
HDensity = 0.071;
OHRatio = 5.00;

% volumeConsumed






% setup constants
function f = forceGravity(G,Mp,r)    
    f = sqrt((G*Mp)/(r^2));
end

function p = fuelDensity(OHRatio,ODensity,HDensity)
    p = (OHRatio * ODensity + HDensity) / 6;
end

function v = velocHorInit(bodyRadius, periodHours)
    v = (2 * pi * bodyRadius) / (periodHours * 60 * 60);% metres/second
end

% simulink functions
function f = forceFriction(cDrag, airDensity, velocity, area)
    %f = Ap*v;
    f = 0.5 * cDrag * airDensity * velocity * area;
end

function m = massRocket(mShuttle,mTank,mFuel)
    m = mShuttle;
    if( mFuel > 0)
        m = m + mTank + mFuel;
    end
end

function m = massFuel(volumeInit,volumeConsumed,fuelDensity)
    m = (volumeInit - volumeConsumed) * fuelDensity;
end

function a = accelVert(fThrust,fFriction,angle,mRocket,aGravity)
    a = ((fThrust * sin(angle) - fFriction ) / mRocket ) - aGravity;
end

function a = accelHor(fThrust,fFriction,angle,mRocket)
    a = ((fThrust * cos(angle) - fFriction ) / mRocket )
end

function v = velocDir(vVert,vHor)
    v = sqrt(vVert^2 + vHor^2);
end


% can use simulink components
function v = volumeConsumed(consumptionRate,time)
    v = consumptionRate * time;
end

function f = forceThrust(mFuel, fuelRate, K)
    f = 0;
    if( mFuel > 0)
        f = K*fuelRate;
    end
end

function v = velocVert(aVert)
    v = d/dt avert;
end

function v = velocHor(aHor)
    v = d/dt aHor;
end

function h = height(vVert,time)
    h = vVert * time;
end





