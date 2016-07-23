module View exposing (view)

import Html exposing (Attribute, Html, div, h2, text)
import Html.Attributes exposing (style)
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


deathScreenStyle : Attribute msg
deathScreenStyle =
    style
        [ ( "position", "fixed" )
        , ( "top", "0" )
        , ( "left", "0" )
        , ( "background-color", "rgb(0,0,0)" )
        , ( "color", "rgb(255,0,0)" )
        , ( "height", "100%" )
        , ( "width", "100%" )
        ]


deathHeaderStyle : Attribute msg
deathHeaderStyle =
    style
        [ ( "position", "absolute" )
        , ( "top", "50%" )
        , ( "left", "50%" )
        , ( "margin-right", "-50%" )
        , ( "transform", "translate(-50%, -50%)" )
        ]


view : Model -> Html Msg
view model =
    case model.isWorldDestroyed of
        False ->
            div [ mainContentStyle ]
                [ Header.view
                , Main.view
                , Modal.view model
                ]

        True ->
            div [ deathScreenStyle ]
                [ h2 [ deathHeaderStyle ]
                    [ text "The world has been destroyed. Have a nice day :)" ]
                ]
