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


port setStorage : String -> Cmd msg


port getStorage : String -> Cmd msg


port resStorage : (( String, String ) -> msg) -> Sub msg


port getLocation : String -> Cmd msg


port resLocation : (( String, String ) -> msg) -> Sub msg


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
    , progress : Progress
    , clientSecret : String
    , code : String
    }


type Progress
    = InCheckToken
    | InAuthorize
    | InGetToken
    | InLoaded Token
    | InFinish


type DataState
    = Init
    | Waiting
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init InCheckToken "" ""
    , getStorage "token"
    )



-- UPDATE


type Msg
    = InputClientSecret String
    | GetToken
    | Authorize
    | Receive ( String, String )
    | ReceiveLocation ( String, String )
    | PostCreated (Result Http.Error Token)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        InputClientSecret specifiedClientSecret ->
            ( { model
                | clientSecret = specifiedClientSecret
              }
            , Cmd.none
            )

        Authorize ->
            ( { model
                | dataState = Waiting
              }
            , Nav.load getAuthUrl
            )

        GetToken ->
            ( { model
                | dataState = Waiting
              }
            , getToken model
            )

        Receive ( _, val ) ->
            ( model, checkToken val )

        ReceiveLocation ( paramCode, paramState ) ->
            if paramCode /= "" && paramState == "Pd3mSwgs" then
                ( { model | progress = InCheckToken, code = paramCode }, Cmd.none )

            else
                ( { model | progress = InAuthorize }, Cmd.none )

        PostCreated (Ok post) ->
            ( { model | progress = InLoaded post }
            , Cmd.none
            )

        PostCreated (Err error) ->
            ( model
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ resStorage Receive
        , resLocation ReceiveLocation
        ]


checkToken : String -> Cmd Msg
checkToken token =
    if token == "" then
        getLocation ""

    else
        Cmd.none



{- token完了 -}


getToken : Model -> Cmd Msg
getToken model =
    Http.post
        { url = "https://qiita.com/api/v2/access_tokens"
        , body = Http.jsonBody (makeRequestParameter model)
        , expect = Http.expectJson PostCreated tokenDecoder
        }


makeRequestParameter : Model -> Encode.Value
makeRequestParameter model =
    Encode.object
        [ ( "client_id", Encode.string "190908c64f149924c34c7e381cf3faed0a6236c4" )
        , ( "client_secret", Encode.string model.clientSecret )
        , ( "code", Encode.string model.code )
        ]


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
        [ case model.progress of
            InCheckToken ->
                div [] []

            InAuthorize ->
                Html.form [ onSubmit Authorize ]
                    [ div [] [ text "この機能を使用するには、Qiitaとの連携が必要です。\n以下のボタンをクリックし、認証ページで許可してください。" ]
                    , button [ disabled (model.dataState == Waiting) ]
                        [ text "Submit" ]
                    ]

            InGetToken ->
                Html.form [ onSubmit GetToken ]
                    [ input
                        [ onInput InputClientSecret
                        , value model.clientSecret
                        ]
                        []
                    , button [ disabled ((model.dataState == Waiting) || String.isEmpty (String.trim model.clientSecret)) ]
                        [ text "Submit" ]
                    ]

            InLoaded token ->
                div [] []

            InFinish ->
                div [] []
        ]



--DATA


type alias Token =
    { token : String
    }


tokenDecoder : Decoder Token
tokenDecoder =
    D.map Token (D.field "token" D.string)
