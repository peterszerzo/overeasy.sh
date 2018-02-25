module Views.Bg exposing (..)

import Time
import Html exposing (Html)
import Html.Attributes exposing (style)
import Math.Vector2 as Vector2 exposing (Vec2, vec2)
import WebGL
import Window


view : Window.Size -> Time.Time -> Html msg
view window time =
    let
        size =
            max window.width window.height

        top =
            if window.width > window.height then
                (toFloat window.height - toFloat window.width) / 2
            else
                0

        left =
            if window.height > window.width then
                (toFloat window.width - toFloat window.height) / 2
            else
                0
    in
        WebGL.toHtml
            [ Html.Attributes.width size
            , Html.Attributes.height size
            , Html.Attributes.style
                [ ( "top", (toString top) ++ "px" )
                , ( "left", (toString left) ++ "px" )
                , ( "z-index", "1" )
                , ( "position", "absolute" )
                ]
            ]
            [ WebGL.entity vertexShader
                fragmentShader
                mesh
                { resolution = vec2 (toFloat size) (toFloat size)
                , time = time
                }
            ]


mesh : WebGL.Mesh Vertex
mesh =
    [ ( vec2 -1.0 -1.0 |> Vertex, vec2 1.0 -1.0 |> Vertex, vec2 -1.0 1.0 |> Vertex )
    , ( vec2 -1.0 1.0 |> Vertex, vec2 1.0 -1.0 |> Vertex, vec2 1.0 1.0 |> Vertex )
    ]
        |> WebGL.triangles


type alias Vertex =
    { position : Vec2
    }


type alias Uniforms =
    { resolution : Vec2
    , time : Float
    }


type alias Varyings =
    {}


vertexShader : WebGL.Shader Vertex Uniforms Varyings
vertexShader =
    [glsl|
attribute vec2 position;
void main() {
  gl_Position = vec4(position, 0.0, 1.0);
}
|]


fragmentShader : WebGL.Shader {} Uniforms Varyings
fragmentShader =
    [glsl|
precision highp float;
uniform vec2 resolution;
uniform float time;

float polarAngle(vec2 pt) {
  if (length(pt) < 0.001) {
    return 0.0;
  }
  float cos = dot(pt / length(pt), vec2(1.0, 0.0));
  float angle = acos(cos);
  if (pt.y < 0.0) {
    return 2.0 * 3.14159 - angle;
  }
  return angle;
}

void main() {
  vec2 st = gl_FragCoord.xy / resolution.xy;
  st.x *= resolution.x / resolution.y;
  vec2 coord = st - vec2(0.5, 0.5);
  float angle = polarAngle(coord);
  vec4 color;
  float wave1 = 0.03 * sin(4.0 * angle + 0.1 - time * 0.0002);
  float wave2 = 0.01 * sin(3.0 * angle + 0.1 + time * 0.0006);
  float wave3 = 0.025 * sin(5.0 * angle + 0.1 - time * 0.0002);
  float wave4 = 0.015 * sin(4.0 * angle + 0.1 + time * 0.0006);
  if (length(coord) < 0.3 + wave1 + wave2) {
    color = vec4(0.0, 0.0, 0.0, 0.0);
  } else if (length(coord) < 0.32 + wave3 + wave4) {
    color = vec4(0.0, 0.0, 0.0, 0.05);
  } else {
    color = vec4(0.0, 0.0, 0.0, 0.08);
  }
  gl_FragColor = color;
}
|]
