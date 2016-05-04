module DnD.UI.Dice
    ( widget
    , Action(..)
    ) where

import Signal exposing (Signal)

import Html exposing (Html, fromElement)
import Html.Events exposing (onClick)

import StartApp.Simple as App

import DnD.Data exposing (..)

type Action =
      NoAction

widget : List DieRoll -> App.Config (List DieRoll) Action
widget dieRolls =
    { model = dieRolls
    , view = view
    , update = update
    }

view : Signal.Address Action -> List DieRoll -> Html 
view address dieRolls =
    case dieRolls of
        [] -> Html.p [] [Html.text "No Dice have been rolled"]
        dieRolls ->
            Html.ul []
                <| List.map viewDieRoll dieRolls

viewDieRoll : DieRoll -> Html
viewDieRoll dieRoll =
    Html.li []
        [ Html.p []
            [ Html.text <| toString dieRoll.roll
            , Html.text " on a "
            , Html.text <| toString dieRoll.die
            ]
        , Html.p []
            [ Html.text <| rollType dieRoll.rollType
            , Html.text " of "
            , Html.text <| toString dieRoll.modifiedRoll
            ]
        ]

rollType : RollType -> String
rollType roll =
    case roll of
        AbilityCheck ability -> toString ability ++ " Check"
        SkillCheck skill     -> toString skill ++ " Check"
        OtherRoll            -> "Roll"

update : Action -> List DieRoll -> List DieRoll
update action dieRolls =
    case action of
        _ -> dieRolls
