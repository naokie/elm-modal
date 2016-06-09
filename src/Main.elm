module Main exposing (..)

import Html.App as Html
import Html exposing (Html, div, text)

main: Program Never
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type Msg =
  NoOp

type alias Model =
  { msg : String
  }

initialModel : Model
initialModel =
  { msg = "Hello World"
  }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  (model, Cmd.none)

view : Model -> Html Msg
view model =
  div [] [ text model.msg ]

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
