module Pieces.ThisWayThatWay exposing (..)

import Html exposing (Html, Attribute, div, program)
import Html.Attributes exposing (class, style, width, height)
import Math.Matrix4 as Matrix4
import Math.Vector3 as Vector3 exposing (Vec3, vec3)
import Math.Vector2 as Vector2 exposing (Vec2, vec2)
import WebGL


type alias Model =
    {}


type Msg
    = NoOp


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    let
        zoom =
            12

        size =
            800

        top =
            200

        left =
            -400

        scale =
            size / 100

        lat =
            0

        lng =
            0

        eye =
            vec3
                (sin lng * cos lat)
                (cos lng * cos lat)
                (sin lat)
                |> Vector3.scale (10 * zoom)

        perspective =
            Matrix4.mul (Matrix4.makePerspective 45 1 0.01 100)
                (Matrix4.makeLookAt eye (vec3 0 0 0) (vec3 0 0 1))
    in
        div
            [ style
                [ ( "width", "800px" )
                , ( "height", "480px" )
                , ( "border", "2px solid #000" )
                , ( "background-color", "white" )
                , ( "position", "absolute" )
                , ( "top", "50%" )
                , ( "left", "50%" )
                , ( "overflow", "hidden" )
                , ( "transform", "translate3d(-50%, -50%, 0)" )
                ]
            ]
            [ WebGL.toHtmlWith
                [ WebGL.alpha True
                , WebGL.depth 1
                , WebGL.antialias
                ]
                [ width (floor size)
                , height (floor size)
                , style
                    [ ( "position", "absolute" )
                    , ( "top", "-" ++ ((toString << floor) top) ++ "px" )
                    , ( "left", "-" ++ ((toString << floor) left) ++ "px" )
                    ]
                ]
                [ globeEntity perspective
                ]
            ]



-- Icosahedron


type alias Vertex =
    { normal : Vec3
    , polar : Vec3
    , position : Vec3
    }


type alias Uniforms =
    { time : Float
    , perspective : Matrix4.Mat4
    }


type alias Varyings =
    { brightness : Float
    , vCoord : Vec2
    }


globeEntity : Matrix4.Mat4 -> WebGL.Entity
globeEntity perspective =
    WebGL.entity vertexShader
        fragmentShader
        mesh
        { perspective = globePerspective
        , time = 0
        }


subdivide : Int -> ( Vec3, Vec3, Vec3 ) -> List ( Vec3, Vec3, Vec3 )
subdivide no ( pt1, pt2, pt3 ) =
    case no of
        0 ->
            [ ( pt1, pt2, pt3 ) ]

        _ ->
            let
                r =
                    Vector3.length pt1

                m12_ =
                    Vector3.add pt1 pt2 |> Vector3.scale 0.5

                m23_ =
                    Vector3.add pt2 pt3 |> Vector3.scale 0.5

                m31_ =
                    Vector3.add pt3 pt1 |> Vector3.scale 0.5

                m12 =
                    Vector3.scale (r / (Vector3.length m12_)) m12_

                m23 =
                    Vector3.scale (r / (Vector3.length m23_)) m23_

                m31 =
                    Vector3.scale (r / (Vector3.length m31_)) m31_
            in
                [ subdivide (no - 1) ( pt1, m12, m31 )
                , subdivide (no - 1) ( m12, pt2, m23 )
                , subdivide (no - 1) ( m12, m23, m31 )
                , subdivide (no - 1) ( m31, m23, pt3 )
                ]
                    |> List.foldl (++) []


