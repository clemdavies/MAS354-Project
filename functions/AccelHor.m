function a = AccelHor(args)
    % args = [fThrust,fFriction,angle,mRocket]
    fThrust = args(1);
    fFriction = args(2);
    angle = args(3);
    mRocket = args(4);
    
    a = ((fThrust * cos(angle) - fFriction ) / mRocket );
end

