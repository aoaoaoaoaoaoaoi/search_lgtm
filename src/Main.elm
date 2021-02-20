port module Main exposing (main)

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
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { dataState : DataState
    , progress : Progress
    , clientSecret : String
    , code : String
    , token : String
    }


type Progress
    = InCheckToken
    | InAuthorize
    | InGetToken
    | InLoadedArticleData ArticleData
    | InFinish


type DataState
    = Init
    | Waiting
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init InCheckToken "" "" ""
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
    | ReceiveArticleData (Result Http.Error ArticleData)


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
                ( { model | progress = InGetToken, code = paramCode }, Cmd.none )

            else
                ( { model | progress = InAuthorize }, Cmd.none )

        PostCreated (Ok post) ->
            ( { model | token = post.token }
            , setToken post.token
            )

        PostCreated (Err error) ->
            ( model
            , Cmd.none
            )

        ReceiveArticleData (Ok articleData) ->
            ( { model | progress = InLoadedArticleData articleData }, Cmd.none )

        ReceiveArticleData (Err e) ->
            ( { model | dataState = Failed e }, Cmd.none )


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
        getArticleData token


getToken : Model -> Cmd Msg
getToken model =
    Http.post
        { url = "https://qiita.com/api/v2/access_tokens"
        , body = Http.jsonBody (makeRequestParameter model)
        , expect = Http.expectJson PostCreated tokenDecoder
        }


setToken : String -> Cmd Msg
setToken token =
    Cmd.batch [ setStorage token, getArticleData token ]


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


getArticleData : String -> Cmd Msg
getArticleData token =
    Task.attempt ReceiveArticleData (getArticleDataTask token)


getArticleDataTask : String -> Task Http.Error ArticleData
getArticleDataTask token =
    Http.task
        { method = "POST"
        , headers =
            [ Http.header "Authorization" ("Bearer " ++ token)
            ]
        , url = "https://qiita.com/api/v2/graphql"
        , body = Http.jsonBody makeArticleRequestParameter
        , resolver = jsonResolver articleDataDecoder
        , timeout = Nothing
        }


makeArticleRequestParameter : Encode.Value
makeArticleRequestParameter =
    Encode.object
        [ ( "urlName", Encode.string "pirorirori_n712" )
        , ( "page", Encode.int 7 )
        , ( "per", Encode.int 40 )
        ]


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

            InLoadedArticleData articleData ->
                div [] [ text (Debug.toString articleData) ]

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


type alias ArticleData =
    { data : Data
    }


type alias Data =
    { user : User
    }


type alias User =
    { paginatedArticleLikes : PaginatedArticleLikes
    }


type alias PaginatedArticleLikes =
    { items : List Item
    }


type alias Item =
    { article : Article
    }


type alias Article =
    { url : String
    , title : String
    , tags : List Tag
    , author : Author
    }


type alias Author =
    { name : String
    , imageUrl : String
    }


type alias Tag =
    { name : String
    }


articleDataDecoder : Decoder ArticleData
articleDataDecoder =
    D.map
        ArticleData
        (D.field "data" dataDecoder)


dataDecoder : Decoder Data
dataDecoder =
    D.map
        Data
        (D.field "user" userDecoder)


userDecoder : Decoder User
userDecoder =
    D.map
        User
        (D.field "paginatedArticleLikes" paginatedArticleLikesDecoder)


paginatedArticleLikesDecoder : Decoder PaginatedArticleLikes
paginatedArticleLikesDecoder =
    D.map
        PaginatedArticleLikes
        (D.field "items" itemsDecoder)


itemsDecoder : Decoder (List Item)
itemsDecoder =
    D.map
        Item
        (D.field "article" articleDecoder)
        |> D.list


articleDecoder : Decoder Article
articleDecoder =
    D.map4 Article
        (D.field "linkUrl" D.string)
        (D.field "title" D.string)
        (D.field "tags" tagsDecoder)
        (D.field "author" authorDecoder)


authorDecoder : Decoder Author
authorDecoder =
    D.map2
        Author
        (D.field "urlName" D.string)
        (D.field "profileImageUrl" D.string)


tagsDecoder : Decoder (List Tag)
tagsDecoder =
    D.list tagDecoder


tagDecoder : Decoder Tag
tagDecoder =
    D.map
        Tag
        (D.field "name" D.string)
