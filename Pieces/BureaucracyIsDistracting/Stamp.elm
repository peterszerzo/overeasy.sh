module Pieces.BureaucracyIsDistracting.Stamp exposing (..)

import Html exposing (Html, text)
import Svg exposing (svg, path, line, rect, g)
import Svg.Attributes exposing (viewBox, x, y, width, height, rx, ry, stroke, fill, strokeWidth, strokeLinecap, strokeLinejoin, d)


view : Html msg
view =
    svg [ viewBox "0 0 160 160" ]
        [ rect
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
            , strokeLinejoin "round"
            , d <|
                "M4,4 "
                    ++ (String.repeat 6 "l6,0 t2,2 l0,6 t2,2 l6,0 t2,-2 l0,-6 t2,-2")
                    ++ " m4,16 "
                    ++ (String.repeat 6 "l0,6 t2,2 l6,0 t2,2 l0,6 t-2,2 l-6,0 t-2,2")
            ]
            []
        ]
