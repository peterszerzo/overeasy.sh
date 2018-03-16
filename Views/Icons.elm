module Views.Icons exposing (..)

import Svg.Styled exposing (svg, path)
import Svg.Styled.Attributes exposing (viewBox, d)


logo =
    svg [ viewBox "0 0 1000 1000" ]
        [ path [ d "M902.954,910.902c-9.093,0 -17.151,3.213 -29.828,11.37c-1.498,0.964 -3.065,1.995 -5.112,3.358c-0.468,0.312 -4.274,2.855 -5.424,3.619c-25.535,16.96 -43.195,24.336 -69.024,24.336c-25.371,0 -42.488,-6.645 -72.197,-23.728c-3.163,-1.821 -4.686,-2.697 -6.241,-3.583c-19.634,-11.188 -30.768,-15.372 -44.225,-15.372c-2.672,0 -5.579,0.578 -8.861,1.811c-10.932,4.105 -7.808,1.666 -49.954,37.04c-38.337,32.177 -67.321,47.368 -105.324,47.246c-38.404,-0.123 -65.971,-15.985 -98.634,-48.218c-3.515,-3.467 -14.799,-14.931 -16.643,-16.767c-5.796,-5.769 -10.147,-9.776 -14.167,-12.961c-7.241,-5.737 -12.644,-8.151 -17.248,-8.151c-9.862,0 -18.701,3.013 -31.538,10.228c-2.062,1.159 -4.221,2.416 -7.065,4.104c-0.544,0.323 -5.944,3.543 -7.592,4.517c-27.924,16.497 -48.121,23.834 -77.068,23.834c-28.968,0 -48.773,-7.293 -76.441,-23.898c-1.459,-0.875 -6.434,-3.885 -6.367,-3.845c-2.429,-1.465 -4.244,-2.545 -5.99,-3.56c-13.969,-8.112 -23.163,-11.38 -34.015,-11.38l-54.057,0c-9.907,0 -17.939,-8.037 -17.939,-17.951c0,-9.914 8.032,-17.951 17.939,-17.951l54.057,0c18.369,0 33.08,5.229 52.024,16.231c1.95,1.132 3.921,2.305 6.506,3.865c-0.018,-0.011 4.901,2.964 6.296,3.802c22.599,13.562 36.781,18.785 57.987,18.785c21.284,0 35.928,-5.32 58.828,-18.849c1.57,-0.927 6.923,-4.12 7.526,-4.478c3.067,-1.82 5.449,-3.207 7.801,-4.529c17.721,-9.959 32,-14.827 49.108,-14.827c13.979,0 26.511,5.598 39.52,15.905c5.287,4.189 10.526,9.014 17.199,15.656c2.039,2.03 13.249,13.418 16.532,16.657c26.612,26.262 46.652,37.793 73.556,37.879c27.337,0.088 49.762,-11.665 82.151,-38.851c2.149,-1.803 4.318,-3.646 7.251,-6.153c1.806,-1.544 1.806,-1.544 3.61,-3.087c1.446,-1.237 2.538,-2.17 3.604,-3.077c5.874,-4.999 10.214,-8.587 14.491,-11.926c11.546,-9.014 21.359,-15.115 31.452,-18.904c7.14,-2.681 14.267,-4.099 21.465,-4.099c21.27,0 37.357,6.045 61.979,20.076c1.625,0.925 3.216,1.84 6.363,3.652c24.629,14.162 36.975,18.955 54.321,18.955c17.162,0 29.01,-4.949 49.182,-18.347c1.101,-0.731 4.88,-3.256 5.386,-3.593c2.191,-1.459 3.902,-2.585 5.586,-3.668c17.942,-11.546 31.812,-17.075 49.234,-17.075l40.107,0c9.907,0 17.939,8.037 17.939,17.951c0,9.914 -8.031,17.951 -17.939,17.951l-40.107,0Zm-3.103,-365.891c-5.382,0.674 -9.755,3.146 -13.118,7.415l-61.892,77.521l-61.723,-77.521c-3.476,-4.269 -7.905,-6.741 -13.287,-7.415c-5.494,-0.562 -10.371,0.899 -14.632,4.382c-4.261,3.37 -6.671,7.752 -7.232,13.145c-0.673,5.505 0.729,10.392 4.205,14.661l72.823,91.34l0,97.575c0,5.505 1.963,10.224 5.887,14.156c3.812,3.82 8.465,5.73 13.959,5.73c5.494,0 10.147,-1.91 13.959,-5.73c3.925,-3.932 5.887,-8.651 5.887,-14.156l0,-97.575l72.823,-91.34c3.476,-4.269 4.934,-9.156 4.373,-14.661c-0.673,-5.393 -3.139,-9.775 -7.4,-13.145c-4.261,-3.483 -9.138,-4.944 -14.632,-4.382Zm-295.163,140.043c-27.47,-0.449 -48.493,-8.37 -63.069,-23.762c-11.997,-12.807 -17.603,-27.693 -16.818,-44.658c0.897,-20.223 8.914,-37.3 24.05,-51.231c15.137,-13.932 33.301,-20.897 54.492,-20.897c18.276,0 34.646,3.932 49.11,11.796c17.379,9.438 28.423,23.144 33.132,41.12c1.345,5.28 0.616,10.28 -2.187,14.999c-2.691,4.718 -6.671,7.752 -11.941,9.1c-5.269,1.348 -10.259,0.674 -14.968,-2.022c-4.709,-2.809 -7.736,-6.854 -9.082,-12.134c-2.018,-7.528 -7.568,-13.426 -16.65,-17.695c-7.961,-3.708 -17.099,-5.561 -27.414,-5.561c-10.54,0 -19.622,3.314 -27.246,9.943c-7.512,6.628 -11.493,14.717 -11.941,24.267c-0.224,5.842 1.85,11.122 6.223,15.841c6.951,7.303 18.612,11.067 34.982,11.291l0.841,0c27.47,0.45 48.493,8.426 63.069,23.931c11.997,12.695 17.603,27.581 16.818,44.658c-0.897,20.111 -8.913,37.132 -24.05,51.063c-15.249,13.931 -33.412,20.897 -54.492,20.897c-18.276,0 -34.645,-3.932 -49.109,-11.797c-17.379,-9.437 -28.423,-23.143 -33.132,-41.119c-1.346,-5.281 -0.673,-10.28 2.018,-14.999c2.803,-4.719 6.839,-7.752 12.109,-9.1c5.27,-1.349 10.259,-0.674 14.968,2.022c4.71,2.809 7.737,6.853 9.082,12.134c2.018,7.527 7.512,13.425 16.482,17.695c8.073,3.707 17.267,5.561 27.582,5.561c10.54,0 19.566,-3.314 27.078,-9.943c7.624,-6.516 11.661,-14.605 12.109,-24.267c0.225,-5.843 -1.85,-11.067 -6.223,-15.673c-6.951,-7.415 -18.611,-11.235 -34.982,-11.46l-0.841,0Zm-267.748,49.546l-16.146,39.098c-3.364,8.201 -9.474,12.302 -18.332,12.302c-2.579,0 -5.102,-0.506 -7.568,-1.517c-5.046,-2.134 -8.634,-5.729 -10.764,-10.785c-2.018,-5.056 -2.018,-10.112 0,-15.167l21.359,-51.4l0,-0.169l61.892,-149.649c0.224,-0.561 0.504,-1.123 0.841,-1.685l0.336,-0.842c0.336,-0.45 0.561,-0.731 0.673,-0.843c0,-0.112 0.168,-0.393 0.504,-0.843l0.673,-0.674c0,-0.112 0.168,-0.337 0.505,-0.674c0.448,-0.449 0.672,-0.73 0.672,-0.843c0.113,-0.112 0.337,-0.28 0.673,-0.505c0.449,-0.449 0.729,-0.674 0.841,-0.674c-0.112,0 0.112,-0.169 0.673,-0.506c0.448,-0.337 0.729,-0.562 0.841,-0.674l0.672,-0.505c0.561,-0.337 0.897,-0.506 1.01,-0.506c0.224,-0.112 0.616,-0.281 1.177,-0.506c0.56,-0.337 0.729,-0.449 0.504,-0.337l0.673,-0.337c0.561,-0.112 0.953,-0.224 1.177,-0.337c0.113,0 0.505,-0.112 1.178,-0.337l0.672,-0.168c0.225,0 0.617,-0.056 1.178,-0.169l0.841,-0.168l3.868,0l1.009,0.168l0.841,0.169c0.224,0 0.617,0.112 1.177,0.337c0.673,0.112 0.897,0.168 0.673,0.168c1.345,0.337 2.579,0.843 3.7,1.517c-0.112,-0.112 0.112,0 0.673,0.337c0.56,0.337 0.897,0.562 1.009,0.674l0.673,0.506c0.448,0.337 0.728,0.561 0.84,0.674c0.113,0 0.337,0.168 0.673,0.505c0.337,0.337 0.617,0.562 0.841,0.674c0,0.113 0.168,0.338 0.505,0.675c0.448,0.449 0.672,0.73 0.672,0.842l0.505,0.674c0.448,0.45 0.673,0.731 0.673,0.843c0,0.112 0.168,0.393 0.504,0.843c0.337,0.449 0.505,0.73 0.505,0.842c0.336,0.562 0.616,1.124 0.841,1.685l61.891,149.649l0,0.169l21.36,51.4c2.018,5.055 2.018,10.111 0,15.167c-2.131,5.056 -5.718,8.651 -10.764,10.785c-2.467,1.011 -4.989,1.517 -7.568,1.517c-8.858,0 -14.969,-4.101 -18.332,-12.302l-16.146,-39.098l-97.378,0Zm-231.926,-190.6l121.597,0.337c5.494,0 10.203,1.966 14.127,5.898c3.813,3.933 5.719,8.651 5.719,14.156c0,5.505 -1.963,10.168 -5.887,13.988c-3.812,3.932 -8.465,5.898 -13.959,5.898l-0.168,0l-101.583,-0.337l0,61.174l73.328,0c5.494,0 10.203,1.91 14.127,5.73c3.925,3.932 5.887,8.651 5.887,14.156c0,5.505 -1.962,10.224 -5.887,14.156c-3.924,3.82 -8.633,5.73 -14.127,5.73l-73.328,0l0,61.174l101.751,0c5.494,0 10.147,1.966 13.959,5.898c3.924,3.932 5.887,8.651 5.887,14.156c0,5.505 -1.963,10.168 -5.887,13.988c-3.812,3.932 -8.465,5.898 -13.959,5.898l-121.765,0c-5.494,0 -10.147,-1.966 -13.96,-5.898c-3.924,-3.82 -5.886,-8.483 -5.886,-13.988l0,-202.06c0,-5.617 1.962,-10.336 5.886,-14.156c3.812,-3.932 8.465,-5.898 13.96,-5.898l0.168,0Zm248.239,150.997l64.751,0l-32.459,-78.195l-32.292,78.195Zm-100.305,-282.555c-23.63,23.705 -52.075,35.558 -85.336,35.558c-33.261,0 -61.65,-11.853 -85.167,-35.558c-23.63,-23.594 -35.445,-52.074 -35.445,-85.442c0,-33.368 11.815,-61.904 35.445,-85.61c23.517,-23.593 51.906,-35.39 85.167,-35.39c33.261,0 61.706,11.797 85.336,35.39c23.518,23.706 35.276,52.242 35.276,85.61c0,33.368 -11.758,61.848 -35.276,85.442Zm230.473,-203.24c-4.928,2.359 -8.287,6.123 -10.079,11.291l-51.739,147.795l-51.739,-147.795c-1.792,-5.168 -5.151,-8.932 -10.079,-11.291c-4.927,-2.359 -9.967,-2.64 -15.118,-0.843c-5.152,1.798 -8.903,5.168 -11.255,10.112c-2.352,4.943 -2.632,9.999 -0.84,15.167l70.385,201.049l0,0.168c0.336,0.787 0.728,1.629 1.176,2.528c0.112,0.225 0.224,0.393 0.336,0.506c0.448,0.786 0.896,1.516 1.344,2.19c0,0.113 0.112,0.281 0.336,0.506c0.448,0.562 0.952,1.123 1.511,1.685c0.336,0.337 0.504,0.45 0.504,0.337c0.56,0.674 1.232,1.236 2.016,1.685l0.336,0.338c0.672,0.449 1.344,0.842 2.016,1.179l0.504,0.169c0.672,0.337 1.344,0.618 2.016,0.842l0.336,0.169c0.56,0.225 1.288,0.393 2.183,0.505c0.896,0.225 1.176,0.281 0.84,0.169c1.12,0.225 2.184,0.337 3.192,0.337c1.008,0 2.072,-0.112 3.192,-0.337c-0.336,0.112 -0.056,0.056 0.84,-0.169c0.896,-0.112 1.624,-0.28 2.183,-0.505l0.336,-0.169c0.672,-0.224 1.344,-0.505 2.016,-0.842l0.336,-0.169c0.784,-0.337 1.512,-0.73 2.184,-1.179c0.448,-0.338 0.56,-0.45 0.336,-0.338c0.784,-0.561 1.456,-1.123 2.016,-1.685l2.016,-2.022c0.448,-0.562 0.56,-0.73 0.336,-0.506c0.447,-0.674 0.895,-1.404 1.343,-2.19c0.112,-0.113 0.224,-0.281 0.336,-0.506c0.448,-0.899 0.84,-1.741 1.176,-2.528l0,-0.168l70.385,-201.049c1.792,-5.168 1.512,-10.224 -0.84,-15.167c-2.351,-4.944 -6.103,-8.314 -11.254,-10.112c-5.152,-1.797 -10.191,-1.516 -15.119,0.843Zm99.278,-3.202l121.452,0.337c5.488,0 10.191,1.966 14.111,5.898c3.807,3.933 5.711,8.651 5.711,14.156c0,5.505 -1.959,10.168 -5.879,13.988c-3.808,3.932 -8.455,5.898 -13.943,5.898l-0.168,0l-101.462,-0.337l0,61.174l73.241,0c5.488,0 10.191,1.91 14.111,5.73c3.919,3.932 5.879,8.651 5.879,14.156c0,5.505 -1.96,10.224 -5.879,14.156c-3.92,3.82 -8.623,5.73 -14.111,5.73l-73.241,0l0,61.174l101.63,0c5.488,0 10.135,1.966 13.943,5.898c3.92,3.932 5.879,8.651 5.879,14.156c0,5.505 -1.959,10.168 -5.879,13.988c-3.808,3.932 -8.455,5.898 -13.943,5.898l-121.62,0c-5.487,0 -10.135,-1.966 -13.942,-5.898c-3.92,-3.82 -5.88,-8.483 -5.88,-13.988l0,-202.06c0,-5.617 1.96,-10.336 5.88,-14.156c3.807,-3.932 8.454,-5.898 13.942,-5.898l0.168,0Zm232.657,140.38l0,80.386c0,5.393 -1.96,10.055 -5.879,13.987c-3.808,3.82 -8.455,5.73 -13.943,5.73c-5.375,0 -10.023,-1.91 -13.942,-5.73c-3.808,-3.932 -5.712,-8.594 -5.712,-13.987l0,-200.88c0,-5.505 1.904,-10.168 5.712,-13.988c3.919,-3.932 8.567,-5.898 13.942,-5.898l69.545,0c20.718,0 38.357,6.853 52.915,20.56c14.671,13.707 22.006,30.278 22.006,49.714c0,14.831 -4.592,28.256 -13.775,40.278c-8.847,11.909 -20.494,20.391 -34.94,25.447l38.132,77.52c2.352,4.832 2.632,9.831 0.84,14.999c-1.68,5.168 -4.984,8.988 -9.911,11.46c-2.8,1.348 -5.711,2.022 -8.735,2.022c-8.175,0 -14.055,-3.707 -17.638,-11.123l-44.516,-90.497l-34.101,0Zm-590.462,-76.847c-15.902,-15.841 -34.996,-23.761 -57.282,-23.761c-22.286,0 -41.324,7.92 -57.114,23.761c-15.903,15.954 -23.854,35.109 -23.854,57.467c0,22.358 7.951,41.457 23.854,57.298c15.79,15.954 34.828,23.93 57.114,23.93c22.286,0 41.38,-7.976 57.282,-23.93c15.791,-15.841 23.686,-34.94 23.686,-57.298c0,-22.358 -7.895,-41.513 -23.686,-57.467Zm640.185,-23.93l-49.723,0l0,61.174l51.067,0c9.407,-0.337 17.47,-3.426 24.19,-9.269c6.607,-5.954 9.911,-13.032 9.911,-21.234c0,-8.538 -3.472,-15.785 -10.415,-21.739c-6.943,-5.955 -15.286,-8.932 -25.03,-8.932Zm-749.174,-156.551c10.873,0 19.934,-3.28 33.855,-11.514c1.667,-0.986 3.396,-2.033 5.732,-3.465c-0.432,0.265 4.665,-2.866 6.093,-3.736c27.29,-16.631 46.955,-23.945 75.899,-23.945c29.031,0 48.754,7.436 75.268,24.067c0.961,0.603 1.928,1.214 3.215,2.029c1.568,0.994 1.568,0.994 3.099,1.963c2.421,1.53 4.185,2.63 5.89,3.665c12.89,7.826 21.335,10.936 31.434,10.936c4.585,0 9.969,-2.41 17.189,-8.14c4.01,-3.182 8.35,-7.186 14.132,-12.952c1.84,-1.834 13.099,-13.292 16.606,-16.758c32.595,-32.22 60.107,-48.078 98.435,-48.201c37.927,-0.122 66.853,15.064 105.108,47.228c42.046,35.351 38.93,32.915 49.833,37.015c3.271,1.231 6.167,1.808 8.829,1.808c13.423,0 22.471,-3.93 40.029,-15.829c0.8,-0.542 1.747,-1.186 3.539,-2.405c25.696,-17.461 41.765,-24.426 67.537,-24.426c25.805,0 43.371,7.394 68.649,24.372c1.137,0.764 4.897,3.305 5.242,3.537c1.985,1.338 3.496,2.343 4.942,3.287c12.645,8.246 20.61,11.464 29.702,11.464l51.906,0c9.904,0 17.932,8.047 17.932,17.974c0,9.927 -8.028,17.974 -17.932,17.974l-51.906,0c-17.505,0 -31.321,-5.581 -49.26,-17.28c-1.622,-1.058 -3.27,-2.155 -5.391,-3.585c-0.382,-0.257 -4.111,-2.776 -5.199,-3.507c-19.896,-13.364 -31.595,-18.288 -48.685,-18.288c-16.849,0 -27.154,4.467 -47.413,18.234c-1.769,1.203 -2.747,1.868 -3.575,2.429c-22.996,15.585 -37.762,21.997 -60.117,21.997c-7.186,0 -14.3,-1.418 -21.428,-4.099c-10.074,-3.789 -19.867,-9.888 -31.39,-18.899c-4.268,-3.338 -8.598,-6.923 -14.46,-11.92c-1.062,-0.906 -2.153,-1.839 -3.596,-3.075c-1.799,-1.542 -1.799,-1.542 -3.601,-3.086c-2.926,-2.506 -5.091,-4.347 -7.235,-6.15c-32.311,-27.166 -54.679,-38.91 -81.945,-38.822c-26.833,0.086 -46.822,11.607 -73.368,37.849c-3.276,3.237 -14.461,14.619 -16.495,16.648c-6.659,6.64 -11.887,11.463 -17.163,15.65c-12.985,10.306 -25.495,15.904 -39.451,15.904c-17.861,0 -32.03,-5.217 -50.014,-16.136c-1.924,-1.168 -3.853,-2.371 -6.44,-4.006c-1.571,-0.995 -1.571,-0.995 -3.126,-1.98c-1.247,-0.79 -2.174,-1.375 -3.083,-1.946c-21.328,-13.378 -35.157,-18.592 -56.243,-18.592c-21.118,0 -35.083,5.194 -57.269,18.714c-1.364,0.832 -6.395,3.922 -6.013,3.688c-2.483,1.522 -4.357,2.656 -6.216,3.756c-18.942,11.204 -33.582,16.502 -52.081,16.502l-58.973,0c-9.904,0 -17.932,-8.047 -17.932,-17.974c0,-9.927 8.028,-17.974 17.932,-17.974l58.973,0Z" ] []
        ]


