module Views.NoMobile exposing (..)

import Css exposing (..)
import Css.Media as Media
import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css)


view : Html msg
view =
    div
        [ css
            [ maxWidth (px 640)
            , display block
            , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                [ display none ]
            ]
        ]
        [ p
            [ css
                [ fontSize (Css.rem 1)
                , lineHeight (num 1.6)
                ]
            ]
            [ text "Some birds are not meant to be resized (as in OverEasy does not support mobile). Enjoy your train ride!" ]
        ]
