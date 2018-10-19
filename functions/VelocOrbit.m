function v = VelocOrbit(args)
    %args = [orbitRadius,gravity,bodyMass]
    r = args(1);
    GM = args(2) * args(3);
    
    v = sqrt(GM/r);    
end

