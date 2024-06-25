module Main exposing (main)

-- import types from "Types.elm"

import Browser
import Html exposing (Html, a, div, h2, img, li, nav, text, ul)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)
import Types exposing (..)

import Json.Decode exposing (Decoder, map4, field, int, string)

main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { selected : NavItem
    , papers : List Paper
    }


init : Model
init =
    { selected = Dashboard
    , papers =
        [ { title = "Paper A", authors = "Author A", year = 2021 }
        , { title = "Paper B", authors = "Author B", year = 2022 }
        , { title = "Paper C", authors = "Author C", year = 2023 }
        ]
    }



-- UPDATE


type Msg
    = Select NavItem


update : Msg -> Model -> Model
update (Select item) model =
    { model | selected = item }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ nav [ class "bg-gray-800" ]
            [ div [ class "mx-auto max-w-7xl px-2 sm:px-6 lg:px-8" ]
                [ div [ class "relative flex h-16 items-center justify-between" ]
                    [ div [ class "flex flex-1 items-center justify-center sm:items-stretch sm:justify-start" ]
                        [ div [ class "flex flex-shrink-0 items-center" ]
                            [-- Logo
                            ]
                        , div [ class "hidden sm:ml-6 sm:block" ]
                            [ div [ class "flex space-x-4" ]
                                [ navItem model Dashboard "Dashboard"
                                , navItem model Team "Team"
                                , navItem model Projects "Projects"
                                , navItem model Calendar "Calendar"
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , div [ class "bg-gray-100 min-h-screen flex items-center justify-center p-4" ]
            [ div [ class "bg-white shadow overflow-hidden sm:rounded-lg w-full max-w-4xl" ]
                [ div [ class "px-4 py-5 sm:px-6" ]
                    [ h2 [ class "text-lg leading-6 font-medium text-gray-900" ] [ text "Published Papers" ] ]
                , ul [ class "divide-y divide-gray-200" ]
                    (List.map viewPaper model.papers)
                ]
            ]
        ]


navItem : Model -> NavItem -> String -> Html Msg
navItem model item label =
    let
        isSelected =
            model.selected == item

        itemClass =
            if isSelected then
                "rounded-md bg-gray-900 px-3 py-2 text-sm font-medium text-white"

            else
                "rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white"
    in
    a [ href "#", class itemClass, onClick (Select item) ] [ text label ]


viewPaper : Paper -> Html Msg
viewPaper paper =
    li [ class "px-4 py-4 sm:px-6" ]
        [ div [ class "flex items-center justify-between" ]
            [ div [ class "text-sm font-medium text-indigo-600 truncate" ] [ text paper.title ]
            , div [ class "ml-2 flex-shrink-0 flex" ]
                [ div [ class "bg-green-100 text-green-800 text-xs px-2 inline-flex leading-5 font-semibold rounded-full" ]
                    [ text (String.fromInt paper.year)
                    ]
                ]
            ]
        , div [ class "mt-2 sm:flex sm:justify-between" ]
            [ div [ class "sm:flex" ]
                [ div [ class "mr-6 flex items-center text-sm text-gray-500" ]
                    [ text ("by " ++ paper.authors) ]
                ]
            ]
        ]
