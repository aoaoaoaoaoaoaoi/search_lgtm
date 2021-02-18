port module Index exposing (main)

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
import Url.Parser as Url exposing ((</>), (<?>))
import Url.Parser.Query as Query

port setStorage : (String) -> Cmd msg
port getStorage : String -> Cmd msg
port resStorage : ((String, String) -> msg) -> Sub msg
port getLocation : String -> Cmd msg
port resLocation : ((String, String) -> msg) -> Sub msg

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
    , code : String
    }


type DataState
    = Init
    | Waiting
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init "" ""
    , getStorage "token")



-- UPDATE


type Msg
    = InputClientSecret String
    | Send
    | CheckToken
    | ReceiveCheckToken (Result Http.Error CheckTokenData)
    | Authorize
    | GetToken
    | Receive (String, String)
    | GetLocation
    | ReceiveLocation (String)


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

        CheckToken ->
            ( { model
                | dataState = Waiting
              }
            , Cmd.none
            )

        Authorize ->
            ( { model
                | dataState = Waiting
                , code = authorize model
              }
            , if model.code == "" then
                Cmd.none

              else
                Task.perform GetToken
            )

        GetToken ->
            ( { model
                | dataState = Waiting
              }
            , Cmd.none
            )
        Receive  (_, val) ->
            (model , checkToken val)

        ReceiveLocation  (paramCode, paramState) ->
            ({model | code = paramCode}, checkParam paramCode paramState)

checkToken : String -> Cmd Msg
checkToken token =
  if (token == "") then getLocation ""  else Cmd.none

checkParam : String -> String -> Cmd Msg
checkParam code state =
  if (code /= "" && state == "Pd3mSwgs") then Cmd.none{-トークンの取得-}  else Nav.load getAuthUrl


maybeStringToString : Maybe String -> String
maybeStringToString str =
    case str of
        Just value ->
            value

        Nothing ->
            ""


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
            , button [ disabled ((model.dataState == Waiting) || String.isEmpty (String.trim model.clientSecret)) ]
                [ text "Submit" ]
            ]
        ]



--DATA


type alias CheckTokenData =
    { test : Bool
    }
