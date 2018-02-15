module Main exposing (..)

import Html exposing (Html, text, div, img)
import Pieces.MoreSimpleLessSimple
import Html.Styled exposing (toUnstyled)


main : Program Never Pieces.MoreSimpleLessSimple.Model Pieces.MoreSimpleLessSimple.Msg
main =
    Html.program
        { view = Pieces.MoreSimpleLessSimple.view
        , init = Pieces.MoreSimpleLessSimple.init
        , update = Pieces.MoreSimpleLessSimple.update
        , subscriptions = Pieces.MoreSimpleLessSimple.subscriptions
        }
