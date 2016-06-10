module Main exposing (..)

import Html exposing (Attribute, Html, div, h1, text)
import Html.App as Html
import Html.Attributes exposing (style)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type Msg
    = NoOp


type alias Model =
    { msg : String
    , isModalOpen : Bool
    }


initialModel : Model
initialModel =
    { msg = "Hello World"
    , isModalOpen = False
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


makeStyle : Attribute msg
makeStyle =
    style
        [ ( "background-color", "rgba(0,0,0,0.3)" )
        , ( "position", "fixed" )
        , ( "top", "0" )
        , ( "left", "0" )
        , ( "width", "100%" )
        , ( "height", "100%" )
        ]


modalStyle : Attribute msg
modalStyle =
    style
        [ ( "backgroud-color", "rgba(255,255,255,1.0)" )
        , ( "position", "absolute" )
        , ( "top", "50%" )
        , ( "left", "50%" )
        , ( "height", "auto" )
        , ( "max-height", "80%" )
        , ( "width", "700px" )
        , ( "max-width", "95%" )
        , ( "padding", "10px" )
        , ( "border-radius", "3px" )
        , ( "box-shadow", "1px 1px 5px rgba(0,0,0,0.5)" )
        , ( "transform", "translate(-50%, -50%)" )
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.msg ]
        , div [ makeStyle ]
            [ div [ modalStyle ]
                [ text "Hey look, a modal!" ]
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
