---
output:
  html_document: default
  pdf_document: default
---
## Data Dictionary for HW02 `shots_data.csv`

Here's the description of the R objects in `shots_data.csv`:

- `team_name`: the name of each team.
- `game_date`: the date at which the game was held. 
- `period`: an NBA game is divided in 4 periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game).
- `minutes_remaining`: the amount of time in minutes that remained to be played in a given period.
- `seconds_remaining`: the amount of time in seconds that remained to be played in a given period.
- `shot_made_flag`: indicates whether a shot was made (y) or missed (n).
- `action_type`: the basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer.
- `shot_type`: indicates whether a shot is a 2-point field goal, or a 3-point field goal.
- `shot_distance`: distance to the basket (measured in feet).
- `x,y`: the court coordinates (measured in inches) where a shot occurred .

| Object             | Data Type | Class of Variable |
|:-------------------|:----------|-------------------|
| `team_name`        | character | qualitative       |
| `game_date`        | real      | quantitative      |
| `period`           | integer   | quantitative      |
| `minute_remaining` | integer   | quantitative      |
| `seconds_remaining`| integer   | quantitative      |
| `shot_made_flag`   | logical   | qualitative       |
| `action_type`      | character | qualitative       |
| `shot_type`        | character | qualitative       |
| `shot_distance`    | real      | quantiattive      |
| `x`                | real      | quantitative      |
| `y`                | real      | quantitative      |

Attribute Information:

'data.frame':	4334 obs. of  15 variables:

1. name: "Andre Iguodala" "Andre Iguodala" "Andre Iguodala" "Andre Iguodala" ...
2. team_name: "Golden State Warriors" "Golden State Warriors" "Golden State Warriors" ...
3. game_date: "3/24/17" "11/3/16" "10/25/16" "11/3/16" ...
4. season: 2016 2016 2016 2016 2016 2016 2016 2016 2016 2016 ...  
5. period: 3 2 2 2 4 3 4 4 2 2 ...
6. minutes_remaining: 2 10 0 11 0 5 7 9 0 0 ...
7. seconds_remaining: 35 51 6 10 32 30 57 31 23 2 ...
8. shot_made_flag: "missed shot" "missed shot" "missed shot" "missed shot" ...
9. action_type: "Alley Oop Dunk Shot" "Alley Oop Dunk Shot" "Alley Oop Dunk Shot" "Alley Oop Layup shot" ... 
10. shot_type: "2PT Field Goal" "2PT Field Goal" "2PT Field Goal" "2PT Field Goal" ...
11. shot_distance: 0 1 0 1 0 0 0 0 0 0 ...
12. oponent: "Sacramento Kings""Oklahoma City Thunder" "San Antonio Spurs" "Oklahoma City Thunder" ...
13. x: 0 -12 0 -1 0 0 0 0 0 0 ...     
14. y: 1 13 1 11 1 1 1 1 1 1 ...
15. minute: 34 14 24 13 48 31 41 39 24 24 ...    