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
       "encryptedId": "Hljc2syxn/3hwaethOinacdGXGk8s71H--p3kUYfN6sRShLJBe--6SqLvqvyCUtLp6w58d9HMg==",
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
       "encryptedId": "7MQ7hwFKh8nqHAFrRRb3Yhld1+unnJdkjQ==--o1VNfyWaBc7DcORo--f/NE5anC6P0bIvuS0uTMbw==",
       "createdAt": "2020-04-01T05:32:57Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 2,
       "linkUrl": "https://qiita.com/pyon_kiti_jp/items/fe7c48410063c563d753",
       "title": "Ubuntuでrmすると、"Text file busy"で削除ができない、トラブルシューティング",
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
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "Larvus2xX6tL+3ABE6/FGZ1Cmk4LXfNXvA==--Sm/EBSkq0wf3axjM--OPkjoF2k2td7CZs81OkFZw==",
       "createdAt": "2020-04-10T02:01:58Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 3,
       "linkUrl": "https://qiita.com/yuri9129/items/5e9fd92733ba2547d610",
       "title": "Docker Toolboxでマウントするディレクトリを追加する",
       "uuid": "5e9fd92733ba2547d610",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://avatars2.githubusercontent.com/u/28744539?v=3",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars2.githubusercontent.com%2Fu%2F28744539%3Fv%3D3?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=a914f5be7624a7868b68635a7cf6bad4",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars2.githubusercontent.com%2Fu%2F28744539%3Fv%3D3?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=c7159f56892e26c1c72a2187c425025c",
        "urlName": "yuri9129",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "dockertoolbox",
         "urlName": "dockertoolbox",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "GPupgVikIuFm/VhRlGT6av7PseOoB1/BcQ==--l5Z2GSoEtq7TQMap--JRwzRrVLi43wFEnvFf6FaQ==",
       "createdAt": "2020-01-13T13:11:41Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 10,
       "linkUrl": "https://qiita.com/hotaimo/items/0a028480c94f003977ff",
       "title": "Docker Toolboxでvolumesでマウントができない場合の対策",
       "uuid": "0a028480c94f003977ff",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://s3-ap-northeast-1.amazonaws.com/qiita-image-store/0/566554/1682cc89c26c9db6dd692479925887f37f1394c7/x_large.png?1593327707",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fs3-ap-northeast-1.amazonaws.com%2Fqiita-image-store%2F0%2F566554%2F1682cc89c26c9db6dd692479925887f37f1394c7%2Fx_large.png%3F1593327707?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=b4abb38db19952bded4450e3945e0605",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fs3-ap-northeast-1.amazonaws.com%2Fqiita-image-store%2F0%2F566554%2F1682cc89c26c9db6dd692479925887f37f1394c7%2Fx_large.png%3F1593327707?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=ec0a20ede156e989b82532956bd0490c",
        "urlName": "hotaimo",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "docker-compose",
         "urlName": "docker-compose",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "P0IgGJHZTOTH95VyQ2WEVio6WTEGRCVp--f6MlS3RLfn54zNuk--AQCnkFFfixnN3upHo3M3tQ==",
       "createdAt": "2017-05-04T09:34:52Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 31,
       "linkUrl": "https://qiita.com/k7tak29/items/993ba3af8b0ac62a02c5",
       "title": "DockerfileでNginxの起動とログのローテーションまで",
       "uuid": "993ba3af8b0ac62a02c5",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://gravatar.com/avatar/b8889d20ee3859853520aaa1d40319d6?d=https%3A%2F%2Fidenticons.github.com%2Fbebd68e63cbdc233df22236e114318af.png&r=x",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fgravatar.com%2Favatar%2Fb8889d20ee3859853520aaa1d40319d6%3Fd%3Dhttps%253A%252F%252Fidenticons.github.com%252Fbebd68e63cbdc233df22236e114318af.png%26r%3Dx?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=943bd623b24f757539ead3e6b3813dd5",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fgravatar.com%2Favatar%2Fb8889d20ee3859853520aaa1d40319d6%3Fd%3Dhttps%253A%252F%252Fidenticons.github.com%252Fbebd68e63cbdc233df22236e114318af.png%26r%3Dx?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=1b0a26ad47b4df2c67f1f0a1f58496c6",
        "urlName": "k7tak29",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "nginx",
         "urlName": "nginx",
         "__typename": "Tag"
        },
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "dockerfile",
         "urlName": "dockerfile",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "22OnBVx+r69XrM/4u/7zWRZluxI3Z8kB--Jd/YGxSGg9rsQAoG--yAzZk5MWn8ogJD52zJIxHw==",
       "createdAt": "2018-09-05T11:51:13Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 58,
       "linkUrl": "https://qiita.com/k7a/items/23d909ffeea3bab7dfcb",
       "title": "[Unity 2018.2] AssetBundleのキャッシュを完全に理解する",
       "uuid": "23d909ffeea3bab7dfcb",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/97014/profile-images/1537175383",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F97014%2Fprofile-images%2F1537175383?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=9ac6ff445126a58c207abc066f9d4844",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F97014%2Fprofile-images%2F1537175383?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=6843ed18a2c69da1e94be4ed1ae219b8",
        "urlName": "k7a",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        },
        {
         "name": "AssetBundle",
         "urlName": "assetbundle",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "4ITjcbW1XbWfl+saOEpb7quqUmopN4bv1w==--eoQB6ChQhKK8/5oz--X2+V0XY0lBYWL7h47orTQg==",
       "createdAt": "2020-12-10T15:00:21Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 116,
       "linkUrl": "https://qiita.com/Yutaka_Nakano/items/ee1d507e18f25d00b2f3",
       "title": "クラスタのノード欠損を復旧しようとしてクラスタを丸ごと落とした話",
       "uuid": "ee1d507e18f25d00b2f3",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Flh3.googleusercontent.com%2F-XdUIqdMkCWA%2FAAAAAAAAAAI%2FAAAAAAAAAAA%2F4252rscbv5M%2Fphoto.jpg%3Fsz%3D50?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=eb716cf22e265688af4fa353bb96766c",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Flh3.googleusercontent.com%2F-XdUIqdMkCWA%2FAAAAAAAAAAI%2FAAAAAAAAAAA%2F4252rscbv5M%2Fphoto.jpg%3Fsz%3D50?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=3e52939cde81e2323ac22e5fa9b3e1e7",
        "urlName": "Yutaka_Nakano",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "AWS",
         "urlName": "aws",
         "__typename": "Tag"
        },
        {
         "name": "EC2",
         "urlName": "ec2",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "D+nfAxtZqFNsInw8Oxg4KCEp+LnxvtdcLw==--uFtzPYfBnkx40aja--2Wh97oVbdZSwZs3tUoYdHQ==",
       "createdAt": "2020-03-13T09:31:46Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 5,
       "linkUrl": "https://qiita.com/colorrabbit/items/1026799d21441b596a43",
       "title": "docker-compose upをしてもプロセスが終了してしまうことへの対応",
       "uuid": "1026799d21441b596a43",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/18705/profile-images/1495691481",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F18705%2Fprofile-images%2F1495691481?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=a49fedda2c5d192f1e52e3f5ff3b6516",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F18705%2Fprofile-images%2F1495691481?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=8d6a44ffa5c7bd9a40fc1133c8f839dd",
        "urlName": "colorrabbit",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "docker-compose",
         "urlName": "docker-compose",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "wTxRgjrx1jwxCo8Oj8uvLe953fOMYZd4Cg==--33u9xTpjvzQzCVUW--s87KUjE/IMu/GUs2e4eVDA==",
       "createdAt": "2019-08-27T11:36:55Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 6,
       "linkUrl": "https://qiita.com/peus/items/cda49133e7e7300d550c",
       "title": "HRRを使うHaskellアプリケーションのDockerコンテナを作る",
       "uuid": "cda49133e7e7300d550c",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://avatars1.githubusercontent.com/u/31796524?v=4",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars1.githubusercontent.com%2Fu%2F31796524%3Fv%3D4?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=49ffdb6ddef6cd44be8f79c2ce074637",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars1.githubusercontent.com%2Fu%2F31796524%3Fv%3D4?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=bca8bfbffe7322cfa55ee890448327b4",
        "urlName": "peus",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        },
        {
         "name": "PostgreSQL",
         "urlName": "postgresql",
         "__typename": "Tag"
        },
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "GOpujM+z/YkwogQMOLvhGjGIxE/x+6n2--SkS9FomJMMAOk2Rv--1/fl28wH1XGpPZrNjceTow==",
       "createdAt": "2016-04-04T15:29:51Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 26,
       "linkUrl": "https://qiita.com/yaju/items/0e98e88f3638d25d69e0",
       "title": "Docker Quickstart Terminalのエラー発生(Looks like something went wrong)について",
       "uuid": "0e98e88f3638d25d69e0",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/14053/profile-images/1473683162",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F14053%2Fprofile-images%2F1473683162?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=5f8b78b775a9146cece907ee00d69960",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F14053%2Fprofile-images%2F1473683162?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=80da1e57196d53ddb0f82f1a079f2df9",
        "urlName": "yaju",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "ir3ALxIX3DX0nOc9gD3NkMCcA7cE03U=--PNeQ2wKToG2+M1FW--bde+r6DR3jUSx7sCGygqLQ==",
       "createdAt": "2013-12-31T11:59:24Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 30,
       "linkUrl": "https://qiita.com/mikiya0417/items/d86ca4c28b5946015a85",
       "title": "MessagePackを使ってみる",
       "uuid": "d86ca4c28b5946015a85",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/28860/profile-images/1473685262",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F28860%2Fprofile-images%2F1473685262?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=c4d76fc0dc492dbcb5289b4f95b2a333",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F28860%2Fprofile-images%2F1473685262?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=8f4936b13ae67f9d0233fab8059b9b26",
        "urlName": "mikiya0417",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "R",
         "urlName": "r",
         "__typename": "Tag"
        },
        {
         "name": "MessagePack",
         "urlName": "messagepack",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "r0234Bh3by+6+jzM7fasz+9DlAjzUA==--aU+02swIAkZYynSf--tAu7AbkpRRCXAT7ZWBUdXw==",
       "createdAt": "2012-08-26T14:47:35Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 50,
       "linkUrl": "https://qiita.com/adachi_c/items/9192c5f823f530c9241f",
       "title": "JSONとMessagePack、シリアライズ性能比較 under the iOS",
       "uuid": "9192c5f823f530c9241f",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/8518/profile-images/1473681056",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F8518%2Fprofile-images%2F1473681056?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=e83f391678d4cab0cc9f222840c2a3d5",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F8518%2Fprofile-images%2F1473681056?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=9a3210e85714f994212744b76f9e1e15",
        "urlName": "adachi_c",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "iPhone",
         "urlName": "iphone",
         "__typename": "Tag"
        },
        {
         "name": "AdventCalendar",
         "urlName": "adventcalendar",
         "__typename": "Tag"
        },
        {
         "name": "iOS",
         "urlName": "ios",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "WGHgYeLwDfRLd5Ore8zgmxmOSLO7KMDD--+n9lODMXh75O3R69--prNHC58Hfx3hRsHagVNaXA==",
       "createdAt": "2017-09-06T04:24:26Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 3,
       "linkUrl": "https://qiita.com/niusounds/items/3ea20327b1a1dd98ab6d",
       "title": "adb ls で端末のディレクトリ内にあるファイルを表示する",
       "uuid": "3ea20327b1a1dd98ab6d",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/56668/profile-images/1597999567",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F56668%2Fprofile-images%2F1597999567?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=1d1c1cb1689019658d834021297ed6f5",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F56668%2Fprofile-images%2F1597999567?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=9ef01c57756c0ed09166884a023a64b1",
        "urlName": "niusounds",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Android",
         "urlName": "android",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "QJLDTx7EptO6AKg0Ey6CkbvtdP46byNZ--UTkShrlqCaBn5+xX--BZSNE/xWmVSOQMDo1kpWFg==",
       "createdAt": "2015-06-24T18:09:14Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 411,
       "linkUrl": "https://qiita.com/tanakh/items/6866d0f570d0547df026",
       "title": "Haskellのビルドツール"stack"の紹介",
       "uuid": "6866d0f570d0547df026",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/524/profile-images/1532959697",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F524%2Fprofile-images%2F1532959697?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=0ca7a168de66e67057278f7d7b5d7815",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F524%2Fprofile-images%2F1532959697?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=444cd576e44a0d77bd5298c10888827e",
        "urlName": "tanakh",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "1ukQBnk+2nXj4SV+d0kB8tI5bKx3NDkc--TxGF7guPFpORS1UO--WXGWLAMg2Yl7l94PbXY1jw==",
       "createdAt": "2015-08-30T05:25:26Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 244,
       "linkUrl": "https://qiita.com/igrep/items/da1d8df6d40eb001a561",
       "title": "Stackでやる最速Haskell Hello world! (GHCのインストール付き！)",
       "uuid": "da1d8df6d40eb001a561",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/12688/profile-images/1473682497",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F12688%2Fprofile-images%2F1473682497?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=7470c5c9872b19fe1b2f9163b73a33c1",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F12688%2Fprofile-images%2F1473682497?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=27b19bbbc676c1f7aed723f921e5ec3d",
        "urlName": "igrep",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        },
        {
         "name": "ghc",
         "urlName": "ghc",
         "__typename": "Tag"
        },
        {
         "name": "stack",
         "urlName": "stack",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "emvlndDWoQf3PQo4pSHYtKlHKM+dirfq--glXKqE2cNnN689+i--MyA1K+x8zltUCJrNL7Qjyw==",
       "createdAt": "2018-12-05T01:50:22Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 97,
       "linkUrl": "https://qiita.com/mk-tool/items/1c7e4929055bb3b7aeda",
       "title": "docker-composeでADDやCOPYをする際に注意すること",
       "uuid": "1c7e4929055bb3b7aeda",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/127811/profile-images/1579305479",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F127811%2Fprofile-images%2F1579305479?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=c7c3384eb2b27206ecb54ba9cc3b124b",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F127811%2Fprofile-images%2F1579305479?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=290a54992fc7e44c70949677714f9230",
        "urlName": "mk-tool",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "docker-compose",
         "urlName": "docker-compose",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "nlVW6AyFax8BXin0IwcDueT8AixDhl6xKw==--QfLnIEHyc52Vdxse--UUBeJcKeh+C/Xt2VZbIqVQ==",
       "createdAt": "2020-05-04T14:23:30Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 40,
       "linkUrl": "https://qiita.com/lotz/items/1cf6f620c9fd02f82070",
       "title": "HerokuにHaskellで作ったWebサービスを公開する簡単な方法",
       "uuid": "1cf6f620c9fd02f82070",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/17134/profile-images/1487948742",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F17134%2Fprofile-images%2F1487948742?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=e5608a58c22c3ba42dac12401ffeb718",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F17134%2Fprofile-images%2F1487948742?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=0307cb8e37829bc47a97262cea7b40ab",
        "urlName": "lotz",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        },
        {
         "name": "Heroku",
         "urlName": "heroku",
         "__typename": "Tag"
        },
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "0ZTWPCMUeH/uA7mcBVesPXbL6sBWrgHA--SbLR4I54nLjW+amn--+W+fi7nVJ+Ij7GLuATp89Q==",
       "createdAt": "2017-12-12T03:59:59Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 99,
       "linkUrl": "https://qiita.com/usamik26/items/672ed3c4451402bfc275",
       "title": "Haskell Stack とは何をするツールなのか",
       "uuid": "672ed3c4451402bfc275",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/6204/profile-images/1473682679",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F6204%2Fprofile-images%2F1473682679?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=e6657e67196218d94db2d3e9b3ce0796",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F6204%2Fprofile-images%2F1473682679?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=76ba1ab769272f0de51933998cef6f6d",
        "urlName": "usamik26",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        },
        {
         "name": "stack",
         "urlName": "stack",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "SVMIqs6VokSAA185obdtaylah8NHXW4Ofw==--giW5KHNIgjAHqcQM--T/VYZwi0GRrJEgTfcU3MYg==",
       "createdAt": "2020-02-24T07:51:22Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 15,
       "linkUrl": "https://qiita.com/dd0125/items/a141000ead36b3823fde",
       "title": "Docker + Haskell の Hello Worldビルド",
       "uuid": "a141000ead36b3823fde",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://pbs.twimg.com/profile_images/1427199246/________2_normal.png",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F1427199246%2F________2_normal.png?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=112f6f36c1d09ab0282772c6de66173f",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F1427199246%2F________2_normal.png?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=aee9d70bbbf357f8f321867dab42f2df",
        "urlName": "dd0125",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Haskell",
         "urlName": "haskell",
         "__typename": "Tag"
        },
        {
         "name": "Docker",
         "urlName": "docker",
         "__typename": "Tag"
        },
        {
         "name": "HelloWorld",
         "urlName": "helloworld",
         "__typename": "Tag"
        },
        {
         "name": "docker-compose",
         "urlName": "docker-compose",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "4Stvh/qYCSIf16ykg5dJ86dSr70loBhcmg==--sZJgYspjRhnj83wV--EdTdYaivcM9HDfoiLOhJXQ==",
       "createdAt": "2020-12-04T00:48:13Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 738,
       "linkUrl": "https://qiita.com/TodayInsane/items/5a04b5b1cf846a6d11d8",
       "title": "1年半のソフトウェアエンジニア長期インターンで出会ったオススメ本をたくさん紹介します",
       "uuid": "5a04b5b1cf846a6d11d8",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/297653/profile-images/1551535185",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F297653%2Fprofile-images%2F1551535185?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=0d6ee787cc256c829af9f804a9e59fd8",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F297653%2Fprofile-images%2F1551535185?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=2790ec6eab8fc538e56a75979c687b6c",
        "urlName": "TodayInsane",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "本",
         "urlName": "%e6%9c%ac",
         "__typename": "Tag"
        },
        {
         "name": "インターン",
         "urlName": "%e3%82%a4%e3%83%b3%e3%82%bf%e3%83%bc%e3%83%b3",
         "__typename": "Tag"
        },
        {
         "name": "書籍紹介",
         "urlName": "%e6%9b%b8%e7%b1%8d%e7%b4%b9%e4%bb%8b",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "ewTeYuFz6EJmZhAMwDDSnZirjxEpfrs=--H5Gxm+pvmd8l2wZW--kZNOS4pfvYxale1KZsbQww==",
       "createdAt": "2014-03-05T16:21:18Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 135,
       "linkUrl": "https://qiita.com/bokkuri_orz/items/c37b2fd543458a189d4d",
       "title": "【Unity3D】ファイル保存パス",
       "uuid": "c37b2fd543458a189d4d",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/39049/profile-images/1473687975",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F39049%2Fprofile-images%2F1473687975?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=1d839d659f5e05ca0616da6e01f22747",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F39049%2Fprofile-images%2F1473687975?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=1cf23439c904a15ddc7f5f1415c98f93",
        "urlName": "bokkuri_orz",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Android",
         "urlName": "android",
         "__typename": "Tag"
        },
        {
         "name": "iOS",
         "urlName": "ios",
         "__typename": "Tag"
        },
        {
         "name": "Unity3D",
         "urlName": "unity3d",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "/LWysdrviv7Pmuj7x84jtBlWcsmcVQIK--WdngxyXC5DrVSyL4--OMzmB3bDYi8U8XgsseDtMA==",
       "createdAt": "2015-05-29T07:59:16Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 86,
       "linkUrl": "https://qiita.com/w_yang/items/8458cd790607d14b1b36",
       "title": "unityでplatformによって取得できるパス",
       "uuid": "8458cd790607d14b1b36",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/69069/profile-images/1473698032",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F69069%2Fprofile-images%2F1473698032?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=ccca8e138b7d9778ad0d615df0cb4f64",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F69069%2Fprofile-images%2F1473698032?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=b4e26db23f8676bd42c76a8572bbbfa7",
        "urlName": "w_yang",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "パス",
         "urlName": "%e3%83%91%e3%82%b9",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "m16w0/LHGTT6G0Hh5E+1ZaqyjX4IyP8/--ctG++R8bbNnmCOR4--rFuATJ6///brnn+nFZcz+A==",
       "createdAt": "2017-12-30T07:38:59Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 229,
       "linkUrl": "https://qiita.com/YSRKEN/items/5a36fb8071104a989fb8",
       "title": "【C#】ReactiveProperty全然分からねぇ！って人向けのFAQ集【修正済】",
       "uuid": "5a36fb8071104a989fb8",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/29802/profile-images/1491043832",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F29802%2Fprofile-images%2F1491043832?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=5978f568472bc54c043d49558b94ce63",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F29802%2Fprofile-images%2F1491043832?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=3b1c7404fd62ee955c1e906a165663a1",
        "urlName": "YSRKEN",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "WPF",
         "urlName": "wpf",
         "__typename": "Tag"
        },
        {
         "name": "ReactiveExtensions",
         "urlName": "reactiveextensions",
         "__typename": "Tag"
        },
        {
         "name": "Validation",
         "urlName": "validation",
         "__typename": "Tag"
        },
        {
         "name": "ReactiveProperty",
         "urlName": "reactiveproperty",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "Rxg9nJOgS9eXXsBf5UEC7SQ/fmruFEM1--rlUXjyaWF8MZ5dh4--f8PnrCNFQ2kWFEk4Yhemjg==",
       "createdAt": "2018-08-20T23:19:26Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 39,
       "linkUrl": "https://qiita.com/gonavi/items/2980b0791a4c14906cd1",
       "title": "async/awaitからC#のマルチスレッドについて調べた",
       "uuid": "2980b0791a4c14906cd1",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://avatars1.githubusercontent.com/u/32533482?v=4",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars1.githubusercontent.com%2Fu%2F32533482%3Fv%3D4?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=c2831863823706014e6bccadd092dec7",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Favatars1.githubusercontent.com%2Fu%2F32533482%3Fv%3D4?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=9083f1c96ff01493b3ea6bafd5f7771a",
        "urlName": "gonavi",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "wIQoRkzYysDIw98wqPnld/SOt6IYz18n--uKMwmqQc1lt0pNZm--iDkueYmQtoIzXXiH0RnBPg==",
       "createdAt": "2016-04-25T01:51:47Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 50,
       "linkUrl": "https://qiita.com/megmogmog1965/items/5c73c60a88487d9c185b",
       "title": "特定の文字を含まない行を削除する",
       "uuid": "5c73c60a88487d9c185b",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/60131/profile-images/1473695140",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F60131%2Fprofile-images%2F1473695140?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=dec011300bc3e19d818e8a5da65a9b54",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F60131%2Fprofile-images%2F1473695140?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=a5f0b4c6bd9846ffea44443eb37cb747",
        "urlName": "megmogmog1965",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "正規表現",
         "urlName": "%e6%ad%a3%e8%a6%8f%e8%a1%a8%e7%8f%be",
         "__typename": "Tag"
        },
        {
         "name": "regex",
         "urlName": "regex",
         "__typename": "Tag"
        },
        {
         "name": "regularexpression",
         "urlName": "regularexpression",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "cHTpvSPFRGvenaZnXkf6J5URo6BswAJj--8YyhXRx5Lnn8aS3J--DxncCNIvrNLGGFEkxtxIXA==",
       "createdAt": "2018-08-29T14:20:54Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 18,
       "linkUrl": "https://qiita.com/yaegaki/items/c6d3244a0f4b3e5d595c",
       "title": "[C#]超シンプルなObservable/Observerを使ったRx",
       "uuid": "c6d3244a0f4b3e5d595c",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/42193/profile-images/1473689068",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F42193%2Fprofile-images%2F1473689068?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=5e28dd08cc3045413b170b25819d0597",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F42193%2Fprofile-images%2F1473689068?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=871ef5e06f3a58e1b550dadac3fa8477",
        "urlName": "yaegaki",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "ReactiveExtensions",
         "urlName": "reactiveextensions",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "k2f+46ZgeoXu5SDJsLfx1qAqIdESXnrt--i96wx38dFRMsH64H--sbxeoOiEaz6iFHzPajl1Nw==",
       "createdAt": "2019-04-20T07:55:59Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 161,
       "linkUrl": "https://qiita.com/HyunwookPark/items/1d24972dd71612eb81c9",
       "title": "github private public 変更",
       "uuid": "1d24972dd71612eb81c9",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/224453/profile-images/1608680768",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F224453%2Fprofile-images%2F1608680768?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=5c432ecabbd965e6f5d1b2c074fc4c21",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F224453%2Fprofile-images%2F1608680768?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=e8e6abb5369f560016fef6626b32bcda",
        "urlName": "HyunwookPark",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "GitHub",
         "urlName": "github",
         "__typename": "Tag"
        },
        {
         "name": "private",
         "urlName": "private",
         "__typename": "Tag"
        },
        {
         "name": "repository",
         "urlName": "repository",
         "__typename": "Tag"
        },
        {
         "name": "public",
         "urlName": "public",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "ojlGpbMgp91R6BxmnEh9XaSV0HLk5zfU--9GQK1e0lDEGjLzkT--bdNbqRxzFFtlsuiiD5ppZg==",
       "createdAt": "2015-04-29T00:36:39Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 45,
       "linkUrl": "https://qiita.com/_meki/items/49a0955f7201901eb714",
       "title": "マークダウン中にコメント行を入れる",
       "uuid": "49a0955f7201901eb714",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://gravatar.com/avatar/f05255661dd6ef2e7112aa8c65db907a?d=https%3A%2F%2Fidenticons.github.com%2F91ccfedee3cbe946c7a1747366b53e23.png&r=x",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fgravatar.com%2Favatar%2Ff05255661dd6ef2e7112aa8c65db907a%3Fd%3Dhttps%253A%252F%252Fidenticons.github.com%252F91ccfedee3cbe946c7a1747366b53e23.png%26r%3Dx?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=e475024ac87ea4375ec2e1212596cb67",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fgravatar.com%2Favatar%2Ff05255661dd6ef2e7112aa8c65db907a%3Fd%3Dhttps%253A%252F%252Fidenticons.github.com%252F91ccfedee3cbe946c7a1747366b53e23.png%26r%3Dx?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=18c1bfa341e7a9555f2ddb18b2897a7a",
        "urlName": "_meki",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Markdown",
         "urlName": "markdown",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "HuIKMLRKd2ZMM3Nc1bPh4CFzjJZRg76Y--9FHsanZvyocCySkr--rM7izloTJWmY8s9Qj/b8BQ==",
       "createdAt": "2017-03-02T07:00:02Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 25,
       "linkUrl": "https://qiita.com/alg/items/75f1cf24e778fe1df1f6",
       "title": "sqlfiddleのかわりにつかえそうなonline sql editor",
       "uuid": "75f1cf24e778fe1df1f6",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/12408/profile-images/1473682400",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F12408%2Fprofile-images%2F1473682400?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=f37daa82e65b80f259f2fb1a11ca55ab",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F12408%2Fprofile-images%2F1473682400?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=8b73ee18efea97349821cd8f9f876749",
        "urlName": "alg",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "MySQL",
         "urlName": "mysql",
         "__typename": "Tag"
        },
        {
         "name": "SQLServer",
         "urlName": "sqlserver",
         "__typename": "Tag"
        },
        {
         "name": "PostgreSQL",
         "urlName": "postgresql",
         "__typename": "Tag"
        },
        {
         "name": "oracle",
         "urlName": "oracle",
         "__typename": "Tag"
        },
        {
         "name": "sqlite",
         "urlName": "sqlite",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "9mRwEKaYgBeaokluj6ZESCgTXLPUehX3kg==--mVzLuli8Bta+ssyn--UtdoGThBv3Io5y04pucq1g==",
       "createdAt": "2019-12-02T12:44:26Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 9,
       "linkUrl": "https://qiita.com/Takaaki_Ichijo/items/bc6ef09fa55d496e5800",
       "title": "Unity + PlayFab + ADX2でAsset Bundleを介さないサウンドデータの配信を実装する",
       "uuid": "bc6ef09fa55d496e5800",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/19010/profile-images/1473682588",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F19010%2Fprofile-images%2F1473682588?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=d8be831df8ac7dd594047038cf5a3d73",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F19010%2Fprofile-images%2F1473682588?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=3fa3e4a9d3a7d203b8e7da1f75fb3329",
        "urlName": "Takaaki_Ichijo",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        },
        {
         "name": "audio",
         "urlName": "audio",
         "__typename": "Tag"
        },
        {
         "name": "Sound",
         "urlName": "sound",
         "__typename": "Tag"
        },
        {
         "name": "Adx2",
         "urlName": "adx2",
         "__typename": "Tag"
        },
        {
         "name": "PlayFab",
         "urlName": "playfab",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "b3Ds9xWERl5Nq6rBuryRrkVKOZtdCwgV--p+mDIXoujphkKKIO--sF6vaxibP9YgabVyWZhdKA==",
       "createdAt": "2016-01-16T12:39:24Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 11,
       "linkUrl": "https://qiita.com/amay077/items/e54ed3bc61f18eea5d3a",
       "title": "Task→Observable 変換でハマったこと",
       "uuid": "e54ed3bc61f18eea5d3a",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/8227/profile-images/1473680950",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F8227%2Fprofile-images%2F1473680950?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=5c0d026bfff7eac0a01caf9def2a15d8",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F8227%2Fprofile-images%2F1473680950?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=10f6d935b27e7d0e28539f0659e843a8",
        "urlName": "amay077",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "ReactiveX",
         "urlName": "reactivex",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "JN8Rgctxbmh5xh4IRnpCazWN2zuKibSV--cOQ3+pP9u/fNsTV2--F4rmDXYux3Y3pUnUXYPASQ==",
       "createdAt": "2018-10-12T12:02:25Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 19,
       "linkUrl": "https://qiita.com/k7a/items/80984aaf4abae180816c",
       "title": "UnityWebRequestを（Taskクラスを使わずに）Awaitableにする",
       "uuid": "80984aaf4abae180816c",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/97014/profile-images/1537175383",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F97014%2Fprofile-images%2F1537175383?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=9ac6ff445126a58c207abc066f9d4844",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F97014%2Fprofile-images%2F1537175383?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=6843ed18a2c69da1e94be4ed1ae219b8",
        "urlName": "k7a",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        },
        {
         "name": "AsyncAwait",
         "urlName": "asyncawait",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "ftUwCRK1AG5SujPSNS7TcBWQWg2juvn3--atTSu0T/c0Nqrv/a--TWy4LsTsoggMy9tdipFOnA==",
       "createdAt": "2017-11-30T09:32:10Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 292,
       "linkUrl": "https://qiita.com/rawr/items/5d49960a4e4d3823722f",
       "title": "C# 今更ですが、await / async",
       "uuid": "5d49960a4e4d3823722f",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/208281/profile-images/1509075346",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F208281%2Fprofile-images%2F1509075346?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=fc0d42d1cd45be37401778929fb3ddb5",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F208281%2Fprofile-images%2F1509075346?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=6f831b0281874f278cd7bba92dc44f37",
        "urlName": "rawr",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "スレッド",
         "urlName": "%e3%82%b9%e3%83%ac%e3%83%83%e3%83%89",
         "__typename": "Tag"
        },
        {
         "name": "Thread",
         "urlName": "thread",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "vfKXl7OYWdXz4AwJuuYp0iXhMfDNctgR8Q==--E6PmSETTxAMNYF4c--lJiAchqsuotsDMBtFnRlPw==",
       "createdAt": "2019-12-12T04:27:06Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 252,
       "linkUrl": "https://qiita.com/yoship1639/items/7339a6201b44a24fbdfe",
       "title": "Unityアプリを高速・安定化するために見直すべき事を9選まとめてみた",
       "uuid": "7339a6201b44a24fbdfe",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/113595/profile-images/1594732889",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F113595%2Fprofile-images%2F1594732889?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=9af4387f3fe5d2591e1d025f764c61bd",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.ap-northeast-1.amazonaws.com%2F0%2F113595%2Fprofile-images%2F1594732889?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=4888ed57c2f3e1dbacc6f31f47fd624d",
        "urlName": "yoship1639",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "Unity3D",
         "urlName": "unity3d",
         "__typename": "Tag"
        },
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        },
        {
         "name": "最適化",
         "urlName": "%e6%9c%80%e9%81%a9%e5%8c%96",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "bvfhTzpG0j6vdC7yvK/zcySNB7YliQM3--C1aIE8ExhhaowAdd--y+jKufe+wEGlTqpE5Ri4uQ==",
       "createdAt": "2018-06-12T16:34:32Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 18,
       "linkUrl": "https://qiita.com/toRisouP/items/0463099d0441d2ffbe3d",
       "title": "Unity UniRxとasync/awaitでフレーム管理",
       "uuid": "0463099d0441d2ffbe3d",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/47146/profile-images/1473690888",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F47146%2Fprofile-images%2F1473690888?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=a4d7414fa873b408e1366dca9de9736f",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F47146%2Fprofile-images%2F1473690888?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=64bdaa53f13c3a8696d78a0f2e2a2421",
        "urlName": "toRisouP",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "Unity",
         "urlName": "unity",
         "__typename": "Tag"
        },
        {
         "name": "UniRx",
         "urlName": "unirx",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "m+jzmM5HZhAkpuIDn2goX4ywLaGqmCX+Iw==--DDoPElCFtZyuQiIF--KUiL5S2pn4u92sl/otwTvw==",
       "createdAt": "2020-10-31T15:35:51Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 92,
       "linkUrl": "https://qiita.com/kami_teru/items/0cbd8b0ebcf02fa297d4",
       "title": "C#のインクリメント演算子(++)がスレッドセーフじゃないから色々調べた話。",
       "uuid": "0cbd8b0ebcf02fa297d4",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://s3-ap-northeast-1.amazonaws.com/qiita-image-store/0/109362/2a1e33c6c74732f135d7606de5b49b8a0283d306/large.png?1581297343",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fs3-ap-northeast-1.amazonaws.com%2Fqiita-image-store%2F0%2F109362%2F2a1e33c6c74732f135d7606de5b49b8a0283d306%2Flarge.png%3F1581297343?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=603093e3ce934a4be70bb84c34a14846",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fs3-ap-northeast-1.amazonaws.com%2Fqiita-image-store%2F0%2F109362%2F2a1e33c6c74732f135d7606de5b49b8a0283d306%2Flarge.png%3F1581297343?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=0953ac8c29f0bacff47b68fa62161714",
        "urlName": "kami_teru",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "C#",
         "urlName": "csharp",
         "__typename": "Tag"
        },
        {
         "name": "マルチスレッド",
         "urlName": "%e3%83%9e%e3%83%ab%e3%83%81%e3%82%b9%e3%83%ac%e3%83%83%e3%83%89",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "TdRzqFuDLupUm2gdLktenhcXeiX7IjSc--2gaqbvrTv1338t+F--dHYvJPCXHJJHgucFqTxVBg==",
       "createdAt": "2015-02-19T14:23:45Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 142,
       "linkUrl": "https://qiita.com/pugiemonn/items/8a6b322654aa65e2966b",
       "title": "MySQLでインデックスを追加するSQLと削除するSQLを実行しました",
       "uuid": "8a6b322654aa65e2966b",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/1624/profile-images/1551366124",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F1624%2Fprofile-images%2F1551366124?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=ec6171a8cc657f518aa53da3ccedfa9e",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F1624%2Fprofile-images%2F1551366124?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=2d83410e2f2de7f6f535da6a0583ec31",
        "urlName": "pugiemonn",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "MySQL",
         "urlName": "mysql",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "AgRJf8lbJMCjbbEIuCOxx38xZzUyuaHk--HM0cHcmMPh2dOYK8--J8Htt+YuUHRw62VAboq3KQ==",
       "createdAt": "2015-08-04T12:08:54Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 115,
       "linkUrl": "https://qiita.com/lastcat_/items/de7b530a94fbcf9ba646",
       "title": "MySQLのexplainとかについてしらべたときのメモ",
       "uuid": "de7b530a94fbcf9ba646",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/54273/profile-images/1473693323",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F54273%2Fprofile-images%2F1473693323?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=6bb3948a39f2a6904139870767f797e5",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F54273%2Fprofile-images%2F1473693323?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=8d678b8b03cf5645204ff3bdb210d9b3",
        "urlName": "lastcat_",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "MySQL",
         "urlName": "mysql",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "ajiG8Uj/YvIClceanVGN9r62VXXXI0jp--ntMhBE23U5tptAYV--tIOER8W01PDFEe6yqwXiEg==",
       "createdAt": "2017-05-07T14:41:44Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 312,
       "linkUrl": "https://qiita.com/kzbandai/items/ea02727f4bb539fcedb5",
       "title": "MySQL EXPLAINのそれぞれの項目についての覚書",
       "uuid": "ea02727f4bb539fcedb5",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/47258/profile-images/1473690925",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F47258%2Fprofile-images%2F1473690925?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=d33b4aa158be47c9eeabff13ca73235b",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F47258%2Fprofile-images%2F1473690925?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=6e8e3f1a1470ec0030fe7ae246699917",
        "urlName": "kzbandai",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "MySQL",
         "urlName": "mysql",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     },
     {
      "article": {
       "__typename": "Article",
       "encryptedId": "9K7BuYg6YXT2IUHRYEq0d44T8b5Oq0Y5--gdLNGinIshm5BeQI--MkYl78SteZ3MbvGxlt7zPg==",
       "createdAt": "2015-06-22T02:50:58Z",
       "isLikedByViewer": true,
       "isPublic": true,
       "likesCount": 1204,
       "linkUrl": "https://qiita.com/yuku_t/items/208be188eef17699c7a5",
       "title": "実例で学ぶ、JOIN (NLJ) が遅くなる理屈と対処法",
       "uuid": "208be188eef17699c7a5",
       "author": {
        "isUser": true,
        "profileImageUrl": "https://qiita-image-store.s3.amazonaws.com/0/153/profile-images/1520924118",
        "profileImageUrlW48": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F153%2Fprofile-images%2F1520924118?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=48&s=90f9808a35e875309ebcf77091ab06e6",
        "profileImageUrlW75": "https://qiita-user-profile-images.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F153%2Fprofile-images%2F1520924118?ixlib=rb-1.2.2&auto=compress%2Cformat&lossless=0&w=75&s=3b7eec86d3c10b22fdfccf082062dc48",
        "urlName": "yuku_t",
        "__typename": "User"
       },
       "tags": [
        {
         "name": "MySQL",
         "urlName": "mysql",
         "__typename": "Tag"
        },
        {
         "name": "RDB",
         "urlName": "rdb",
         "__typename": "Tag"
        }
       ]
      },
      "__typename": "ArticleLike"
     }
    ],
    "pageData": {
     "currentPage": 3,
     "isFirstPage": false,
     "isLastPage": false,
     "nextPage": 4,
     "prevPage": 2,
     "totalPages": 11,
     "__typename": "PageData"
    },
    "__typename": "ArticleLikePage"
   },
   "__typename": "User"
  }
 }
}
"""


main =
    D.decodeString articlesDecoder payload
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


articlesDecoder : Decoder (List Article)
articlesDecoder =
    D.list articleDecoder


articleDecoder : Decoder Article
articleDecoder =
    D.map4 Article
        (D.field "url" D.string)
        (D.field "title" D.string)
        (D.field "tags" tagsDecoder)
        (D.field "userName" authorDecoder)

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
