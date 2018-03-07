module Views.Home exposing (..)

import Json.Decode as Decode
import Css exposing (..)
import Css.Media as Media
import Html.Attributes exposing (style)
import Html.Styled exposing (Html, text, div, img, h2, a, p)
import Html.Styled.Attributes exposing (class, css, src, href)
import Html.Styled.Events exposing (onWithOptions)
import Svg.Styled exposing (svg, use)
import Svg.Styled.Attributes exposing (viewBox, xlinkHref)


link : (String -> msg) -> ( String, String ) -> Html msg
link navigate ( url, label ) =
    a
        [ href url
        , onWithOptions "click" { preventDefault = True, stopPropagation = False } (navigate url |> Decode.succeed)
        , css
            [ textDecoration none
            , color inherit
            , display inlineBlock
            , margin (px 10)
            , borderBottom3 (px 1) solid (hex "000000")
            , fontWeight normal
            , opacity
                (if url == "" then
                    (num 0.4)
                 else
                    (num 1.0)
                )
            , fontSize (Css.rem 1)
            ]
        ]
        [ text label ]


links : List ( String, String )
links =
    [ ( "/more-simple-less-simple", "1. More simple, less simple" )
    , ( "", "2. This way, that way (..SOON..)" )
    , ( "", "3. Bureaucracy is distracting" )
    , ( "", "4. Lemonade with mom and dad" )
    , ( "", "5. My sweet soothing tax id" )
    ]


view : (String -> msg) -> Html msg
view navigate =
    div
        [ css
            [ width (pct 100)
            , height (pct 100)
            , position absolute
            , top (px 0)
            , left (px 0)
            , displayFlex
            , alignItems center
            , justifyContent center
            , property "font-family" "Moon, sans-serif"
            , color (hex "000000")
            , property "z-index" "100"
            ]
        ]
        [ div
            [ css
                [ textAlign center
                , position relative
                , padding (px 20)
                ]
            ]
            [ div
                [ css
                    [ width (px 150)
                    , height (px 150)
                    , margin auto
                    , position relative
                    ]
                ]
                [ svg [ Svg.Styled.Attributes.viewBox "0 0 1000 1000" ] [ use [ xlinkHref "#Logo" ] [] ]
                , h2
                    [ css
                        [ fontSize (Css.rem 1)
                        , position fixed
                        , property "top" "calc(50% - 40vmin)"
                        , property "right" "calc(50% - 40vmin)"
                        , width (px 160)
                        , lineHeight (num 1.4)
                        , textAlign center
                        , letterSpacing (Css.rem 0.08)
                        , property "transform" "rotateZ(+45deg)"
                        , property "transform-origin" "center center"
                        , fontWeight normal
                        ]
                    ]
                    [ text "~ it's like computer art ~" ]
                ]
            , div
                [ css
                    [ maxWidth (px 640)
                    , marginTop (px 40)
                    , display none
                    , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                        [ display block ]
                    ]
                ]
                [ -- link navigate ( "/", "Next -->" ) ,
                  div [] <| List.map (link navigate) links

                -- , link navigate ( "/", "<-- Previous" )
                ]
            , div
                [ css
                    [ maxWidth (px 640)
                    , marginTop (px 40)
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
            ]
        ]
