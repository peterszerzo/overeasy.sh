module Pieces.BureaucracyIsDistracting exposing (..)

import Random
import AnimationFrame
import Time
import Html exposing (Html, program, div, text)
import Html.Attributes exposing (style)
import Pieces.BureaucracyIsDistracting.Ball as Ball
import Pieces.BureaucracyIsDistracting.Scribble as Scribble
import Pieces.BureaucracyIsDistracting.Stamp as Stamp
import Pieces.BureaucracyIsDistracting.Constants as Constants


type alias Model =
    { ball : Ball.Ball
    , scribbles : List Scribble.Scribble
    , time : Time.Time
    }


init : ( Model, Cmd Msg )
init =
    ( { ball = Ball.init
      , scribbles = []
      , time = 0
      }
    , Cmd.batch
        [ Random.generate GenerateScribble (Scribble.generator [ 3, 4 ])
        , Random.generate GenerateScribble (Scribble.generator [ 2, 6, 7 ])
        , Random.generate GenerateScribble (Scribble.generator [ 1, 5 ])
        ]
    )


type Msg
    = Tick Time.Time
    | GenerateScribble Scribble.Scribble
    | RepositionBall Ball.Ball


w : Float
w =
    800


h : Float
h =
    480


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            ( { model
                | ball = Ball.tick model.ball
                , time = time
              }
            , if Ball.shouldReposition model.ball then
                Ball.reposition RepositionBall model.ball
              else
                Cmd.none
            )

        RepositionBall ball ->
            ( { model | ball = ball }
            , Cmd.none
            )

        GenerateScribble scribble ->
            ( { model | scribbles = scribble :: model.scribbles }
            , Cmd.none
            )


toPx : Float -> String
toPx no =
    (toString no) ++ "px"


ball : Ball.Ball -> Html msg
ball { x, y, rot } =
    div
        [ style
            [ ( "width", "30px" )
            , ( "height", "30px" )
            , ( "border-radius", "50%" )
            , ( "background-color", Constants.blue )
            , ( "position", "absolute" )
            , ( "left", toPx (x * w - 15) )
            , ( "top", toPx (y * h - 15) )
            ]
        ]
        [ div
            [ style
                [ ( "width", "6px" )
                , ( "height", "6px" )
                , ( "background-color", "white" )
                , ( "border-radius", "50%" )
                , ( "position", "absolute" )
                , ( "top", "0px" )
                , ( "left", "0px" )
                , ( "transform"
                  , "translate3d("
                        ++ toPx (15 + (cos rot) * 6 - 3)
                        ++ ","
                        ++ toPx (15 + (sin rot) * 6 - 3)
                        ++ ", 0px)"
                  )
                ]
            ]
            []
        ]


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "width", (toString w) ++ "px" )
            , ( "height", (toString h) ++ "px" )
            , ( "position", "relative" )
            , ( "background-color", "#FFF" )
            , ( "overflow", "hidden" )
            , ( "border", "2px solid black" )
            ]
        ]
        [ ball model.ball
        , div [] <|
            List.map2
                (\styles scribble ->
                    div
                        [ style <|
                            [ ( "position", "absolute" )
                            , ( "top", "40px" )
                            , ( "left", "140px" )
                            ]
                                ++ styles
                        ]
                        [ Scribble.view model.time scribble
                        ]
                )
                [ [ ( "top", "40px" )
                  , ( "left", "140px" )
                  , ( "transform", "rotateZ(-30deg)" )
                  ]
                , [ ( "top", "280px" )
                  , ( "left", "420px" )
                  , ( "transform", "rotateZ(30deg)" )
                  ]
                , [ ( "top", "60px" )
                  , ( "left", "600px" )
                  , ( "transform", "rotateZ(-45deg)" )
                  ]
                ]
                model.scribbles
        , div
            [ style
                [ ( "width", "160px" )
                , ( "height", "160px" )
                , ( "position", "absolute" )
                , ( "top", "260px" )
                , ( "left", "160px" )
                , ( "transform", "rotateZ(45deg)" )
                ]
            ]
            [ Stamp.view { time = model.time, singleSnake = True } ]
        , div
            [ style
                [ ( "width", "160px" )
                , ( "height", "160px" )
                , ( "position", "absolute" )
                , ( "top", "80px" )
                , ( "left", "320px" )
                , ( "transform", "rotateZ(210deg)" )
                ]
            ]
            [ Stamp.view { time = model.time, singleSnake = False } ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    AnimationFrame.times Tick


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
