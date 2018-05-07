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
    , reds : List Int
    }


generator : List Int -> Random.Generator Scribble
generator reds =
    Random.float 1.5 2.5
        |> Random.list 8
        |> Random.map2
            (\rem offsets ->
                List.indexedMap
                    (\index no ->
                        if index % 2 == rem then
                            -no
                        else
                            no
                    )
                    offsets
            )
            (Random.int 0 1)
        |> Random.list 10
        |> Random.map
            (\offsets ->
                Scribble offsets reds
            )


modifyOffset : Int -> Int -> Float -> Float
modifyOffset rowIndex columnIndex time =
    sin (time / 150 + (toFloat columnIndex) * 3.5 * pi + (toFloat rowIndex) * 0.3)
        * (if columnIndex % 3 == 0 then
            0.8
           else
            0.6
          )


single : Int -> Float -> Bool -> List Float -> Html msg
single index time isRed offsets =
    let
        startY =
            ((toFloat index) * 10 + 10)
    in
        path
            [ d <|
                "M10,"
                    ++ (toString startY)
                    ++ (offsets
                            |> List.indexedMap
                                (\columnIndex offset ->
                                    let
                                        modifiedOffset =
                                            (modifyOffset index columnIndex time)
                                                + offset
                                    in
                                        "c3,2,6,-3,10,"
                                            ++ (toString modifiedOffset)
                                )
                            |> String.join ""
                       )
            , fill "none"
            , strokeWidth "1px"
            , stroke
                (if isRed then
                    "#B50922"
                 else
                    "#000"
                )
            , strokeLinecap "round"
            , strokeLinejoin "round"
            ]
            []


view : Float -> Scribble -> Html msg
view time scribble =
    svg [ width "150", height "240", viewBox "0 0 100 160" ]
        [ g []
            (scribble.offsets
                |> (List.indexedMap
                        (\index offsets ->
                            single index time (List.member index scribble.reds) offsets
                        )
                   )
            )
        ]
