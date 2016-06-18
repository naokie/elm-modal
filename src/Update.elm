module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ShowModal ->
            let
                newModel =
                    { model | isModalOpen = True }
            in
            ( newModel, Cmd.none )

        HideModal ->
            let
                newModel =
                    { model | isModalOpen = False }
            in
            ( newModel, Cmd.none )
