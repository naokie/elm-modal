module View exposing (view)

import Html exposing (Attribute, Html, div)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (Model)
import View.Header as Header
import View.Main as Main
import View.Modal as Modal


mainContentStyle : Attribute msg
mainContentStyle =
    style
        [ ( "position", "relative" )
        , ( "background-color", "rgb(255,255,255)" )
        , ( "margin", "0" )
        ]


view : Model -> Html Msg
view model =
    div [ mainContentStyle ]
        [ Header.view
        , Main.view
        , Modal.view model
        ]
