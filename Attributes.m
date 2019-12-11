function attributes = Attributes()

team = [0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1];
isGoalKeeper = [0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1];
xPositionsTeam1 = [-45 -45 -45 -1 0 0 25 25 45 45 -60];
yPositionsTeam1 = [-30 0 30 -30 0 30 25 -25 -20 20 0];
xPositionsTeam2 = [45 45 45 0 1 0 -25 -25 -45 -45 60];
yPositionsTeam2 = [-30 0 30 -30 0 30 25 -25 -20 20 0];
xBasePosition = [xPositionsTeam1 xPositionsTeam2];
yBasePosition = [yPositionsTeam1 yPositionsTeam2];
              
attributes = [team; ...
              isGoalKeeper; ...
              xBasePosition; ...
              yBasePosition];

attributes = attributes';

end