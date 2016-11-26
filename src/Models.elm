module Models exposing (..)

import Tacos.Models as Tacos


type RequestedAction
    = OrderTacos
    | DestroyWorld
    | DestroyCountry


type alias Model =
    { isWorldDestroyed : Bool
    , tacos : Tacos.Model
    , requestedAction : Maybe RequestedAction
    }


model : Model
model =
    { isWorldDestroyed = False
    , tacos = Tacos.model
    , requestedAction = Nothing
    }
