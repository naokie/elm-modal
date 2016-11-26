module Tacos.View exposing (modal, view)

import Html exposing (Attribute, Html, button, div, h3, input, label, p, text)
import Html.Attributes exposing (for, id, style, type_)
import Html.Events exposing (on, onClick)
import Json.Decode as Json
import Tacos.Messages exposing (Msg(..))
import Tacos.Models exposing (Model)


orderDescStyle : Attribute msg
orderDescStyle =
    style
        [ ( "margin", "0 0 8px 0" ) ]


orderInputStyle : Attribute msg
orderInputStyle =
    style
        [ ( "display", "block" )
        , ( "width", "100%" )
        , ( "line-height", "24px" )
        , ( "margin", "0 0 8px 0" )
        , ( "border", "1px solid rgba(0,0,0,0.3)" )
        ]


orderHeaderStyle : Attribute msg
orderHeaderStyle =
    style
        [ ( "padding", "12px" )
        , ( "margin", "0" )
        , ( "border-bottom", "1px solid rgba(0,0,0,0.3)" )
        ]


orderBodyStyle : Attribute msg
orderBodyStyle =
    style
        [ ( "paddin", "10px" ) ]


orderButtonStyle : Attribute msg
orderButtonStyle =
    style
        [ ( "display", "inline-block" )
        , ( "appearance", "none" )
        , ( "padding", "12px 16px" )
        , ( "color", "rgba(54,137,218)" )
        , ( "background", "transparent" )
        , ( "border", "none" )
        , ( "cursor", "pointer" )
        , ( "font-size", "1em" )
        ]


view : Model -> Html Msg
view model =
    div []
        [ button [ orderButtonStyle, onClick StartTacoOrder ]
            [ text "Order tacos!" ]
        , if model.totalOrdered > 0 then
            div []
                [ text ("Number of tacos ordered: " ++ toString model.totalOrdered) ]
          else
            div []
                [ text "No tacos orderd yed" ]
        ]


modal : Html Msg
modal =
    div []
        [ h3 [ orderHeaderStyle ]
            [ text "How many tacos would you like?" ]
        , div [ orderBodyStyle ]
            [ p [ orderDescStyle ]
                [ text "Please remember that each taco ordered carries a $1,000,000 surchager for taxpayers." ]
            , input [ id "order-input", type_ "number", onInputInt UpdateOrderCount, orderInputStyle ] []
            , button [ orderButtonStyle, onClick CancelOrder ]
                [ text "Cancel order" ]
            , button [ orderButtonStyle, onClick PlaceOrder ]
                [ text "Place order" ]
            ]
        ]


onInputInt : (Int -> msg) -> Attribute msg
onInputInt tagger =
    on "input" (Json.map tagger (Json.at [ "target", "valueAsNumber" ] Json.int))
