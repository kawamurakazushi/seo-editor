module Main exposing (main)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (Html, button, div, input, text, textarea, toUnstyled)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


main =
    Browser.sandbox { init = init, update = update, view = view >> toUnstyled }


type alias Content =
    { body : String, keywords : List String }


type alias Model =
    { body : String
    , keywords : List String
    , newKeyword : String
    }


init : Model
init =
    { body = ""
    , keywords = [ "" ]
    , newKeyword = ""
    }


type Msg
    = ChangeBody String
    | ChangeNewKeyword String
    | ChangeKeyword Int String
    | DeleteKeyword Int
    | AddKeyword


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeBody newValue ->
            { model | body = newValue }

        ChangeNewKeyword newValue ->
            { model | newKeyword = newValue }

        ChangeKeyword index newValue ->
            { model
                | keywords =
                    model.keywords
                        |> List.indexedMap
                            (\i x ->
                                if i == index then
                                    newValue

                                else
                                    x
                            )
            }

        DeleteKeyword index ->
            { model
                | keywords =
                    model.keywords
                        |> List.indexedMap Tuple.pair
                        |> List.filter (\x -> Tuple.first x /= index)
                        |> List.map (\x -> Tuple.second x)
            }

        AddKeyword ->
            { model | keywords = model.keywords ++ [ model.newKeyword ], newKeyword = "" }


panelStyle : List Style
panelStyle =
    [ boxShadow5 (px 0) (px 2) (px 4) (px 0) (rgba 22 22 29 0.1)
    , backgroundColor (hex "fff")
    , padding (px 24)
    , borderRadius (px 4)
    ]


characters : String -> Int
characters body =
    String.length (String.filter (\x -> x /= '\n') body)


countKeywords : String -> String -> Int
countKeywords body keyword =
    case String.length keyword of
        0 ->
            0

        _ ->
            (String.split keyword body |> List.length) - 1


percentage : String -> String -> String
percentage body keyword =
    case body of
        "" ->
            "0%"

        _ ->
            String.fromInt (Basics.round (toFloat (countKeywords body keyword * String.length keyword) / toFloat (characters body) * 100)) ++ "%"


view : Model -> Html Msg
view model =
    div [ css [ displayFlex, backgroundColor (hex "fafafa"), minHeight (vh 100), maxHeight (vh 100) ] ]
        [ div
            [ css
                (panelStyle
                    ++ [ displayFlex
                       , flexDirection column
                       , flex (int 2)
                       , margin3 (px 24) (px 16) (px 16)
                       ]
                )
            ]
            [ div []
                [ div [ css [ color (hex "abb"), fontWeight bold, fontSize (px 12) ] ] [ text "CHARACTERS" ]
                , div [ css [ marginTop (px 16), fontSize (px 22), fontWeight bold ] ]
                    [ text (String.fromInt (characters model.body)) ]
                ]
            , div [ css [ minHeight (px 1), minWidth (pct 100), margin2 (px 16) (px 0), minHeight (px 1), backgroundColor (hex "#eee") ] ] []
            , textarea [ css [ lineHeight (px 22), flex (int 1), fontSize (px 14) ], placeholder "", onInput ChangeBody ] []
            ]
        , div [ css (panelStyle ++ [ displayFlex, flexDirection column, flex (int 1), margin4 (px 24) (px 16) (px 16) (px 0) ]) ]
            [ div [ css [ color (hex "abb"), fontWeight bold, fontSize (px 12) ] ] [ text "KEYWORDS" ]
            , div [ css [ displayFlex, marginTop (px 16) ] ]
                [ input [ css [ flex (int 1), padding (px 8), fontSize (px 11) ], placeholder "New Keyword", onInput ChangeNewKeyword, value model.newKeyword ] []
                , button [ css [ border3 (px 1) solid (hex "eee") ], onClick AddKeyword ] [ text "Add" ]
                ]
            , div [ css [ marginTop (px 16), flex (int 1), overflowY auto ] ]
                (List.indexedMap
                    (\index l ->
                        div
                            [ css
                                [ padding (px 8)
                                , borderRadius (px 4)
                                , fontSize (px 12)
                                , nthChild "odd" [ backgroundColor (hex "fafafa") ]
                                ]
                            ]
                            [ div [ css [ displayFlex ] ]
                                [ button [ css [ marginRight (px 8) ], onClick (DeleteKeyword index) ] [ text "×" ]
                                , input [ css [ flex (int 1), backgroundColor transparent ], value l, onInput (ChangeKeyword index) ] []
                                , div [ css [ minWidth (px 30), fontWeight bold ] ]
                                    [ text (String.fromInt (countKeywords model.body l)) ]
                                , div [ css [ minWidth (px 40) ] ] [ text (percentage model.body l) ]
                                ]
                            ]
                    )
                    model.keywords
                )
            ]
        ]
