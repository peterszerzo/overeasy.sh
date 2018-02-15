module Pieces.MoreSimpleLessSimple exposing (..)

import Html exposing (Html, div, text, span)
import Html.Attributes exposing (style)


type alias Model =
    {}


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


toPx : Float -> String
toPx x =
    (toString x) ++ "px"


moresimple : String
moresimple =
    "MORESIMPLE"


lesssimple : String
lesssimple =
    "LESSSIMPLE"


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "width", "800px" )
            , ( "height", "480px" )
            , ( "background-color", "#FFF" )
            , ( "border", "2px solid #000" )
            , ( "position", "absolute" )
            , ( "top", "50%" )
            , ( "left", "50%" )
            , ( "font-family", "Quicksand" )
            , ( "transform", "translate3d(-50%, -50%, 0)" )
            ]
        ]
        [ div
            [ style
                [ ( "width", "160px" )
                , ( "height", "160px" )
                , ( "border", "2px solid #000" )
                , ( "border-radius", "50%" )
                , ( "position", "absolute" )
                , ( "top", "60px" )
                , ( "left", "120px" )
                ]
            ]
            []
        , div []
            (List.range 1 10
                |> List.map
                    (\i ->
                        let
                            angle =
                                -pi * 1.1 + 0.3 * 2 * pi * k

                            k =
                                (i - 1 |> toFloat) / 9

                            x =
                                (angle |> cos) * 95 + 200

                            y =
                                (angle |> sin) * 95 + 140
                        in
                            div
                                [ style
                                    [ ( "position", "absolute" )
                                    , ( "top", toPx y )
                                    , ( "left", toPx x )
                                    , ( "transform", "translate3d(-50%, -50%, 0) rotate(" ++ (toString (angle + pi / 2)) ++ "rad)" )
                                    , ( "opacity", "1" )
                                    ]
                                ]
                                [ Html.text (moresimple |> String.slice (i - 1) i) ]
                    )
            )
        , div []
            (List.range 1 10
                |> List.map
                    (\i_ ->
                        let
                            i =
                                toFloat i_
                        in
                            div
                                [ style
                                    [ ( "position", "absolute" )
                                    , ( "left", (i * 44 + 100) |> toPx )
                                    , ( "bottom", (i * i * 4.0 + i * -36 + 120) |> toPx )
                                    , ( "width", (50 + i * 12) |> toPx )
                                    , ( "height", (50 + i * 12) |> toPx )
                                    , ( "border-radius", "6px" )
                                    , ( "box-sizing", "border-box" )
                                    , ( "border", "2px solid #000" )
                                    , ( "padding", "10px" )
                                    ]
                                ]
                                [ span
                                    [ style
                                        [ ( "position", "absolute" )
                                        , ( "right", "5px" )
                                        , ( "bottom", "5px" )
                                        , ( "opacity", "1" )
                                        ]
                                    ]
                                    [ Html.text (lesssimple |> String.slice (i_ - 1) (i_ + 0)) ]
                                ]
                    )
            )
        ]
