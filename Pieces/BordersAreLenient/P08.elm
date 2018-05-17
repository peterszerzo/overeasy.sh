module Pieces.BordersAreLenient.P08 exposing (view)

import Html exposing (Html)
import Svg exposing (svg, g, line, circle, path, polygon, polyline)
import Svg.Attributes exposing (viewBox, class, x1, x2, y1, y2, cx, cy, r, d, points)


view : Html msg
view =
    svg [ viewBox "0 0 250 200" ]
        [ g [ class "engrave" ]
            [ path [ d "M124.536,106.73 c-9.41,3.381-18.12,1.814-26.325-0.104" ] []
            , path [ d "M173.044,105.639 c2.669-29.375-21.415-54.246-50.86-52.525" ] []
            , path [ d "M103.586,87.471 c7.155-2.307,14.81-3.141,22.964-2.502" ] []
            , path [ d "M90.112,144.004 c-4.649-3.203-8.312-7.131-10.991-11.781" ] []
            , path [ d "M92.107,140.744 c-4.133-2.348-7.264-5.527-9.393-9.537" ] []
            , path [ d "M96.341,140.08 c-2.138,1.215-4.187,2.559-6.229,3.924" ] []
            , path [ d "M102.13,143.75 c2.5,1.348,5.069,2.451,7.766,3.34" ] []
            , path [ d "M79.121,132.223 c1.76-1.639,3.502-3.295,5.234-4.963" ] []
            ]
        , g [ class "cut" ]
            [ circle [ cx "125", cy "101.273", r "62.362" ] []
            , path [ d "M84.355,127.26 c7.359-7.338,11.902-12.395,13.855-20.633" ] []
            , path [ d "M109.896,147.09 c29.483,9.721,60.339-10.533,63.148-41.451" ] []
            , path [ d "M98.211,106.627 c-6.327-1.477-12.354-3.164-18.169-2.953" ] []
            , path [ d "M96.341,140.08 c1.848,1.365,3.768,2.582,5.789,3.67" ] []
            , path [ d "M122.184,53.113 c-36.793,2.152-57.682,43.096-37.828,74.146" ] []
            , path [ d "M103.586,87.471 c6.864-15.518,12.875-26.045,18.598-34.357" ] []
            , path [ d "M173.044,105.639 c-21.137,8.693-21.595,14.273-27.474,22.338c-4.588,6.293-12.479,14.098-35.675,19.113" ] []
            , path [ d "M80.042,103.674 c5.794-7.609,13.642-13.01,23.544-16.203" ] []
            , path [ d "M102.13,143.75 c3.747-4.441,7.814-8.932,11.186-13.318c-5.658,3.217-11.316,6.434-16.975,9.648" ] []
            ]
        ]