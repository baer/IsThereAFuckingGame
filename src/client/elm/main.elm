module Rockies (..) where

import Date
import Date.Format exposing (format)
import HomeTeam
import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time)

-- This port maps to the initial value `appStartTime` passed into Elm
port appStartTime : Time


initialState =
  { appStartDate = Date.fromTime appStartTime
  , nextGame =
      { opposingTeam = "Calvin"
      , location = "My House"
      , date = Date.fromTime appStartTime
      }
  }


isGameToday now nextGame =
  (format "%d/%m/%Y" now) == (format "%d/%m/%Y" nextGame)


getGameLocation homeStadium nextGameLocation =
  if homeStadium == nextGameLocation then
    "home"
  else
    "away"


renderAnswer isGame location =
  if isGame then
    div
      [ attribute "class" "answer" ]
      [ text "YES"
      , h2 [] [ text ("It's a fucking " ++ location ++ " game") ]
      ]
  else
    div [ attribute "class" "answer" ] [ text "NO" ]


render isToday homeTeam opposingTeam date location =
  let
    nextGameTime =
      format "%l:%M %P" date

    nextGameDate =
      format "%A %m/%d/%Y" date
  in
    div
      [ attribute "class" "jumbotron content" ]
      [ h1 [] [ text ("Is there a fucking " ++ homeTeam ++ " game today?") ]
      , renderAnswer isToday location
      , h2 [] [ text (homeTeam ++ " vs. the fucking " ++ opposingTeam) ]
      , h3 [] [ text (nextGameTime ++ " " ++ nextGameDate ++ " @ " ++ initialState.nextGame.location) ]
      ]


main =
  let
    isGame =
      isGameToday initialState.appStartDate initialState.nextGame.date

    location =
      getGameLocation initialState.nextGame.location HomeTeam.homeStadium
  in
    render isGame HomeTeam.team initialState.nextGame.opposingTeam initialState.nextGame.date location