smallLogo =
    svg [ viewBox "0 0 1000 1000" ]
        [ path [ d "M706.879,865.838c-73.417,73.417 -161.795,110.125 -265.136,110.125c-103.341,0 -191.545,-36.708 -264.614,-110.125c-73.417,-73.069 -110.125,-161.273 -110.125,-264.614c0,-103.341 36.708,-191.719 110.125,-265.136c73.069,-73.07 161.273,-109.604 264.614,-109.604c103.341,0 191.719,36.534 265.136,109.604c73.07,73.417 109.604,161.795 109.604,265.136c0,103.341 -36.534,191.545 -109.604,264.614Zm-87.161,-442.59c-49.408,-49.06 -108.733,-73.59 -177.975,-73.59c-69.242,0 -128.392,24.53 -177.453,73.59c-49.409,49.409 -74.113,108.734 -74.113,177.976c0,69.242 24.704,128.392 74.113,177.453c49.061,49.409 108.211,74.113 177.453,74.113c69.242,0 128.567,-24.704 177.975,-74.113c49.061,-49.061 73.591,-108.211 73.591,-177.453c0,-69.242 -24.53,-128.567 -73.591,-177.976Zm-130.915,-284.696c77.53,0.86 142.924,17.157 197.071,48.419c54.146,31.261 100.957,79.745 140.467,146.459c16.133,27.241 51.294,36.303 78.534,20.241c27.24,-16.061 36.244,-51.165 20.111,-78.406c-49.143,-82.979 -109.783,-145.786 -181.885,-187.414c-72.103,-41.629 -156.816,-62.741 -253.249,-63.811c-31.657,-0.351 -57.556,24.999 -57.846,56.62c-0.29,31.622 25.139,57.541 56.797,57.892Z" ] [] ]
