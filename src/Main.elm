module Main exposing (..)

import Html.App as Html
import Messages exposing (Msg)
import Models exposing (Model, model)
import Update exposing (update)
import View exposing (view)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
