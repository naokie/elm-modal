module Update exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, RequestedAction(..))
import Tacos.Update as Tacos


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        y = Debug.log "Msg" (toString msg)
    in
        case msg of
            NoOp ->
                ( model, Cmd.none )

            UpdateTacos msg ->
                let
                    ( newTacos, _ ) =
                        Tacos.update msg model.tacos

                    newModel =
                        { model
                            | tacos = newTacos
                            , requestedAction =
                                if newTacos.isOrdering then
                                    Just OrderTacos
                                else
                                    Nothing
                        }
                in
                ( newModel, Cmd.none )
