function v = VelocDir(args)
    % args = [vVert,vHor,angle]
    
    vVert = args(1);
    vHor = args(2);
    angle = args(3);
    
    if(vVert == 0)
        v = vHor / cos(angle);
    else
        v = vVert / sin(angle);
    end
    
end

