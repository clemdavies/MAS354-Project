function m = MassRocket(args)
    % args = [mShuttle,mTank,mFuel]
    mShuttle = args(1);
    mTank = args(2);
    mFuel = args(3);
    
    m = mShuttle;
    if( mFuel > 0)
        m = m + mTank + mFuel;
    end
end

