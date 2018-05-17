module Pieces.BordersAreLenient.P29 exposing (view)

import Html exposing (Html)
import Svg exposing (svg, g, line, circle, path, polygon, polyline)
import Svg.Attributes exposing (viewBox, class, x1, x2, y1, y2, cx, cy, r, d, points)


view : Html msg
view =
    svg [ viewBox "0 0 250 200" ]
        [ g [ class "engrave" ]
            [ path [ d "M82.647,123.569 c-1.061-0.245-2.092-0.49-3.086-0.734" ] []
            , path [ d "M88.946,132.837 c3.32,3.839,7.018,6.97,11.35,9.614" ] []
            , path [ d "M152.502,141.203 c2.264-1.536,4.359-3.232,6.334-5.127" ] []
            , path [ d "M128.401,131.891 c0,0-20.992-3.138-38.555-6.759" ] []
            , path [ d "M157.336,120.137 c-9.652,3.455-20.285,7.583-28.936,11.754" ] []
            , line [ x1 "173.131", y1 "108.472", x2 "184.178", y2 "111.262" ] []
            , path [ d "M184.178,111.262 c0,0-5.084,1.518-12.574,3.982" ] []
            , path [ d "M126.104,149.511 c1.221,0.723,2.416,1.518,3.574,2.39c1.244-1.112,2.496-2.128,3.756-3.054" ] []
            , path [ d "M121.881,112.354 c-3.238-1.629-9.537-3.966-15.01-3.197c-8.783,1.231-11.479,9.207-20.582,5.658" ] []
            , path [ d "M79.561,122.835 c0,0,1.252-0.144,2.381-0.679" ] []
            , path [ d "M125.811,111.912 c-2.053-0.979-3.004-0.495-3.854,0.364c-1.244,1.258-0.541,2.091,1.055,2.479c1.598,0.387,2.35,0.459,3.453-0.389 C127.065,113.904,127.862,112.891,125.811,111.912z" ] []
            ]
        , g [ class "cut" ]
            [ path [ d "M89.846,125.132 c-0.691,1.322-1.32,3.952-0.9,7.705" ] []
            , path [ d "M100.295,142.451 c6.943,0.345,17.018,1.853,25.809,7.06" ] []
            , path [ d "M83.379,118.66c0,0,7.51-1.874,0.982-5.063 " ] []
            , path [ d "M84.362,113.597 c0,0,4.518-2.862-0.426-4.609" ] []
            , path [ d "M83.936,108.987 c6.107-2.333,25.033-9.507,37.422-13.59" ] []
            , path [ d "M173.131,108.472 c4.844-32.099-22.76-59.724-54.861-54.906c-32.104,4.817-50.381,39.327-36.328,68.591" ] []
            , path [ d "M133.434,148.847 c6.324-4.65,12.811-7.014,19.068-7.644" ] []
            , line [ x1 "121.358", y1 "95.397", x2 "173.131", y2 "108.472" ] []
            , circle [ cx "125.429", cy "101.273", r "62.362" ] []
            , path [ d "M171.604,115.244 c-4.166,1.37-9.074,3.034-14.268,4.893" ] []
            , path [ d "M133.434,148.847 c7.059-1.188,13.143-3.627,19.068-7.644" ] []
            , path [ d "M158.836,136.076 c0.896-3.672,1.23-9.196-1.5-15.939" ] []
            , path [ d "M158.836,136.076 c6.252-6.001,10.258-12.536,12.768-20.832" ] []
            , path [ d "M82.647,123.569 c1.75,3.356,3.822,6.405,6.299,9.268" ] []
            , path [ d "M89.846,125.132 c-2.492-0.515-4.914-1.037-7.199-1.562" ] []
            , path [ d "M81.942,122.156 c1.234-0.586,2.318-1.644,1.438-3.496" ] []
            , path [ d "M100.295,142.451 c7.766,4.739,16.713,7.187,25.809,7.06" ] []
            ]
        ]