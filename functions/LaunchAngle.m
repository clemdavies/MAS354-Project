function angle = LaunchAngle(args)
    %args = [orbitRadius,orbitVelocity,gravity,bodyMass,angleAtBurnout]
    
    r = args(1);
    v = args(2);
    GM = args(3) * args(4);
    y = args(5);
    
    angle = atan( (r*v^2/GM)*sin(y)*cos(y)/ ( (r*v^2/GM)* sin(y)^2  - 1));
end

