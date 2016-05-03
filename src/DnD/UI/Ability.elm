module DnD.UI.Ability
    ( widget
    , Action(..)
    ) where

import Signal exposing (Signal)

import Html exposing (Html, fromElement)

import StartApp.Simple as App

import DnD.Data exposing (..)
import DnD.Ability as Ability

type Action =
      NoAction
    | Roll Ability

widget : Character -> App.Config Character Action
widget character =
    { model = character
    , view = view
    , update = update
    }

view : Signal.Address Action -> Character -> Html 
view address character = 
    let
        abilities = [Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma]
        modifiers = List.map (Ability.modifier character) abilities
    in
        Html.dl []
        <| List.concat
        <| List.map2 viewModifier
            abilities
            modifiers

viewModifier : Ability -> Int -> List Html
viewModifier ability value =
    [ Html.dt []
        [ Html.text <| toString ability]
    , Html.dd []
        [ if value > 0 then
              Html.text "+"
          else
              Html.text ""
        , Html.text <| toString value
        ]
    ]

update : Action -> Character -> Character
update action character =
    case action of
        _ -> character
