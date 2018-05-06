module Pieces.BureaucracyIsDistracting.Ball exposing (..)

import Random


type alias Ball =
    { x : Float
    , y : Float
    , vx : Float
    , vy : Float
    , rot : Float
    }


init : Ball
init =
    { x = 0.8
    , y = 0.5
    , vx = 1
    , vy = 0
    , rot = 0.5
    }


type alias Repositioning =
    { offsetInMoveDirection : Float
    , offsetPerpendicular : Float
    , dir : Int
    }


tick : Ball -> Ball
tick ball =
    { x = ball.x + ball.vx * 0.001
    , y = ball.y + ball.vy * 0.001
    , vx = ball.vx
    , vy = ball.vy
    , rot = ball.rot + (0.001 * 3 * 15)
    }


shouldReposition : Ball -> Bool
shouldReposition ball =
    List.any identity
        [ ball.vx > 0 && ball.x > 1.2
        , ball.vx < 0 && ball.x < -0.2
        , ball.vy > 0 && ball.y > 1.2
        , ball.vy < 0 && ball.y < -0.2
        ]


reposition : (Ball -> msg) -> Ball -> Cmd msg
reposition toMsg ball =
    Random.generate
        toMsg
        (Random.map3
            (\offsetInMoveDirection offsetPerpendicular dir ->
                case dir of
                    0 ->
                        { x = -offsetInMoveDirection
                        , y = offsetPerpendicular
                        , vx = 1
                        , vy = 0
                        , rot = 0
                        }

                    1 ->
                        { x = 1 + offsetInMoveDirection
                        , y = offsetPerpendicular
                        , vx = -1
                        , vy = 0
                        , rot = 0
                        }

                    2 ->
                        { x = offsetPerpendicular
                        , y = -offsetInMoveDirection
                        , vx = 0
                        , vy = 1
                        , rot = 0
                        }

                    3 ->
                        { x = offsetPerpendicular
                        , y = 1 + offsetInMoveDirection
                        , vx = 0
                        , vy = -1
                        , rot = 0
                        }

                    _ ->
                        { x = offsetInMoveDirection
                        , y = offsetPerpendicular
                        , vx = 1
                        , vy = 0
                        , rot = 0
                        }
            )
            (Random.float 0.2 0.4)
            (Random.float 0 1)
            (Random.int 0 3)
        )
