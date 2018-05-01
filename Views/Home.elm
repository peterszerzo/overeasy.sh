module Views.Home exposing (..)

import Time
import Json.Decode as Decode
import Css exposing (..)
import Html.Styled exposing (Html, text, div, img, h2, a, p, fromUnstyled)
import Html.Styled.Attributes exposing (class, css, src, href)
import Html.Styled.Events exposing (onWithOptions)
import Views.Icons as Icons
import Views.Home.Bg
import Window


type alias Config msg =
    { navigate : String -> msg
    , window : Window.Size
    , time : Time.Time
    }


link : (String -> msg) -> ( String, String ) -> Html msg
link navigate ( url, label ) =
    a
        [ href url
        , onWithOptions "click"
            { preventDefault = True
            , stopPropagation = False
            }
            (navigate url |> Decode.succeed)
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
    [ ( "/more-simple-less-simple", "1. more-simple-less-simple" )
    , ( "/our-bearings-are-fragile", "2. our-bearings-are-fragile" )
    , ( "", "3. bureaucracy-is-distracting" )
    , ( "", "4. my-sweet-soothing-tax-id" )
    , ( "", "5. moebius-racer" )
    ]


tiltedSubtitleStyle : Style
tiltedSubtitleStyle =
    Css.batch
        [ fontSize (Css.rem 1)
        , position fixed
        , property "top" "calc(50% - 12vmin - 180px)"
        , width (px 180)
        , lineHeight (num 1.4)
        , textAlign center
        , letterSpacing (Css.rem 0.08)
        , property "transform-origin" "center center"
        , fontWeight normal
        ]


view : Config msg -> Html msg
view config =
    div
        [ css
            [ width (pct 100)
            , position absolute
            , Css.top (px 0)
            , Css.left (px 0)
            , overflow hidden
            , height (pct 100)
            , backgroundColor (hex "ffc235")
            ]
        ]
        [ div
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
                    [ Icons.logo
                    , h2
                        [ css
                            [ tiltedSubtitleStyle
                            , property "left" "calc(50% - 25vmin - 100px)"
                            , property "transform" "rotateZ(-45deg)"
                            ]
                        ]
                        [ text "~ it's like computer art ~" ]
                    , h2
                        [ css
                            [ tiltedSubtitleStyle
                            , property "right" "calc(50% - 25vmin - 100px)"
                            , property "transform" "rotateZ(+45deg)"
                            ]
                        ]
                        [ text "~ a silly scramble from "
                        , a
                            [ css
                                [ textDecoration none
                                , color inherit
                                , borderBottom3 (px 1) solid currentColor
                                ]
                            , href "http://peterszerzo.com"
                            ]
                            [ text "peter" ]
                        , text " ~"
                        ]
                    ]
                , div
                    [ css
                        [ maxWidth (px 640)
                        , marginTop (px 40)
                        ]
                    ]
                    [ -- link config.navigate ( "/", "Next -->" ) ,
                      div [] <| List.map (link config.navigate) links

                    -- , link config.navigate ( "/", "<-- Previous" )
                    ]
                ]
            ]
        , Views.Home.Bg.view config.window config.time
        ]
