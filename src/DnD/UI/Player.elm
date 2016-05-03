module DnD.UI.Player
    ( widget
    ) where

import Random
import Signal exposing (Signal)

import Html exposing (Html, fromElement)
import Html.Events exposing (onClick)

import StartApp.Simple as App

import DnD.Data exposing (..)
import DnD.Dice as Dice
import DnD.Ability as Ability

--import DnD.UI.Dice as DiceUI
import DnD.UI.Ability as AbilityUI

type alias Model =
    { character : Character
    , seed : Random.Seed
    , dieRolls : List DieRoll
    }

type Action =
      NoAction
    | AbilityAction AbilityUI.Action

widget : Character -> App.Config Model Action
widget character =
    { model = model character 
    , view = view
    , update = update
    }

model : Character -> Model
model character =
    { character = character
    , seed = Random.initialSeed 0
    , dieRolls = []
    }

view : Signal.Address Action -> Model -> Html
view address model =
    let
        abilityView = (AbilityUI.widget model.character).view
        abilityAddress = Signal.forwardTo address AbilityAction
    in
        Html.div []
        [ abilityView abilityAddress model.character
        , Html.text <| toString model.dieRolls
        ]

update : Action -> Model -> Model
update action model =
    case action of
        AbilityAction (AbilityUI.Roll ability) ->
            let
                dieRoll = {die = D20, roll = roll, modifiedRoll = abilityRoll}
                (roll, seed) = Random.generate Dice.d20 model.seed
                (abilityRoll, seed') = Random.generate abilityCheck model.seed
                abilityCheck = Ability.check model.character ability
            in
                { model |
                  dieRolls = [dieRoll]
                , seed = seed
                }
        _ -> model
