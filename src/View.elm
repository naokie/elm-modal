module View exposing (view)

import Html exposing (Attribute, Html, button, div, h1, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (Model)


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
        [ ( "background-color", "rgba(255,255,255,1.0)" )
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
        , button [ onClick ShowModal ]
            [ text "Show modal" ]
        , modalView model
        ]


modalView : Model -> Html Msg
modalView model =
    case model.isModalOpen of
        True ->
            div [ makeStyle ]
                [ div [ modalStyle ]
                    [ text "Hey look, a modal!"
                    , button [ onClick HideModal ]
                        [ text "Ok, I got it!" ]
                    ]
                ]

        False ->
            div [] []
