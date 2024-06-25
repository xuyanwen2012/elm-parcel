module NavBar exposing (view)

import Html exposing (Html, a, div, img, nav, text)
import Html.Attributes exposing (class, href, src)


view : NavItem -> Html msg
view selected =
    nav [ class "bg-gray-800" ]
        [ div [ class "mx-auto max-w-7xl px-2 sm:px-6 lg:px-8" ]
            [ div [ class "relative flex h-16 items-center justify-between" ]
                [ div [ class "flex flex-1 items-center justify-center sm:items-stretch sm:justify-start" ]
                    [ div [ class "flex flex-shrink-0 items-center" ]
                        [-- Logo
                        ]
                    , div [ class "hidden sm:ml-6 sm:block" ]
                        [ div [ class "flex space-x-4" ]
                            [ navItem selected Dashboard "Dashboard"
                            , navItem selected Team "Team"
                            , navItem selected Projects "Projects"
                            , navItem selected Calendar "Calendar"
                            ]
                        ]
                    ]
                ]
            ]
        ]



-- navItem : String -> Html msg
-- navItem label =
--     a [ href "#", class "rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white" ]
--         [ text label ]


navItem : NavItem -> String -> Html Msg
navItem selected item label =
    let
        isSelected =
            selected == item

        itemClass =
            if isSelected then
                "rounded-md bg-gray-900 px-3 py-2 text-sm font-medium text-white"

            else
                "rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white"
    in
    a [ href "#", class itemClass, onClick (Select item) ] [ text label ]
