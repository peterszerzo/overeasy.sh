module Pieces.BureaucracyIsDistracting.Ball exposing (..)


type alias Ball =
    { x : Float
    , y : Float
    , vx : Float
    , vy : Float
    , rot : Float
    }


type alias Repositioning =
    { offsetInMoveDirection : Float
    , offsetPerpendicular : Float
    , dir : Int
    }


tick : Ball -> Ball
tick ball =
    { x = ball.x + 0.001
    , y = ball.y
    , vx = 0
    , vy = 0
    , rot = ball.rot + (0.001 * 3 * 15)
    }
