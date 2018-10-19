function m = MassFuel(args)
    % args = [volumeInit,volumeConsumed,fuelDensity]
    volumeInit = args(1);
    volumeConsumed = args(2);
    fuelDensity = args(3);
    
    m = (volumeInit - volumeConsumed) * fuelDensity;
end