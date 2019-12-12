function updatedBall = KickBall(playerPosition, target, ball, timeDelta)

    targetVector = (target - playerPosition);
    distance = norm(targetVector);
    inaccuracy = (distance + ball(2,1)/4)/30;
    xError = normrnd(0, inaccuracy);
    yError = normrnd(0, inaccuracy);
    targetVector = targetVector + [xError yError];
    unitTargetVector = targetVector/norm(targetVector);
    [xBall,yBall] = pol2cart(ball(3,2), ball(3,1));

    kickForce = 4;
    xBall = xBall + unitTargetVector(1)*kickForce/timeDelta;
    yBall = yBall + unitTargetVector(2)*kickForce/timeDelta;
    
    updatedBall = ball;
    [updatedBall(3,2), updatedBall(3,1)] = cart2pol(xBall, yBall);

end