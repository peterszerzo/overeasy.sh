module Pieces.BureaucracyIsDistracting.Stamp exposing (..)

import Time
import Html exposing (Html, text)
import Svg exposing (svg, path, line, rect, g, defs, linearGradient, stop)
import Svg.Attributes exposing (id, viewBox, x, y, x1, x2, y1, y2, width, height, rx, ry, stroke, fill, strokeWidth, strokeLinecap, strokeLinejoin, d, offset, stopColor)
import Pieces.BureaucracyIsDistracting.Constants as Constants


view : Time.Time -> Html msg
view time =
    let
        factor =
            sin (time / 960)

        percentageStart =
            20
                + 20
                * (1 + factor)
                |> toString
                |> (\p -> p ++ "%")

        percentageEnd =
            45
                + 20
                * (1 + factor)
                |> toString
                |> (\p -> p ++ "%")
    in
        svg [ viewBox "0 0 160 160" ]
            [ defs
                []
                [ linearGradient [ id "stamp", x1 "0%", x2 "100%", y1 "0%", y2 "0%" ]
                    [ stop [ offset "0%", stopColor "#000" ] []
                    , stop [ offset percentageStart, stopColor "#000" ] []
                    , stop [ offset percentageStart, stopColor Constants.red ] []
                    , stop [ offset percentageEnd, stopColor Constants.red ] []
                    , stop [ offset percentageEnd, stopColor "#000" ] []
                    , stop [ offset "100%", stopColor "#000" ] []
                    ]
                ]
            , rect
                [ x "20"
                , y "24"
                , rx "6"
                , ry "6"
                , width "98"
                , height "98"
                , fill "none"
                , stroke "#000"
                , strokeWidth "2"
                , strokeLinecap "round"
                , strokeLinejoin "round"
                ]
                []
            , path
                [ fill "none"
                , stroke "#000"
                , strokeWidth "2"
                , strokeLinecap "round"
                , stroke "#000"
                , strokeLinejoin "round"
                , d <|
                    "M126,18 "
                        ++ (String.repeat 5 "l0,6 t2,2 l6,0 t2,2 l0,6 t-2,2 l-6,0 t-2,2")
                ]
                []
            , path
                [ fill "none"
                , stroke "#000"
                , strokeWidth "2"
                , strokeLinecap "round"
                , stroke "#000"
                , strokeLinejoin "round"
                , d <|
                    "M1,24 "
                        ++ (String.repeat 5 "l0,6 t2,2 l6,0 t2,2 l0,6 t-2,2 l-6,0 t-2,2")
                ]
                []
            , path
                [ fill "none"
                , stroke "#000"
                , strokeWidth "2"
                , strokeLinecap "round"
                , stroke "#000"
                , strokeLinejoin "round"
                , d <|
                    "M20,132 "
                        ++ (String.repeat 5 "l6,0 t2,2 l0,6 t2,2 l6,0 t2,-2 l0,-6 t2,-2")
                ]
                []
            , path
                [ fill "none"
                , stroke "#000"
                , strokeWidth "2"
                , strokeLinecap "round"
                , stroke "url(#stamp)"
                , strokeLinejoin "round"
                , d <|
                    "M14,4 "
                        ++ (String.repeat 5 "l6,0 t2,2 l0,6 t2,2 l6,0 t2,-2 l0,-6 t2,-2")
                ]
                []
            ]
