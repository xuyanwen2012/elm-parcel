module Types exposing (..)


type NavItem
    = Dashboard
    | Team
    | Projects
    | Calendar


type alias Paper =
    { title : String
    , authors : String
    , year : Int
    }
