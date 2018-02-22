module Pieces.LemonadeWithMomAndDad exposing (..)

import Random
import Time
import Keyboard
import AnimationFrame
import Css exposing (..)
import Html.Styled exposing (Html, text, div, img)
import Html.Styled.Attributes exposing (class, css, style, src)


type alias Coordinates =
    List ( Float, Float )


type alias Model =
    { lemons : Coordinates
    , time : Time.Time
    , angularVelocity : Float
    , angle : Float
    }


init : ( Model, Cmd Msg )
init =
    ( { lemons = []
      , time = 0
      , angularVelocity = 1
      , angle = 0
      }
    , generateCoordinates
    )


generateCoordinates : Cmd Msg
generateCoordinates =
    Random.generate ReceiveLemons coordinatesGenerator


type Msg
    = ReceiveLemons Coordinates
    | KeyPress Keyboard.KeyCode
    | Tick Time.Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReceiveLemons lemons ->
            ( { model | lemons = lemons }, Cmd.none )

        Tick diff ->
            ( { model
                | time = model.time + diff
                , angle = model.angle + diff * model.angularVelocity
              }
            , Cmd.none
            )

        KeyPress keyCode ->
            case keyCode of
                32 ->
                    ( { model | angularVelocity = -model.angularVelocity }, Cmd.none )

                13 ->
                    ( model, generateCoordinates )

                _ ->
                    ( model, Cmd.none )


coordinatesGenerator : Random.Generator Coordinates
coordinatesGenerator =
    Random.list 25 <|
        Random.map2
            (\a b -> ( a, b ))
            (Random.float 0 100)
            (Random.float 0 100)


portrait =
    batch
        [ display inlineBlock
        , width (px 150)
        , height (px 150)
        , margin (px 15)
        , borderRadius (pct 50)
        , backgroundColor (hex "FFF")
        , backgroundSize cover
        , backgroundPosition2 (pct 50) (pct 50)
        ]


view : Model -> Html Msg
view model =
    div []
        [ div
            [ css
                [ position absolute
                , top (pct 50)
                , left (pct 50)
                , transform (translate3d (pct -50) (pct -50) (px 0))
                ]
            ]
            [ div
                [ style
                    [ ( "background-image", "url(https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/15/22/1-angela-merkel-corbis.jpg)" )
                    ]
                , css [ portrait ]
                ]
                []
            , div
                [ style
                    [ ( "background-image", "url(https://www.trend-chaser.com/wp-content/uploads/sites/7/2017/01/Brosnan.jpg)" )
                    ]
                , css [ portrait ]
                ]
                []
            ]
        , div
            [ css
                [ position absolute
                , top (px 0)
                , left (px 0)
                , width (pct 100)
                , height (pct 100)
                ]
            ]
          <|
            List.map
                (\( x, y ) ->
                    img
                        [ src "http://pngimg.com/uploads/lemon/lemon_PNG3880.png"
                        , style
                            [ ( "opacity", "0.3" )
                            , ( "width", "120px" )
                            , ( "height", "120px" )
                            , ( "position", "absolute" )
                            , ( "transform"
                              , "translate3d(-50%, -50%, 0) rotate("
                                    ++ (model.angle / 10 |> toString)
                                    ++ "deg)"
                              )
                            , ( "transition", "top 1.5s, left 1.5s" )
                            , ( "top", (toString y) ++ "%" )
                            , ( "left", (toString x) ++ "%" )
                            ]
                        ]
                        []
                )
                model.lemons
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ AnimationFrame.diffs Tick
        , Keyboard.downs KeyPress
        ]
