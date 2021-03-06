module Pieces.BordersAreLenient.P32 exposing (view)

import Html exposing (Html)
import Svg exposing (svg, g, line, circle, path, polygon, polyline)
import Svg.Attributes exposing (viewBox, class, x1, x2, y1, y2, cx, cy, r, d, points)


view : Html msg
view =
    svg [ viewBox "0 0 250 200" ]
        [ g [ class "engrave" ]
            [ path [ d "M134.904,83.94 c3.039,2.294,5.521,4.718,12.481,4.102c0,0,1.664-0.204,3.792-1.134" ] []
            , path [ d "M121.125,149.359 c6.507,0.524,12.525-0.18,18.735-2.189" ] []
            , path [ d "M107.902,134.509 c1.355-1.031,0.58-4.59,1.237-8.6c0.332-2.021,0.759-4.867,1.611-7.771" ] []
            , path [ d "M126.783,149.482 c14.027-19.515,5.188-38.499,5.188-38.499s-3.66-12.808-21.513-23.718" ] []
            , path [ d "M144.369,140.259 c1.605-3.017,3.134-6.704,4.039-10.923" ] []
            , path [ d "M172.62,108.994 c0.188-1.165,0.335-2.334,0.438-3.511" ] []
            , path [ d "M83.562,125.977 c1.088,1.824,2.281,3.557,3.599,5.223" ] []
            , path [ d "M128.447,123.227 c0.451,6.44-1.819,13.091-3.647,17.323" ] []
            , path [ d "M80.235,119.259 c0.644,1.601,1.368,3.157,2.179,4.68" ] []
            , path [ d "M85.378,128.794 c3.882-2.003,9.306-4.343,13.957-4.664" ] []
            , path [ d "M121.805,106.247 c7.068-1.201,10.166,4.736,10.166,4.736s-2.392-7.164-0.189-10.929c1.828-3.124,4.741-4.392,8.416-3.963" ] []
            , path [ d "M109.237,125.312 c6.491,1.712,11.917,4.848,18.351,6.95" ] []
            , path [ d "M105.32,91.636 c4.252-4.056,8.775-7.288,13.493-9.16" ] []
            , path [ d "M147.135,133.913 c4.584-0.653,9.797-2.014,15.865-4.353" ] []
            , path [ d "M120.062,82.014 c1.911-0.655,3.853-1.083,5.819-1.248c0,0,1.693-0.271,3.485,0.244c0.387,0.111,0.754,0.233,1.104,0.365" ] []
            , path [ d "M132.471,72.302 c-1.809,1.199-3.681,2.313-6.066,2.89c-2.085,0.504-4.115,1.163-6.091,1.962" ] []
            , path [ d "M106.841,85.191 c-5.275-2.837-11.615-5.471-19.222-7.62" ] []
            , path [ d "M130.792,90.096 c0,0-0.247,2.675-0.294,6.164c-0.046,3.49,0.439,6.516,0.439,6.516" ] []
            , path [ d "M153.572,77.87 c0,0-10.384-2.995-19.022,1.295" ] []
            , path [ d "M114.076,80.216 c-4.398,2.55-8.484,5.763-12.258,9.39" ] []
            , path [ d "M123.153,106.102 c0,0-3.108-3.506-7.739-7.4" ] []
            , path [ d "M120.115,83.165 c3.437,1.863,7.036,4.143,10.677,6.931" ] []
            , path [ d "M157.307,79.94 c-0.717-0.709-1.939-1.635-3.734-2.07c0,0,2.328-0.612,3.864-1.799" ] []
            , path [ d "M99.133,119.241 c-0.278,5.613,1.154,10.147,3.197,12.835" ] []
            ]
        , g [ class "cut" ]
            [ path [ d "M163,129.561 c-6.407,5.737-12.654,9.044-18.631,10.698" ] []
            , path [ d "M128.447,123.227 c-5.345-2.497-10.24-4.817-17.696-5.089" ] []
            , path [ d "M124.8,140.55 c-6.286-1.377-11.984-3.85-16.897-6.041" ] []
            , path [ d "M173.058,105.483 c-1.99-1.197-4.794-2.938-5.209-3.461c-2.915-3.69-2.896-5.589-8.404-9.428c-2.743-1.912-5.16-3.941-8.267-5.687" ] []
            , path [ d "M99.133,119.241 c-6.967,1.589-12.307,4.535-15.57,6.735" ] []
            , path [ d "M102.33,132.076 c-2.65-1.085-4.963-1.843-6.891-1.938c-3.023-0.147-5.808,0.305-8.278,1.061" ] []
            , path [ d "M82.414,123.938 c0.366,0.689,0.749,1.367,1.148,2.038" ] []
            , path [ d "M173.058,105.483 c2.722-31.062-24.296-56.506-55.139-51.93c-30.843,4.577-49.308,36.771-37.684,65.705" ] []
            , path [ d "M87.161,131.199 c8.309,10.506,20.612,17.084,33.964,18.16" ] []
            , path [ d "M139.86,147.17 c17.216-5.574,29.863-20.313,32.76-38.176" ] []
            , path [ d "M102.33,132.076 c1.008,1.325,2.164,2.202,3.336,2.535c1.079,0.307,1.779,0.246,2.236-0.103" ] []
            , path [ d "M139.86,147.17 c1.217-1.542,2.901-3.891,4.509-6.911" ] []
            , path [ d "M148.408,129.336 c1.946-9.071,1.014-20.605-8.211-33.244" ] []
            , path [ d "M163,129.561 c-5.727,0.369-10.5,0.239-14.592-0.225" ] []
            , path [ d "M134.904,83.94 c-2.295,0.865-3.915,2.673-4.116,5.816c0,0-0.498-4.048-0.318-8.382" ] []
            , path [ d "M132.471,72.302 c0.957-2.181,2.08-3.953,2.902-5.187c0.648-0.974,4.559-5.577,1.119-7.105c-3.032-1.348-14.3,3.778-16.179,17.144" ] []
            , path [ d "M101.818,89.605 c-5.055-2.855-8.135-4.26-9.979-5.208c-2.461-1.265-4.982-3.331-4.221-6.826c0.357-1.634,3.291-3.276,7.344-2.759 c1.958,0.251,9.452,1.188,19.113,5.403" ] []
            , path [ d "M124.8,140.55 c-0.854,1.975-1.611,3.422-1.951,4.075c-0.43,0.826-1.295,2.73-1.724,4.734" ] []
            , path [ d "M140.197,96.092 c0.754,0.088,1.539,0.247,2.354,0.477c5.43,1.527,13.658,7.323,18.455,7.876c4.796,0.552,3.723,0.272,5.204,0.61 c1.199,0.274,5.004,2.937,6.409,3.939" ] []
            , path [ d "M121.805,106.247 c5.691,6.832,6.598,16.438,6.614,16.615c0,0.003,0.015,0.184,0.028,0.364" ] []
            , path [ d "M110.751,118.138 c1.409-4.799,3.979-9.759,9.201-11.434c0.646-0.207,1.263-0.357,1.853-0.457" ] []
            , path [ d "M82.414,123.938 c5.855-11.012,13.75-23.567,22.906-32.303" ] []
            , path [ d "M118.813,82.476 c0.415-0.165,0.831-0.318,1.248-0.462" ] []
            , path [ d "M151.178,86.908 c2.259-0.987,5.041-2.791,6.912-6.034c0,0-0.252-0.407-0.783-0.934" ] []
            , path [ d "M130.47,81.375 c1.815,0.681,3.173,1.612,4.435,2.565" ] []
            , path [ d "M120.313,77.153 c-2.145,0.865-4.224,1.895-6.237,3.062" ] []
            , path [ d "M101.818,89.605 c-8.984,8.64-16.191,19.636-21.583,29.653" ] []
            , path [ d "M115.414,98.701 c-5.139-0.68-12.969,4.098-15.508,15.076c-0.44,1.909-0.688,3.737-0.773,5.464" ] []
            , path [ d "M115.414,98.701 c-2.303-1.936-4.981-3.967-7.842-5.711c-0.783-0.478-1.532-0.928-2.252-1.354" ] []
            , circle [ cx "125", cy "101.273", r "62.362" ] []
            , path [ d "M120.062,82.014 c0.01,0.32,0.024,0.644,0.054,1.151" ] []
            , path [ d "M118.813,82.476 c0.431,0.223,0.865,0.453,1.302,0.689" ] []
            , path [ d "M157.437,76.071 c0.33-0.255,0.624-0.536,0.85-0.844c1.277-1.737-3.47-7.131-12.896-7.565c-6.201-0.286-9.441,2.334-12.919,4.64" ] []
            , path [ d "M157.434,76.072 c0,0,1.941,1.546-0.127,3.868" ] []
            ]
        ]
