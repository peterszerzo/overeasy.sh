module Main exposing (..)

import Time
import Task
import AnimationFrame
import Css exposing (..)
import Html exposing (Html)
import Html.Styled exposing (fromUnstyled, toUnstyled, text, div, img)
import Html.Styled.Attributes exposing (css)
import Pieces.MoreSimpleLessSimple
import Pieces.BearingsAreFragile
import Navigation
import Window
import UrlParser exposing (..)
import Views.Home
import Views.Nav


type Route
    = Home
    | BearingsAreFragile Pieces.BearingsAreFragile.Model
    | MoreSimpleLessSimple Pieces.MoreSimpleLessSimple.Model
    | NotFound


parse : Navigation.Location -> Route
parse location =
    location
        |> parsePath matchers
        |> Maybe.withDefault Home


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ s "" |> map Home
        , s "more-simple-less-simple" |> map (Pieces.MoreSimpleLessSimple.init |> Tuple.first |> MoreSimpleLessSimple)
        , s "bearings-are-fragile" |> map (Pieces.BearingsAreFragile.init |> Tuple.first |> BearingsAreFragile)
        ]


type Msg
    = ChangeRoute Route
    | Navigate String
    | BearingsAreFragileMsg Pieces.BearingsAreFragile.Msg
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
        BearingsAreFragile _ ->
            Pieces.BearingsAreFragile.init |> Tuple.second |> Cmd.map BearingsAreFragileMsg

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

        Navigate newPath ->
            ( model, Navigation.newUrl newPath )

        MoreSimpleLessSimpleMsg msg ->
            case model.route of
                MoreSimpleLessSimple model_ ->
                    ( { model | route = MoreSimpleLessSimple (Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.first) }
                    , Pieces.MoreSimpleLessSimple.update msg model_ |> Tuple.second |> Cmd.map MoreSimpleLessSimpleMsg
                    )

                _ ->
                    ( model, Cmd.none )

        BearingsAreFragileMsg msg ->
            case model.route of
                BearingsAreFragile model_ ->
                    ( { model | route = BearingsAreFragile (Pieces.BearingsAreFragile.update msg model_ |> Tuple.first) }
                    , Pieces.BearingsAreFragile.update msg model_ |> Tuple.second |> Cmd.map BearingsAreFragileMsg
                    )

                _ ->
                    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ css [ height (pct 100) ]
        ]
        [ if model.route == Home then
            text ""
          else
            Views.Nav.view (Navigate "/")
        , (case model.route of
            Home ->
                Views.Home.view
                    { navigate = Navigate
                    , window = model.window
                    , time = model.time - model.startTime
                    }

            NotFound ->
                Html.Styled.text "Not found"

            BearingsAreFragile model ->
                Pieces.BearingsAreFragile.view model
                    |> Html.map BearingsAreFragileMsg
                    |> fromUnstyled

            MoreSimpleLessSimple model ->
                Pieces.MoreSimpleLessSimple.view model
                    |> Html.map MoreSimpleLessSimpleMsg
                    |> fromUnstyled
          )
        ]
        |> toUnstyled


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ case model.route of
            BearingsAreFragile model ->
                Pieces.BearingsAreFragile.subscriptions model |> Sub.map BearingsAreFragileMsg

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
