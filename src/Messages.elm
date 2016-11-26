module Messages exposing (..)

import Tacos.Messages as Tacos


type Msg
    = NoOp
    | UpdateTacos Tacos.Msg