icosahedron : List ( Vec3, Vec3, Vec3 )
icosahedron =
    [ ( vec3 -1.0 0.0 -1.618
      , vec3 -1.618 -1.0 0.0
      , vec3 -1.618 1.0 0.0
      )
    , ( vec3 -1.0 0.0 -1.618
      , vec3 -1.618 1.0 0.0
      , vec3 0.0 1.618 -1.0
      )
    , ( vec3 -1.0 0.0 -1.618
      , vec3 0.0 1.618 -1.0
      , vec3 1.0 0.0 -1.618
      )
    , ( vec3 -1.0 0.0 -1.618
      , vec3 0.0 -1.618 -1.0
      , vec3 1.0 0.0 -1.618
      )
    , ( vec3 -1.0 0.0 -1.618
      , vec3 -1.618 -1.0 0.0
      , vec3 0.0 -1.618 -1.0
      )
    , ( vec3 0.0 -1.618 -1.0
      , vec3 1.0 0.0 -1.618
      , vec3 1.618 -1.0 0.0
      )
    , ( vec3 1.0 0.0 -1.618
      , vec3 0.0 1.618 -1.0
      , vec3 1.618 1.0 0.0
      )
    , ( vec3 1.618 -1.0 0.0
      , vec3 1.0 0.0 -1.618
      , vec3 1.618 1.0 0.0
      )
    , ( vec3 0.0 1.618 -1.0
      , vec3 -1.618 1.0 0.0
      , vec3 0.0 1.618 1.0
      )
    , ( vec3 1.618 1.0 0.0
      , vec3 0.0 1.618 -1.0
      , vec3 0.0 1.618 1.0
      )
    , ( vec3 1.618 1.0 0.0
      , vec3 0.0 1.618 1.0
      , vec3 1.0 0.0 1.618
      )
    , ( vec3 1.618 -1.0 0.0
      , vec3 1.618 1.0 0.0
      , vec3 1.0 0.0 1.618
      )
    , ( vec3 0.0 -1.618 -1.0
      , vec3 1.618 -1.0 0.0
      , vec3 0.0 -1.618 1.0
      )
    , ( vec3 0.0 -1.618 1.0
      , vec3 1.618 -1.0 0.0
      , vec3 1.0 0.0 1.618
      )
    , ( vec3 -1.618 -1.0 0.0
      , vec3 0.0 -1.618 -1.0
      , vec3 0.0 -1.618 1.0
      )
    , ( vec3 -1.0 0.0 1.618
      , vec3 -1.618 -1.0 0.0
      , vec3 0.0 -1.618 1.0
      )
    , ( vec3 -1.618 1.0 0.0
      , vec3 -1.618 -1.0 0.0
      , vec3 -1.0 0.0 1.618
      )
    , ( vec3 0.0 1.618 1.0
      , vec3 -1.618 1.0 0.0
      , vec3 -1.0 0.0 1.618
      )
    , ( vec3 1.0 0.0 1.618
      , vec3 0.0 1.618 1.0
      , vec3 -1.0 0.0 1.618
      )
    , ( vec3 -1.0 0.0 1.618
      , vec3 0.0 -1.618 1.0
      , vec3 1.0 0.0 1.618
      )
    ]


floatRem : Float -> Float -> Float
floatRem a b =
    ((a / b) - (a / b |> floor |> toFloat)) * b


type alias Polygon =
    { coordinates : List ( Float, Float )
    , opacities : ( Float, Float )
    }


globePerspective : Matrix4.Mat4
globePerspective =
    let
        theta =
            pi / 3

        phi =
            pi / 2 - pi / 4

        eye =
            vec3
                (sin theta * cos phi)
                (cos theta * cos phi)
                (sin phi)
                |> Vector3.scale 10
    in
        Matrix4.mul (Matrix4.makePerspective 45 1 0.01 100)
            (Matrix4.makeLookAt eye (vec3 0 0 0) (vec3 0 0 1))


rawTriangleToVertexTriangle : ( Vec3, Vec3, Vec3 ) -> ( Vertex, Vertex, Vertex )
rawTriangleToVertexTriangle ( pt1, pt2, pt3 ) =
    let
        normal =
            Vector3.cross (Vector3.sub pt2 pt1) (Vector3.sub pt3 pt1) |> Vector3.normalize
    in
        ( Vertex normal (toPolar pt1) pt1
        , Vertex normal (toPolar pt2) pt2
        , Vertex normal (toPolar pt3) pt3
        )


{-| vec3 x y z -> vec3 radius theta pi
-}
toPolar : Vec3 -> Vec3
toPolar v =
    let
        r =
            Vector3.length v

        vNorm =
            Vector3.scale (1 / r) v

        theta =
            Basics.toPolar ( (Vector3.getX v), (Vector3.getY v) ) |> Tuple.second

        phi =
            Vector3.dot vNorm (vec3 0 0 1) |> acos |> (\angle -> pi / 2 - angle)
    in
        vec3 r theta phi


mesh : WebGL.Mesh Vertex
mesh =
    List.map
        rawTriangleToVertexTriangle
        (List.map (subdivide 3) icosahedron |> List.foldl (++) [])
        |> WebGL.triangles


vertexShader : WebGL.Shader Vertex Uniforms Varyings
vertexShader =
    [glsl|
attribute vec3 position;
attribute vec3 normal;
attribute vec3 polar;
uniform mat4 perspective;
varying float brightness;
varying vec2 vCoord;

void main() {
  float pi = 3.14159265359;

  brightness = 1.0 + (1.0 - dot(
    normalize(vec3(0.3, -0.2, 1)),
    normalize(vec3(normal))
  )) * 0.8;

  vCoord = vec2(
    polar.y / (2.0 * pi) + 0.5,
    polar.z / (1.0 * pi) + 0.5
  );

  gl_Position = perspective * vec4(position, 1.0);
}
|]


fragmentShader : WebGL.Shader {} Uniforms Varyings
fragmentShader =
    [glsl|
precision mediump float;

uniform float time;
varying float brightness;
varying vec2 vCoord;

void main() {
  vec4 color1 = vec4(235.0 / 255.0, 183.0 / 255.0, 73.0 / 255.0);
  vec4 color2 = vec4(60.0 / 255.0, 50.0 / 255.0, 79.0 / 255.0);
  vec4 color = vec4(0.5, 0.3, 0.1, 1.0);
  float luminosity = 0.21 * color.r + 0.72 * color.g + 0.07 * color.b;
  gl_FragColor = vec4(
    luminosity * brightness,
    luminosity * brightness,
    luminosity * brightness,
    1.0
  );
}
|]


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
