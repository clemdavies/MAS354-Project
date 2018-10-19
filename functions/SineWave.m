function y = SineWave(args)
    t = args(1);
    period = args(2);
    y = sin(t*pi/period);
end

