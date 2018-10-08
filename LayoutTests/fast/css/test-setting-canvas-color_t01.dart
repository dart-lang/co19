/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test case for bug 39168. This tests the CSS color parsing code
 * using <canvas>.
 */
import "dart:html";
import "../../testcommon.dart";

bool isRedColor(String color) {
  String s = color.toLowerCase().replaceAll(" ", "");
  return s == "#f00" || s == "#ff0000" || s.startsWith("rgba(255,0,0");
}

bool isGreenColor(String color) {
  String s = color.toLowerCase().replaceAll(" ", "");
  return s == "#0f0" || s == "#00ff00" || s.startsWith("rgba(0,255,0");
}

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas">
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("canvas");
  var ctx = canvas.getContext("2d");

  shouldSuccessfullyParse(color) {
    ctx.fillStyle = "#f00";
    ctx.fillStyle = color;
    // Check that there is no red.
    if (!isRedColor(ctx.fillStyle))
      testPassed("Setting color to " + color + " was successfully set.");
    else
      testFailed("Setting color to " + color + " was not set but should!");
  }

  shouldNotSuccessfullyParse(color) {
    ctx.fillStyle = "#0f0";
    ctx.fillStyle = color;
    // Check that the color is still green.
    if (isGreenColor(ctx.fillStyle))
      testPassed("Setting color to " + color + " was not set (as expected).");
    else
      testFailed("Setting color to " + color + " was successfully set but should not!");
  }

  // Taken from CSS 3 color.
  var deprecatedSystemColors = [
    "ActiveBorder",
    "ActiveCaption",
    "AppWorkspace",
    "Background",
    "ButtonFace",
    "ButtonHighlight",
    "ButtonShadow",
    "ButtonText",
    "CaptionText",
    "GrayText",
    "Highlight",
    "HighlightText",
    "InactiveBorder",
    "InactiveCaption",
    "InactiveCaptionText",
    "InfoBackground",
    "InfoText",
    "Menu",
    "MenuText",
    "Scrollbar",
    "ThreeDDarkShadow",
    "ThreeDFace",
    "ThreeDHighlight",
    "ThreeDLightShadow",
    "ThreeDShadow",
    "Window",
    "WindowFrame",
    "WindowText"
  ];

  // Valid values passed in color matching.
  for (var i = 0; i < deprecatedSystemColors.length; ++i) {
    shouldSuccessfullyParse(deprecatedSystemColors[i]);
    shouldSuccessfullyParse(deprecatedSystemColors[i].toLowerCase());
  }

  // Taken from CSS 3 color.
  var svgColors = [
    "aliceblue",
    "antiquewhite",
    "aqua",
    "aquamarine",
    "azure",
    "beige",
    "bisque",
    "black",
    "blanchedalmond",
    "blue",
    "blueviolet",
    "brown",
    "burlywood",
    "cadetblue",
    "chartreuse",
    "chocolate",
    "coral",
    "cornflowerblue",
    "cornsilk",
    "crimson",
    "cyan",
    "darkblue",
    "darkcyan",
    "darkgoldenrod",
    "darkgray",
    "darkgreen",
    "darkgrey",
    "darkkhaki",
    "darkmagenta",
    "darkolivegreen",
    "darkorange",
    "darkorchid",
    "darkred",
    "darksalmon",
    "darkseagreen",
    "darkslateblue",
    "darkslategray",
    "darkslategrey",
    "darkturquoise",
    "darkviolet",
    "deeppink",
    "deepskyblue",
    "dimgray",
    "dimgrey",
    "dodgerblue",
    "firebrick",
    "floralwhite",
    "forestgreen",
    "fuchsia",
    "gainsboro",
    "ghostwhite",
    "gold",
    "goldenrod",
    "gray",
    "green",
    "greenyellow",
    "grey",
    "honeydew",
    "hotpink",
    "indianred",
    "indigo",
    "ivory",
    "khaki",
    "lavender",
    "lavenderblush",
    "lawngreen",
    "lemonchiffon",
    "lightblue",
    "lightcoral",
    "lightcyan",
    "lightgoldenrodyellow",
    "lightgray",
    "lightgreen",
    "lightgrey",
    "lightpink",
    "lightsalmon",
    "lightseagreen",
    "lightskyblue",
    "lightslategray",
    "lightslategrey",
    "lightsteelblue",
    "lightyellow",
    "lime",
    "limegreen",
    "linen",
    "magenta",
    "maroon",
    "mediumaquamarine",
    "mediumblue",
    "mediumorchid",
    "mediumpurple",
    "mediumseagreen",
    "mediumslateblue",
    "mediumspringgreen",
    "mediumturquoise",
    "mediumvioletred",
    "midnightblue",
    "mintcream",
    "mistyrose",
    "moccasin",
    "navajowhite",
    "navy",
    "oldlace",
    "olive",
    "olivedrab",
    "orange",
    "orangered",
    "orchid",
    "palegoldenrod",
    "palegreen",
    "paleturquoise",
    "palevioletred",
    "papayawhip",
    "peachpuff",
    "peru",
    "pink",
    "plum",
    "powderblue",
    "purple",
    // We do not test red.
    "rosybrown",
    "royalblue",
    "saddlebrown",
    "salmon",
    "sandybrown",
    "seagreen",
    "seashell",
    "sienna",
    "silver",
    "skyblue",
    "slateblue",
    "slategray",
    "slategrey",
    "snow",
    "springgreen",
    "steelblue",
    "tan",
    "teal",
    "thistle",
    "tomato",
    "turquoise",
    "violet",
    "wheat",
    "white",
    "whitesmoke",
    "yellow",
    "yellowgreen"
  ];

  // Valid values passed in color matching.
  for (var i = 0; i < svgColors.length; ++i)
    shouldSuccessfullyParse(svgColors[i]);


  shouldSuccessfullyParse("#0f0");
  shouldSuccessfullyParse("hsl(120, 100%, 50%)"); // Green HSL

  // Invalid values.
  shouldNotSuccessfullyParse("foobar");
  shouldNotSuccessfullyParse("counter(foobar)");
  shouldNotSuccessfullyParse("url(http://127.0.0.1:8080/)");
  shouldNotSuccessfullyParse("inherited");
  shouldNotSuccessfullyParse("#100%");
  shouldNotSuccessfullyParse("#100px");
  shouldNotSuccessfullyParse('var("test")');
}
