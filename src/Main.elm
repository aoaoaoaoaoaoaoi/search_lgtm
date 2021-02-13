module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as D exposing (Decoder)
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
    }


type DataState
    = Init
    | Waiting
    | LoadedArticleData (List Article)
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init
    , getArticleData
    )



-- UPDATE


type Msg
    = Send
    | ReceiveArticleData (Result Http.Error (List Article))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Send ->
            ( { model
                | dataState = Waiting
              }
            , getArticleData
            )

        ReceiveArticleData (Ok Article) ->
            ( { model | dataState = LoadedArticleData article }, Cmd.none )

        ReceiveArticleData (Err e) ->
            ( { model | dataState = Failed e }, Cmd.none )



getArticleData : Cmd Msg
getArticleData =
    Task.attempt ReceiveArticleData getArticleDataTask


getArticleDataTask : Task Http.Error Article
getArticleDataTask =
    Http.task
        { method = "POST"
        , headers = []
        , url = ""
        , body = Http.emptyBody
        , resolver = jsonResolver articlesDecoder
        , timeout = Nothing
        }


jsonResolver : D.Decoder a -> Http.Resolver Http.Error a
jsonResolver decoder =
    Http.stringResolver <|
        \response ->
            case response of
                Http.BadUrl_ url ->
                    Err (Http.BadUrl url)

                Http.Timeout_ ->
                    Err Http.Timeout

                Http.NetworkError_ ->
                    Err Http.NetworkError

                Http.BadStatus_ metadata body ->
                    Err (Http.BadStatus metadata.statusCode)

                Http.GoodStatus_ metadata body ->
                    case D.decodeString decoder body of
                        Ok value ->
                            Ok value

                        Err err ->
                            Err (Http.BadBody (D.errorToString err))



--VIEW


view : Model -> Html msg
view model =
    div [] []



--DATA

type alias Article =
    { url : String
    , title : String
    , tag : String
    , userName : String
    , iconImageUrl : String
    }


articlesDecoder : Decoder (List Repository)
articlesDecoder =
    D.list articleDecoder


articleDecoder : Decoder Article
articleDecoder =
    D.map5 Repository
        (D.field "name" D.string)
        (D.field "private" D.bool)
        (D.maybe (D.field "description" D.string))
        (D.field "fork" D.bool)
        (D.field "url" D.string)