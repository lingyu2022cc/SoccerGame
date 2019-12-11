function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
    % Updates the player state and ball state by action rules
    % This is the function we can replace with different variants for
    % comparing different players 

    % Initializing stuff
    updatedPlayer = {[0 0],[0 0],players{3}};
    ballPosition = ball(1,:);
    allPlayerPositions = players{1};
    playerPosition = players{1}(indexOfPlayer,:);
    playerVelocity = players{2}(indexOfPlayer,1);
    team = players{3}(indexOfPlayer,1);
    % indexing players after distance to ball and goal
    if team == 0
        goalPosition = [60 0];
        teamIndex = find(players{3}(:,1) == 0);
    else
        goalPosition = [-60 0];
        teamIndex = find(players{3}(:,1) == 1);
    end
        teamPositions = allPlayerPositions(teamIndex,:);

    teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
    [~,Bsort] = sort(teamDistanceToBall); %Get the order
    teamBallIndex = teamIndex(Bsort);

    teamDistanceToGoal = vecnorm(teamPositions - goalPosition, 2, 2);
    [~,Gsort] = sort(teamDistanceToGoal); %Get the order
    teamGoalIndex = teamIndex(Gsort);
    closenessToGoal = find(teamGoalIndex == indexOfPlayer);
    
    goalKeeper = players{3}(indexOfPlayer,2);
    basePosition = [players{3}(indexOfPlayer,3) players{3}(indexOfPlayer,4)];
    
    if (ismember(indexOfPlayer, teamBallIndex(1:3)))
        teamBallIndex(1:3);
        moveTarget = ballPosition;
    else
        moveTarget = basePosition;
    end
    
    
    [newPlayerPosition, newPlayerAngle] = ...
        MovePlayer(playerPosition, moveTarget, playerVelocity, timeDelta);
    if (norm(newPlayerPosition - ball(1,:)) <= 1.01)
        if (closenessToGoal < 4)
            updatedBall = KickBall(newPlayerPosition, goalPosition, ball);
        else
            forwardPassIndex = teamGoalIndex(closenessToGoal - randi(2));
            forwardPassPosition = allPlayerPositions(forwardPassIndex,:);
            updatedBall = KickBall(newPlayerPosition, forwardPassPosition, ball);
        end
    else
        updatedBall = ball;
    end
    
    updatedPlayer{1} = newPlayerPosition;
    updatedPlayer{2} = [playerVelocity newPlayerAngle];
    updatedPlayer{3} = players{3}(indexOfPlayer,:);

end
