module Pieces.BordersAreLenient.P12 exposing (view)

import Html exposing (Html)
import Svg exposing (svg, g, line, circle, path, polygon, polyline)
import Svg.Attributes exposing (viewBox, class, x1, x2, y1, y2, cx, cy, r, d, points)


view : Html msg
view =
    svg [ viewBox "0 0 250 200" ]
        [ g [ class "engrave" ]
            [ path [ d "M97.222,141.994 c1.781,1.256,3.628,2.377,5.562,3.381" ] []
            , path [ d "M83.125,126.506 c0.982,1.717,2.059,3.357,3.242,4.941" ] []
            , path [ d "M80.79,83.244 c-1.173,2.686-2.083,5.422-2.754,8.275" ] []
            , path [ d "M94.225,65.4 c-1.701,1.41-3.287,2.918-4.78,4.547" ] []
            , path [ d "M111.144,96.395 c0,0,16.271-1.441,25.337-4.238" ] []
            , path [ d "M142.107,94.021 c-1.463,0.352-2.928,0.701-4.393,1.051c-0.54,0.129-3.811,0.838-4.311,1.221c-2.395,1.826-4.814,3.619-7.25,5.389" ] []
            , line [ x1 "142.35", y1 "98.174", x2 "142.223", y2 "103.279" ] []
            , circle [ cx "142.296", cy "100.705", r "3.061" ] []
            , circle [ cx "142.222", cy "100.736", r "4.343" ] []
            , path [ d "M142.356,107.48 c2.022-0.908,4.179-1.803,6.476-2.676c4.184-1.412,8.368-2.822,12.553-4.234" ] []
            , line [ x1 "185.208", y1 "86.305", x2 "171.306", y2 "89.021" ] []
            , line [ x1 "172.885", y1 "96.693", x2 "186.48", y2 "92.107" ] []
            , path [ d "M172.113,112.924 c0.607-2.758,0.967-5.516,1.086-8.338" ] []
            ]
        , g [ class "cut" ]
            [ path [ d "M173.199,104.586 c0.111-2.648,0.008-5.262-0.314-7.893" ] []
            , path [ d "M171.306,89.021 c-9.729-33.295-50.367-45.748-77.081-23.621" ] []
            , path [ d "M126.154,101.682 c-5.222,3.797-15.139,10.826-21.062,13.623c-1.928,0.91-3.978,1.246-5.994,1.781c-2.033,0.539-3.992,1.229-5.909,2.096 c-3.936,1.781-7.26,3.924-10.063,7.324" ] []
            , path [ d "M86.367,131.447 c3.097,4.139,6.629,7.57,10.854,10.547" ] []
            , path [ d "M78.036,91.52 c-2.792,11.887-0.974,24.389,5.089,34.986" ] []
            , path [ d "M161.385,100.57 c3.833-1.293,7.666-2.584,11.5-3.877" ] []
            , line [ x1 "161.385", y1 "100.57", x2 "173.199", y2 "104.586" ] []
            , path [ d "M94.225,65.4 c5.359,0.535,17.804,2.492,23.147,9.344c6.906,8.854,8.686,14.531,22.244,18.43c0.831,0.283,1.663,0.564,2.495,0.848" ] []
            , path [ d "M126.154,101.682 c-3.895-1.375-7.791-2.75-11.688-4.119c-0.527-0.186-2.754-1.18-3.379-1.168c-0.873,0.018-1.744,0.012-2.617,0 c-2.064-0.027-4.127-0.105-6.189-0.23c-7.548-0.457-17.092-1.676-24.245-4.645" ] []
            , path [ d "M91.484,83.938 c0,0,8.39,2.119,12.965,5.254c4.576,3.135,9.236-1.355,9.236-4.492c0-3.135-1.017-11.693-14.914-13.812 c-3.587-0.547-6.672-0.844-9.327-0.939" ] []
            , path [ d "M89.444,69.947 c-3.671,4.002-6.48,8.32-8.654,13.297" ] []
            , path [ d "M80.79,83.244 c2.277-0.279,5.338-0.521,10.694,0.693" ] []
            , path [ d "M86.367,131.447 c1.352-3.707,4.595-6.646,8.14-8.105c3.43-1.41,8.095-1.699,11.175,1.039c3.281,2.916,2.843,7.436,0.836,10.826 c-1.994,3.371-5.53,5.863-9.296,6.787" ] []
            , circle [ cx "125", cy "102.553", r "62.362" ] []
            , path [ d "M172.113,112.924 c-4.984-0.992-9.969-1.982-14.953-2.975c-2.492-0.496-4.984-0.992-7.477-1.486c-0.707-0.141-1.414-0.281-2.121-0.422 c-0.354-0.07-0.707-0.141-1.061-0.211c-0.135-0.027-0.254-0.277-0.403-0.08c-0.005,0.006-0.009,0.012-0.014,0.016 c-0.029,0.033-0.062,0.062-0.097,0.092c-1.201,0.967-2.605,0.004-3.632-0.377" ] []
            , path [ d "M171.306,89.021 c-4.87,0.951-9.741,1.904-14.611,2.855c-2.435,0.477-4.87,0.951-7.306,1.428c-0.672,0.131-1.344,0.262-2.016,0.395 c-0.168,0.033-0.336,0.064-0.504,0.098c-0.13,0.025-0.225,0.178-0.389,0.076h-0.001c-0.007-0.004-0.015-0.008-0.021-0.014 c-0.04-0.021-0.082-0.041-0.124-0.061c-0.183-0.08-0.369-0.137-0.563-0.182c-1.325-0.299-2.449,0.111-3.663,0.404" ] []
            , path [ d "M102.784,145.375 c3.413-2.199,6.831-6.207,9.8-13.051c0,0,4.54-13.51,29.772-24.844" ] []
            , path [ d "M102.784,145.375 c28.159,14.609,62.511-1.471,69.329-32.451" ] []
            ]
        ]