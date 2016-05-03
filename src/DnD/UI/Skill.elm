module DnD.UI.Skill
    ( widget
    , Action(..)
    ) where

import Signal exposing (Signal)

import Html exposing (Html, fromElement)
import Html.Events exposing (onClick)

import StartApp.Simple as App

import DnD.Data exposing (..)
import DnD.Skill as Skill

type Action =
      NoAction
    | Roll Skill

widget : Character -> App.Config Character Action
widget character =
    { model = character
    , view = view
    , update = update
    }

view : Signal.Address Action -> Character -> Html 
view address character = 
    let
        skills = [Athletics, Acrobatics, SleightOfHand, Stealth, Arcana, History, Investigation, Nature, Religion, AnimalHandling, Insight, Medicine, Perception, Survival, Deception, Intimidation, Performance, Persuasion]
        modifiers = List.map (Skill.modifier character) skills
    in
        Html.dl []
        <| List.concat
        <| List.map2 (viewModifier address)
            skills
            modifiers

viewModifier : Signal.Address Action -> Skill -> Int -> List Html
viewModifier address skill value =
    [ Html.dt []
        [ Html.text <| toString skill]
    , Html.dd []
        [ if value > 0 then
              Html.text "+"
          else
              Html.text ""
        , Html.text <| toString value
        ]
    , Html.button [onClick address <| Roll skill]
        [ Html.text <| toString skill
        , Html.text " Check"]
    ]

update : Action -> Character -> Character
update action character =
    case action of
        _ -> character
