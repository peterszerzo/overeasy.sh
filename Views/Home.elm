module Views.Home exposing (..)

import Time
import Json.Decode as Decode
import Css exposing (..)
import Css.Media as Media
import Html.Styled exposing (Html, text, div, img, h2, a, p, fromUnstyled, br)
import Html.Styled.Attributes exposing (class, css, src, href)
import Html.Styled.Events exposing (onWithOptions)
import Views.Icons as Icons
import Views.Home.Bg
import Window


type alias Config msg =
    { navigate : String -> msg
    , window : Window.Size
    , time : Time.Time
    , css : List Style
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
            , margin2 (px 12) (px 15)
            , borderBottom3 (px 1) solid (transparent)
            , hover
                [ borderBottom3 (px 1) solid (hex "000000")
                ]
            , opacity
                (if url == "" then
                    (num 0.4)
                 else
                    (num 1.0)
                )
            , fontSize (Css.rem 0.75)
            , property "transform-origin" "center center"
            , property "-webkit-font-smoothing" "subpixel-antialiased"
            , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                [ fontSize (Css.rem 1)
                ]
            ]
        ]
        [ text label ]


links : List ( String, String )
links =
    [ ( "/more-simple-less-simple", "1. more-simple-less-simple" )
    , ( "/our-bearings-are-fragile", "2. our-bearings-are-fragile" )
    , ( "/bureaucracy-is-distracting", "3. bureaucracy-is-distracting" )
    ]


tiltedSubtitleStyle : Style
tiltedSubtitleStyle =
    Css.batch
        [ position absolute
        , top (px -30)
        , width (px 150)
        , lineHeight (num 1.4)
        , textAlign center
        , letterSpacing (Css.rem 0.08)
        , fontSize (Css.rem 0.75)
        , property "transform-origin" "center center"
        , property "-webkit-font-smoothing" "subpixel-antialiased"
        , firstOfType
            [ left (px -110)
            , property "transform" "rotateZ(-45deg)"
            , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                [ left (px -150)
                ]
            ]
        , lastOfType
            [ right (px -110)
            , property "transform" "rotateZ(+45deg)"
            , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                [ right (px -150)
                ]
            ]
        , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
            [ fontSize (Css.rem 1)
            , top (px -60)
            , width (px 200)
            ]
        ]


view : Config msg -> Html msg
view config =
    div
        [ css
            [ width (pct 100)
            , height (pct 100)
            , position absolute
            , Css.top (px 0)
            , Css.left (px 0)
            , overflow hidden
            , backgroundColor (hex "ffc235")
            , Css.batch config.css
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
                        [ width (px 90)
                        , height (px 90)
                        , margin auto
                        , position relative
                        , fontSize (Css.rem 0.75)
                        , Media.withMediaQuery [ "screen and (min-width: 600px)" ]
                            [ width (px 140)
                            , height (px 140)
                            ]
                        ]
                    ]
                    [ Icons.logo
                    , h2
                        [ css
                            [ tiltedSubtitleStyle
                            ]
                        ]
                        [ text "~ it's like computer art ~" ]
                    , h2
                        [ css
                            [ tiltedSubtitleStyle
                            ]
                        ]
                        [ br [] []
                        , text "~ "
                        , a
                            [ css
                                [ textDecoration none
                                , color inherit
                                , hover
                                    [ borderBottom3 (px 1) solid currentColor
                                    ]
                                ]
                            , href "http://peterszerzo.com"
                            ]
                            [ text "by peter" ]
                        , text " ~"
                        ]
                    ]
                , div
                    [ css
                        [ maxWidth (px 480)
                        , marginTop (px 20)
                        ]
                    ]
                    [ -- link config.navigate ( "/", "Next -->" ) ,
                      links
                        |> List.reverse
                        |> List.map (link config.navigate)
                        |> div []

                    -- , link config.navigate ( "/", "<-- Previous" )
                    ]
                ]
            ]
        , Views.Home.Bg.view config.window config.time
        ]
