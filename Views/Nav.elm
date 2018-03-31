module Views.Nav exposing (..)

import Json.Decode as Decode
import Css exposing (..)
import Html.Styled exposing (Html, text, div, a)
import Html.Styled.Attributes exposing (css, href)
import Html.Styled.Events exposing (onWithOptions)
import Views.Icons as Icons


view : msg -> Html msg
view onClick =
    a
        [ css
            [ width (px 60)
            , height (px 60)
            , borderRadius (pct 50)
            , position absolute
            , boxSizing borderBox
            , top (px 20)
            , left (px 20)
            , padding (px 12)
            , property "z-index" "102"
            , backgroundColor (hex "ffc235")
            ]
        , href "/"
        , onWithOptions "click"
            { preventDefault = True
            , stopPropagation = False
            }
            (Decode.succeed onClick)
        ]
        [ Icons.smallLogo ]
