module View.Main exposing (view)

import Html exposing (Attribute, Html, button, div, h2, li, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (model)
import Tacos.View as Tacos


mainBodyStyle : Attribute msg
mainBodyStyle =
    style
        [ ( "padding", "10px" )
        , ( "margin", "0 auto" )
        , ( "width", "80%" )
        , ( "max-width", "1200px" )
        ]


outlineButtonStyle : Attribute msg
outlineButtonStyle =
    style
        [ ( "padding", "12px 16px" )
        , ( "background", "rgb(255,255,255" )
        , ( "color", "rgb(54,137,218" )
        , ( "border", "2px solid rgb(54,137,218" )
        , ( "cursor", "pointer" )
        , ( "font-size", "1em" )
        ]


view : Html Msg
view =
    div [ mainBodyStyle ]
        [ h2 [] [ text "What would you like to do today?" ]
        , ul []
            [ li []
                [ Html.map UpdateTacos (Tacos.view model.tacos) ]
            ]
        ]
