module Views.Home exposing (..)

import Css exposing (..)
import Html.Attributes exposing (style)
import Html.Styled exposing (Html, text, div, img, h2, a, p)
import Html.Styled.Attributes exposing (class, css, src, href)
import Svg.Styled exposing (svg, use)
import Svg.Styled.Attributes exposing (viewBox, xlinkHref)


link : ( String, String ) -> Html msg
link ( url, label ) =
    a
        [ href url
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
    [ ( "#more-simple-less-simple", "1. More simple, less simple" )
    , ( "#this-way-that-way", "2. This way, that way" )
    , ( "", "3. Bureaucracy is distracting" )
    , ( "", "4. Lemonade with mom and dad" )
    , ( "", "5. My sweet soothing tax id" )
    ]


view : Html msg
view =
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
        [ div [ css [ textAlign center, position relative ] ]
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
                        , position absolute
                        , top (px 55)
                        , right (px -100)
                        , property "transform" "rotateZ(-90deg)"
                        , property "transform-origin" "center center"
                        , fontWeight normal
                        ]
                    ]
                    [ text "( computer art )" ]
                ]
            , div [ css [ maxWidth (px 640), marginTop (px 40) ] ]
                [ p [] [ text "..." ]
                , div [] <| List.map link (List.reverse links)
                , p [] [ text "..." ]
                ]
            ]
        ]
