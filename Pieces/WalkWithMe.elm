module Pieces.WalkWithMe exposing (..)

import Time
import AnimationFrame
import Html exposing (Html, Attribute, div, program)
import Html.Attributes exposing (style)
import WebGL
import Concepts.SimpleWebGL as SimpleWebGL
import Math.Vector2 exposing (Vec2, vec2)
import Math.Vector3 exposing (Vec3, vec3)


type alias Model =
    { time : Time.Time
    , startTime : Time.Time
    }


type Msg
    = Tick Time.Time


init : ( Model, Cmd Msg )
init =
    ( { time = 0
      , startTime = 0
      }
    , Cmd.none
    )


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
                | startTime =
                    if model.startTime == 0 then
                        time
                    else
                        model.startTime
                , time = time
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ AnimationFrame.times Tick
        ]


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "width", "800px" )
            , ( "height", "480px" )
            , ( "overflow", "hidden" )
            , ( "background-color", "#FFFFFF" )
            , ( "border", "2px solid #000" )
            , ( "position", "relative" )
            ]
        ]
        [ SimpleWebGL.view
            { fragmentShader = fragmentShader
            , window = { width = 800, height = 480 }
            , styles = [ ( "opacity", "0.3" ) ]
            , makeUniforms =
                \resolution ->
                    { time = (model.time - model.startTime)
                    , resolution = resolution
                    , center = vec2 0.5 0.42
                    , color = vec3 0.2 0.6 0.1
                    }
            }
        , SimpleWebGL.view
            { fragmentShader = fragmentShader
            , window = { width = 800, height = 480 }
            , styles = [ ( "opacity", "0.3" ) ]
            , makeUniforms =
                \resolution ->
                    { time = (model.time - model.startTime)
                    , resolution = resolution
                    , center = vec2 0.5 0.58
                    , color = vec3 0.2 0.6 0.8
                    }
            }
        ]


fragmentShader : WebGL.Shader {} (SimpleWebGL.Uniforms { center : Vec2, color : Vec3 }) SimpleWebGL.Varyings
fragmentShader =
    [glsl|
precision mediump float;

uniform vec2 resolution;
uniform vec2 center;
uniform vec3 color;
uniform float time;

float rand(float x) {
  return fract(sin(x) * 43758.5453123);
}

float perlin(float x) {
  float i = floor(x);  // integer
  float f = fract(x);  // fraction
  return mix(rand(i), rand(i + 1.0), smoothstep(0.,1.,f));
}

const float n = 26.0;

float gridFloor(float x) {
  return floor(n * x) / n + 0.5 / n;
}

const float pi = 3.14159265358979323;
const float rotateAngle = 0.3 * pi;
const mat2 rotate = mat2(cos(rotateAngle), sin(rotateAngle), -sin(rotateAngle), cos(rotateAngle));

void main() {

  vec2 st_original = (gl_FragCoord.xy / resolution.xy - vec2(0.5, 0.5)) * rotate + vec2(0.5, 0.5);

  vec2 st = vec2(gridFloor(st_original.x), gridFloor(st_original.y));

  vec2 stc = st * 10.0;
  vec2 ipos = floor(stc);
  vec2 fpos = fract(stc);

  vec2 fromCenter = st - center;
  float d = length(fromCenter);

  float dot = dot(fromCenter / d, vec2(1.0, 0.0));

  float angle = acos(dot);

  if (fromCenter.y < 0.0) {
    angle = 2.0 * pi - acos(dot);
  } else {
    angle = acos(dot);
  }

  float randomArgument = sin(6.0 * angle / pi + 0.8 * time / 2000.0);

  float maxDistance = 0.22 + 0.18 * perlin(randomArgument);
  float fullDistance = maxDistance - 0.10;

  if (d > maxDistance) {
    discard;
  } else if (d > fullDistance) {
    gl_FragColor = vec4(color, 0.80 * (1.0 - (d - fullDistance) / (maxDistance - fullDistance)));
  } else {
    gl_FragColor = vec4(color, 0.80);
  }
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
