module Main exposing (..)

import Time
import Task
import AnimationFrame
import Css exposing (..)
import Html exposing (Html)
import Html.Styled exposing (fromUnstyled, toUnstyled, text, div, img)
import Html.Styled.Attributes exposing (css)
import Pieces.MoreSimpleLessSimple
import Pieces.ThisWayThatWay
import Navigation
import String
import Window
import UrlParser exposing (..)
import Views.Home
import Views.Bg


type Route
    = Home
    | ThisWayThatWay Pieces.ThisWayThatWay.Model
    | MoreSimpleLessSimple Pieces.MoreSimpleLessSimple.Model
    | NotFound


parse : Navigation.Location -> Route
parse location =
    location
        |> parseHash matchers
        |> Maybe.withDefault Home


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ s "home" |> map Home
        , s "more-simple-less-simple" |> map (Pieces.MoreSimpleLessSimple.init |> Tuple.first |> MoreSimpleLessSimple)
        , s "this-way-that-way" |> map (Pieces.ThisWayThatWay.init |> Tuple.first |> ThisWayThatWay)
        ]


type Msg
    = ChangeRoute Route
    | ThisWayThatWayMsg Pieces.ThisWayThatWay.Msg
    | MoreSimpleLessSimpleMsg Pieces.MoreSimpleLessSimple.Msg
    | Resize Window.Size
    | Tick Time.Time
    | StartTime Time.Time


type alias Model =
    { route : Route
    , window : Window.Size
    , startTime : Time.Time
    , time : Time.Time
    }


routeInitCmd : Route -> Cmd Msg
routeInitCmd route =
    case route of
        ThisWayThatWay _ ->
            Pieces.ThisWayThatWay.init |> Tuple.second |> Cmd.map ThisWayThatWayMsg

        MoreSimpleLessSimple _ ->
            Pieces.MoreSimpleLessSimple.init |> Tuple.second |> Cmd.map MoreSimpleLessSimpleMsg

        _ ->
            Cmd.none


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        route =
            parse location
    in
        ( { route = route
          , window =
                { width = 0
                , height = 0
                }
          , startTime = 0
          , time = 0
          }
        , Cmd.batch
            [ routeInitCmd route
            , Window.size |> Task.perform Resize
            , Time.now |> Task.perform StartTime
            ]
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeRoute route ->
            ( { model | route = route }, routeInitCmd route )

        Resize window ->
            ( { model | window = window }, Cmd.none )

        Tick time ->
            ( { model | time = time }, Cmd.none )

        StartTime time ->
            ( { model | startTime = time }, Cmd.none )

        ThisWayThatWayMsg msg ->
            case model.route of
                ThisWayThatWay model_ ->
                    ( { model | route = ThisWayThatWay (Pieces.ThisWayThatWay.update msg model_ |> Tuple.first) }
                    , Pieces.ThisWayThatWay.update msg model_ |> Tuple.second |> Cmd.map ThisWayThatWayMsg
                    )

                _ ->
                    ( model, Cmd.none )

        MoreSimpleLessSimpleMsg msg ->
            case model.route of
                MoreSimpleLessSimple model_ ->
                    ( { model | route = MoreSimpleLessSimple (Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.first) }
                    , Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.second |> Cmd.map MoreSimpleLessSimpleMsg
                    )

                _ ->
                    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    let
        homeView =
            div
                [ css
                    [ width (pct 100)
                    , position absolute
                    , Css.top (px 0)
                    , Css.left (px 0)
                    , overflow hidden
                    , height (pct 100)
                    , backgroundColor (hex "ffc235")
                    ]
                ]
                [ Views.Home.view
                , Views.Bg.view model.window (model.time - model.startTime) |> fromUnstyled
                ]
                |> toUnstyled
    in
        if model.window.width < 600 then
            homeView
        else
            case model.route of
                Home ->
                    homeView

                NotFound ->
                    Html.text "Not found"

                ThisWayThatWay model ->
                    Pieces.ThisWayThatWay.view model
                        |> Html.map ThisWayThatWayMsg

                MoreSimpleLessSimple model ->
                    Pieces.MoreSimpleLessSimple.view model |> Html.map MoreSimpleLessSimpleMsg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ case model.route of
            ThisWayThatWay model ->
                Pieces.ThisWayThatWay.subscriptions model |> Sub.map ThisWayThatWayMsg

            MoreSimpleLessSimple model ->
                Pieces.MoreSimpleLessSimple.subscriptions model |> Sub.map MoreSimpleLessSimpleMsg

            _ ->
                Sub.none
        , Window.resizes Resize
        , AnimationFrame.times Tick
        ]


main : Program Never Model Msg
main =
    Navigation.program
        (ChangeRoute << parse)
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
