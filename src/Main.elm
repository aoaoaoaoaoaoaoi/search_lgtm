module Main exposing (main)

import Browser
import Html exposing (..)
import Json.Decode as D exposing (Decoder)
import List exposing (..)


payload =
    """
{
 "data": {
  "user": {
   "paginatedArticleLikes": {
    "items": [
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "Hljc2syxn/3hwaethOinacdGXGk8s71H",
       "createdAt": "2017-09-19T15:21:24Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 58,
       "linkUrl": "https://qiita.com/oo2kazuma/items/015274769744545dd081",
       "title": "Linux OSの種類とバージョンの調べ方",
       "uuid": "015274769744545dd081",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/35095/profile-images/1473686603",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F35095%2Fprofile-images%2F1473686603?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=6e4d7fc600bf92fcef5fb2a659f4c36f",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F35095%2Fprofile-images%2F1473686603?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=689db9b6f946ae465551ba92b77ce42a",
        "urlName": "oo2kazuma",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Linux",
         "urlName": "linux",
         "__typename": "Tag"
        },
        {
         "name": "Debian",
         "urlName": "debian",
         "__typename": "Tag"
        },
        {
         "name": "CentOS",
         "urlName": "centos",
         "__typename": "Tag"
        },
        {
         "name": "Ubuntu",
         "urlName": "ubuntu",
         "__typename": "Tag"
        },
        {
         "name": "redhat",
         "urlName": "redhat",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "7MQ7hwFKh8nqHAFrRRb3Yhld1+unnJdkjQ==",
       "createdAt": "2020-04-01T05:32:57Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 2,
       "linkUrl": "https://qiita.com/pyon_kiti_jp/items/fe7c48410063c563d753",
       "title": "Ubuntuでrmすると、Text file busyで削除ができない、トラブルシューティング",
       "uuid": "fe7c48410063c563d753",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/94029/profile-images/1521535647",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F94029%2Fprofile-images%2F1521535647?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=560c651cf16529a33d23f3670f25167d",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F94029%2Fprofile-images%2F1521535647?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=e1496e1bf04d6e60aa8354e5ff8a40c8",
        "urlName": "pyon_kiti_jp",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Ubuntu",
         "urlName": "ubuntu",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     }
    ]
   }
  }
 }
}
"""


main =
    D.decodeString articleDataDecoder payload
        |> Debug.toString
        |> text



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
    { items : Items
    }


type alias Items =
    { articles : List Article
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


itemsDecoder : Decoder Items
itemsDecoder =
    D.map
        Items
        (D.field "article" articlesDecoder)



{--articlesDecoder : Decoder (List Article)
articlesDecoder =
    D.list articleDecoder
--}


articlesDecoder : Decoder (List Article)
articlesDecoder =
    D.map4 Article
        (D.field "linkUrl" D.string)
        (D.field "title" D.string)
        (D.field "tags" tagsDecoder)
        (D.field "author" authorDecoder)
        |> D.list


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
