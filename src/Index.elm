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
    , clientSecret : String
    }


type DataState
    = Init
    | Waiting
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init ""
    , Nav.load getAuthUrl
    )



-- UPDATE


type Msg
    = InputClientSecret String
    | Send


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InputClientSecret specifiedClientSecret ->
            ( { model
                | clientSecret = specifiedClientSecret
              }
            , Cmd.none
            )

        Send ->
            ( { model
                | dataState = Waiting
              }
            , Nav.load getAuthUrl
            )


checkToken model =
    model.location.href


getAuthUrl : String
getAuthUrl =
    "https://qiita.com/api/v2/oauth/authorize"
        ++ "?client_id="
        ++ "190908c64f149924c34c7e381cf3faed0a6236c4"
        ++ "&scope=read_qiita"
        ++ "&state="
        ++ "Pd3mSwgs"



--VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit Send ]
            [ input
                [ onInput InputClientSecret
                , value model.clientSecret
                ]
                []
            , button [ disabled ((model.dataState == Waiting) || String.isEmpty (String.trim model.clientId) || String.isEmpty (String.trim model.clientSecret) || String.isEmpty (String.trim model.clientState)) ]
                [ text "Submit" ]
            ]
        ]



--DATA
