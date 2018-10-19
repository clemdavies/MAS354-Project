function a = AccelVert(args)
    %args = [fThrust,fFriction,angle,mRocket,aGravity]
    fThrust = args(1);
    fFriction = args(2);
    angle = args(3);
    mRocket = args(4);
    aGravity = args(5);
    
    a = ((fThrust * sin(angle) - fFriction ) / mRocket ) - aGravity;
end

