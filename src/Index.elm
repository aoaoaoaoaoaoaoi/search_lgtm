module Index exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as D exposing (Decoder)
import Json.Encode as Encode
import List exposing (..)
import Task exposing (..)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { dataState : DataState
    , clientId : String
    , clientSecret : String
    , clientState : String
    }


type DataState
    = Init
    | Waiting
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init "" "" ""
    , Cmd.none
    )



-- UPDATE


type Msg
    = InputClientId String
    | InputClientSecret String
    | InputClientState String
    | Send


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InputClientId specifiedClientId ->
            ( { model
                | clientId = specifiedClientId
              }
            , Cmd.none
            )

        InputClientSecret specifiedClientSecret ->
            ( { model
                | clientSecret = specifiedClientSecret
              }
            , Cmd.none
            )

        InputClientState specifiedClientState ->
            ( { model
                | clientState = specifiedClientState
              }
            , Cmd.none
            )

        Send ->
            ( { model
                | dataState = Waiting
              }
            , Nav.load (getAuthUrl model)
            )


checkToken model =
    model.location.href


getAuthUrl : Model -> String
getAuthUrl model =
    "https://qiita.com/api/v2/oauth/authorize"
        ++ "?client_id="
        ++ model.clientId
        ++ "&scope=read_qiita"
        ++ "&state="
        ++ model.clientState



--VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Send ]
            [ input
                [ onInput InputClientId
                , value model.clientId
                ]
                []
            , input
                [ onInput InputClientSecret
                , value model.clientSecret
                ]
                []
            , input
                [ onInput InputClientState
                , value model.clientState
                ]
                []
            , button [ disabled ((model.dataState == Waiting) || String.isEmpty (String.trim model.clientId) || String.isEmpty (String.trim model.clientSecret) || String.isEmpty (String.trim model.clientState)) ]
                [ text "Submit" ]
            ]
        ]



--DATA
