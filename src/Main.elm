module Main exposing (main)

import Browser
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
    }


type DataState
    = Init
    | Waiting
    | LoadedArticleData ArticleData
    | Failed Http.Error


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Init
    , getArticleData
    )



-- UPDATE


type Msg
    = Send
    | ReceiveArticleData (Result Http.Error ArticleData)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Send ->
            ( { model
                | dataState = Waiting
              }
            , getArticleData
            )

        ReceiveArticleData (Ok articleData) ->
            ( { model | dataState = LoadedArticleData articleData }, Cmd.none )

        ReceiveArticleData (Err e) ->
            ( { model | dataState = Failed e }, Cmd.none )


getArticleData : Cmd Msg
getArticleData =
    Task.attempt ReceiveArticleData getArticleDataTask


getArticleDataTask : Task Http.Error ArticleData
getArticleDataTask =
    Http.task
        { method = "POST"
        , headers = [ Http.header "Content-Type" "application/json" ]
        , url = "https://qiita.com/api/v2/graphql"
        , body = Http.jsonBody makeRequestParameter
        , resolver = jsonResolver articleDataDecoder
        , timeout = Nothing
        }


getRequestParameter =
    Encode.encode 0 makeRequestParameter


makeRequestParameter : Encode.Value
makeRequestParameter =
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


view : Model -> Html msg
view model =
    div [] []



--DATA


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
