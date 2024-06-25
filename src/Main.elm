module Main exposing (main)

import Browser
import Html exposing (Html, a, div, img, nav, text)
import Html.Attributes exposing (class, href, src)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type NavItem
    = Dashboard
    | Team
    | Projects
    | Calendar


type alias Model =
    { selected : NavItem }


init : Model
init =
    { selected = Dashboard }



-- UPDATE


type Msg
    = Select NavItem


update : Msg -> Model -> Model
update (Select item) model =
    { model | selected = item }



-- VIEW


view : Model -> Html Msg
view model =
    nav [ class "bg-gray-800" ]
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
