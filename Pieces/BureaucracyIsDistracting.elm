module Pieces.BureaucracyIsDistracting exposing (..)

import AnimationFrame
import Time
import Random
import Html exposing (Html, program, div, text)
import Html.Attributes exposing (style)
import Svg exposing (svg, path, line)
import Svg.Attributes exposing (viewBox, d, fill, strokeWidth, stroke, x1, y1, x2, y2)
import Pieces.BureaucracyIsDistracting.Ball as Ball


type alias Model =
    { ball : Ball.Ball
    }


init : ( Model, Cmd Msg )
init =
    ( { ball =
            { x = 0.5
            , y = 0.5
            , vx = 0
            , vy = 0
            , rot = 0.5
            }
      }
    , Cmd.none
    )


type Msg
    = Tick Time.Time
    | RepositionBall Ball.Repositioning


w : Float
w =
    800


h : Float
h =
    480


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick _ ->
            ( { ball = Ball.tick model.ball
              }
            , if model.ball.x > 1.2 then
                Random.generate RepositionBall
                    (Random.map3
                        Ball.Repositioning
                        (Random.float -0.4 -0.2)
                        (Random.float 0 1)
                        (Random.int 0 4)
                    )
              else
                Cmd.none
            )

        RepositionBall { offsetInMoveDirection, offsetPerpendicular, dir } ->
            ( { ball =
                    { x = offsetInMoveDirection
                    , y = offsetPerpendicular
                    , vx = 0
                    , vy = 0
                    , rot = model.ball.rot
                    }
              }
            , Cmd.none
            )


toPx : Float -> String
toPx no =
    (toString no) ++ "px"


scribble : Html msg
scribble =
    svg [ Svg.Attributes.width "100", Svg.Attributes.height "100", viewBox "0 0 100 100" ]
        [ path
            [ d """
M10,15 t10,3 t10,-3 t10,2 t10,-4 t10,2 t10,-3 t10,1 t10,-4

M10,35 t10,2 t10,-4 t10,3 t10,-2 t10,3 t10,-1 t10,2 t10,-5
"""
            , fill "none"
            , strokeWidth "1px"
            , stroke "#000"
            ]
            []
        , line [ x1 "98", y1 "2", x2 "98", y2 "98", stroke "#999", strokeWidth "1" ] []
        , line [ x1 "2", y1 "98", x2 "98", y2 "98", stroke "#999", strokeWidth "1" ] []
        ]


ball : Ball.Ball -> Html msg
ball { x, y, rot } =
    div
        [ style
            [ ( "width", "30px" )
            , ( "height", "30px" )
            , ( "border-radius", "50%" )
            , ( "background-color", "#0F4368" )
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
                , ( "transform", "translate3d(" ++ toPx (15 + (cos rot) * 6 - 3) ++ "," ++ toPx (15 + (sin rot) * 6 - 3) ++ ", 0px)" )
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
            , ( "background-color", "#FFF" )
            , ( "position", "absolute" )
            , ( "overflow", "hidden" )
            , ( "top", "50%" )
            , ( "left", "50%" )
            , ( "transform", "translate3d(-50%, -50%, 0)" )
            , ( "border", "2px solid black" )
            ]
        ]
        [ ball model.ball
        , div
            [ style
                [ ( "position", "absolute" )
                , ( "top", "40px" )
                , ( "left", "140px" )
                ]
            ]
            [ scribble ]
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
