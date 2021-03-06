
clear

% fThrust = 1;
% fFriction = 0;
% angle = pi/2;
% mRocket = 100;
% aGravity = 6.67e-11;
% 
% args = [fThrust,fFriction,angle,mRocket,aGravity];
% constantAccelVert = AccelVert(args);
% 
% args = [fThrust,fFriction,angle,mRocket];
% constantAccelHor = AccelHor(args);
% 
% constantAccelDir = AccelDir();

earthRadius = 6378.14;
earthMass = 5.9737e+24;
gravity = 6.67259e-11;

orbitRadius = (earthRadius + 400) * 1000;
bodyMass = earthMass;

args = [orbitRadius,gravity,bodyMass];
orbitVelocity = VelocOrbit(args);

angleAtBurnout = pi/2;
args = [orbitRadius,orbitVelocity,gravity,bodyMass,angleAtBurnout];
launchAngle = LaunchAngle(args);

rad2deg(launchAngle)


