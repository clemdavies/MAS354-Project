function f = ForceFriction(args)
    %args = [cDrag, airDensity, velocity, area]
    cDrag = args(1);
    airDensity = args(2);
    velocity = args(3);
    area = args(4);
    
    f = 0.5 * cDrag * airDensity * velocity * area;
end
