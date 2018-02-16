module Main exposing (..)

import Task
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (style)
import Html.Styled exposing (toUnstyled)
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


type alias Model =
    { route : Route
    , window : Window.Size
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
          , window = { width = 0, height = 0 }
          }
        , Cmd.batch
            [ routeInitCmd route
            , Window.size |> Task.perform Resize
            ]
        )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model.route ) of
        ( ChangeRoute route, _ ) ->
            ( { model | route = route }, routeInitCmd route )

        ( Resize window, _ ) ->
            ( { model | window = window }, Cmd.none )

        ( ThisWayThatWayMsg msg, ThisWayThatWay model_ ) ->
            ( { model | route = ThisWayThatWay (Pieces.ThisWayThatWay.update msg model_ |> Tuple.first) }
            , Pieces.ThisWayThatWay.update msg model_ |> Tuple.second |> Cmd.map ThisWayThatWayMsg
            )

        ( MoreSimpleLessSimpleMsg msg, MoreSimpleLessSimple model_ ) ->
            ( { model | route = MoreSimpleLessSimple (Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.first) }
            , Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.second |> Cmd.map MoreSimpleLessSimpleMsg
            )

        _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model.route of
        Home ->
            div
                [ style
                    [ ( "width", "100%" )
                    , ( "height", "100%" )
                    , ( "background-color", "#ffc235" )
                    ]
                ]
                [ Views.Home.view |> toUnstyled
                , Views.Bg.view model.window
                ]

        NotFound ->
            Html.text "Not found"

        ThisWayThatWay model ->
            Pieces.ThisWayThatWay.view model |> Html.map ThisWayThatWayMsg

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
