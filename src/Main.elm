module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (Html, div, text, toUnstyled)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view >> toUnstyled }


type alias Content =
    { body : String, keywords : List String }


type alias Model =
    { body : String
    , keywords : List String
    }


init : Model
init =
    { body = ""
    , keywords = []
    }


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newValue ->
            { model | body = newValue }


view : Model -> Html Msg
view model =
    div []
        [ div [ css [ padding (px 20) ] ] [ div [] [ text "word" ], text (model.body |> String.length |> String.fromInt) ]
        ]
