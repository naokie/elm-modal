module Tacos.Models exposing (..)


type alias Model =
    { isOrdering : Bool
    , currentOrder : Int
    , totalOrdered : Int
    }


model : Model
model =
    { isOrdering = False
    , currentOrder = 0
    , totalOrdered = 0
    }
