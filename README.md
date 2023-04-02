# Football-Team-Database
![Picture1](https://user-images.githubusercontent.com/114187312/229380468-568fed3e-0abd-43d1-9563-c004f995e8b2.png)
## Database – Irish Football Division

Welcome to the Irish Football Division database repository. This database was created to help manage data of all Irish football divisions and competitions, providing users with an efficient and comprehensive data management system.

## Entities and Associated Descriptions:

team_table: This table holds information about registered teams in the FAI (Football Association of Ireland) and their attributes including the team ID, name, manager, stadium name, capacity, and city. The team ID is used as the primary key.
players: This table contains details of players with respect to their registered team, including player ID, team ID, name, jersey number, position, and date of birth. The primary key is the player ID.
competition: This table holds competition ID, competition names, and the primary key is the comp_id.
fixtures: This table holds match fixture details such as match ID, competition ID, home and away team, and fixture date. The primary key in the table is the match ID, while the foreign keys are the home/away team and competition ID.
match_summary: This table holds details of the match, including full-time match stats such as win, loss, draw, total cards given, goals scored and conceded. The primary keys are the match ID and team ID, and the foreign keys are the match ID and team ID.
event: This table is updated with every highlight of the game, including the player it happened to, the particular match, the time the event occurred and the event type (penalty, yellow card, red card).
