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


color : Float -> Float -> Float -> Vec3
color r g b =
    vec3 (r / 255) (g / 255) (b / 255)


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "width", "800px" )
            , ( "height", "480px" )
            , ( "overflow", "hidden" )
            , ( "background-color", "#FFFFFB" )
            , ( "position", "relative" )
            ]
        ]
        [ SimpleWebGL.view
            { fragmentShader = fragmentShader
            , window = { width = 800, height = 480 }
            , styles = [ ( "opacity", "0.8" ) ]
            , makeUniforms =
                \resolution ->
                    { time = (model.time - model.startTime)
                    , resolution = resolution
                    }
            }
        ]


fragmentShader : WebGL.Shader {} (SimpleWebGL.Uniforms {}) SimpleWebGL.Varyings
fragmentShader =
    [glsl|
precision mediump float;

uniform vec2 resolution;
uniform float time;

float rand(float x) {
  return fract(sin(x) * 43758.5453123);
}

float perlin(float x) {
  float i = floor(x);  // integer
  float f = fract(x);  // fraction
  return mix(rand(i), rand(i + 1.0), smoothstep(0.,1.,f));
}

const float n = 38.0;

const vec2 center1 = vec2(0.5, 0.42);
const vec2 center2 = vec2(0.5, 0.58);

const vec3 color1 = vec3(91.0 / 255.0, 95.0 / 255.0, 151.0 / 255.0);
const vec3 color2 = vec3(219.0 / 255.0, 84.0 / 255.0, 97.0 / 255.0);

float gridFloor(float x) {
  return floor(n * x) / n + 0.5 / n;
}

const float pi = 3.14159265358979323;

vec4 getColor(vec2 st, vec2 center, vec3 color) {
  vec2 fromCenter = st - center;
  float d = length(fromCenter);

  float dot = dot(fromCenter / d, vec2(1.0, 0.0));

  float angle = acos(dot);

  if (fromCenter.y < 0.0) {
    angle = 2.0 * pi - acos(dot);
  } else {
    angle = acos(dot);
  }

  float randomArgument = sin(4.0 * angle / pi + 0.8 * time / 2000.0);

  float maxDistance = 0.26 + 0.18 * perlin(randomArgument);
  float fullDistance = maxDistance - 0.10;

  if (d > maxDistance) {
    return vec4(color, 0.0);
  } else if (d > fullDistance) {
    return vec4(color, 1.0 * (1.0 - (d - fullDistance) / (maxDistance - fullDistance)));
  } else {
    return vec4(color, 1.0);
  }
}

vec4 blend(vec4 color1, vec4 color2) {
  float a = 1.0 - (1.0 - color1.a) * (1.0 - color2.a);
  if (a < 0.001) {
    return vec4(0.0, 0.0, 0.0, 0.0);
  }
  float r = color1.r * color1.a / a + color2.r * color2.a * (1.0 - color1.a) / a;
  float g = color1.g * color1.a / a + color2.g * color2.a * (1.0 - color1.a) / a;
  float b = color1.b * color1.a / a + color2.b * color2.a * (1.0 - color1.a) / a;
  return vec4(r, g, b, a);
}

const float rotateAngle = 0.3 * pi;
const mat2 rotate = mat2(cos(rotateAngle), sin(rotateAngle), -sin(rotateAngle), cos(rotateAngle));

void main() {
  vec2 st_original = (gl_FragCoord.xy / resolution.xy - vec2(0.5, 0.5)) * rotate + vec2(0.5, 0.5);

  vec2 st = vec2(gridFloor(st_original.x), gridFloor(st_original.y));

  gl_FragColor = blend(getColor(st, center2, color2), getColor(st, center1, color1));
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
