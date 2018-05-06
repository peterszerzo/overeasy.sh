module Pieces.BureaucracyIsDistracting.Scribble exposing (..)

import Random
import Html exposing (Html, text)
import Svg exposing (svg, path, line, rect, g)
import Svg.Attributes
    exposing
        ( fill
        , strokeWidth
        , stroke
        , viewBox
        , x1
        , y1
        , x2
        , y2
        , d
        , x
        , y
        , width
        , height
        , strokeLinecap
        , strokeLinejoin
        )


type alias Scribble =
    { offsets : List (List Float)
    , red : Maybe Int
    }


offsets : List Float
offsets =
    [ 3, -3, 2, -4, 5, -3, 3, -4 ]


generator : Random.Generator Scribble
generator =
    Random.float 1.5 4.5
        |> Random.list 8
        |> Random.map
            (List.indexedMap
                (\index no ->
                    if index % 2 == 0 then
                        -no
                    else
                        no
                )
            )
        |> Random.list 10
        |> Random.map
            (\offsets ->
                Scribble offsets Nothing
            )


modifyOffset : Int -> Float -> Float
modifyOffset index time =
    sin (time / 150 + (toFloat index) * 3.5 * pi)
        * (if index % 3 == 0 then
            0.8
           else
            0.6
          )


single : Float -> Float -> List Float -> Html msg
single time startY offsets =
    path
        [ d <|
            "M10,"
                ++ (toString startY)
                ++ (offsets
                        |> List.indexedMap
                            (\index offset ->
                                let
                                    modifiedOffset =
                                        (modifyOffset index time)
                                            + offset
                                in
                                    "c3,2,6,-3,10,"
                                        ++ (toString modifiedOffset)
                            )
                        |> String.join ""
                   )
        , fill "none"
        , strokeWidth "1px"
        , stroke "#000"
        , strokeLinecap "round"
        , strokeLinejoin "round"
        ]
        []


view : Float -> Scribble -> Html msg
view time scribble =
    svg [ width "100", height "160", viewBox "0 0 100 160" ]
        [ g []
            (scribble.offsets
                |> (List.indexedMap
                        (\index offsets ->
                            single time ((toFloat index) * 10 + 10) offsets
                        )
                   )
            )
        ]
