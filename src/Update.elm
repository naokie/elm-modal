module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        RequestConfirmation ->
            let
                newModel =
                    { model | isConfirmationRequested = True }
            in
            ( newModel, Cmd.none )

        ConfirmWorldDestruction ->
            let
                newModel =
                    { model
                        | isConfirmationRequested = False
                        , isWorldDestroyed = True
                    }
            in
            ( newModel, Cmd.none )

        AbortWorldDestruction ->
            let
                newModel =
                    { model | isConfirmationRequested = False }
            in
            ( newModel, Cmd.none )
