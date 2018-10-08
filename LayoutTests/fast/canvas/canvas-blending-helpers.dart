/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

var blendModes = ["source-over", "multiply", "screen", "overlay", "darken",
    "lighten", "color-dodge", "color-burn", "hard-light", "soft-light",
    "difference", "exclusion", "hue", "saturation", "color", "luminosity"];

// Helper functions for separate blend mode

var separateBlendmodes = ["normal", "multiply", "screen", "overlay",
    "darken", "lighten", "colorDodge","colorBurn",
    "hardLight", "softLight", "difference", "exclusion"];

var separateBlendFunctions;

initHelpers() {
  separateBlendFunctions = {
    'normal': (num b, num s) {
      return s;
    },
    'multiply': (num b, num s) {
      return b * s;
    },
    'screen': (num b, num s) {
      return b + s - b * s;
    },
    'overlay': (num b, num s) {
      return separateBlendFunctions['hardLight'](b, s);
    },
    'darken': (num b, num s) {
      return Math.min(b, s);
    },
    'lighten': (num b, num s) {
      return Math.max(b, s);
    },
    'colorDodge': (num b, num s) {
      if(b == 1)
        return 1;
      return Math.min(1, s / (1 - b));
    },
    'colorBurn': (num b, num s) {
      if(s == 0)
        return 0;
      return 1 - Math.min(1, (1 - b) / s);
    },
    'hardLight': (num b, num s) {
      if(s <= 0.5)
        return separateBlendFunctions['multiply'](s, 2 * b);

      return separateBlendFunctions['screen'](s, 2 * b - 1);
    },
    'softLight': (num b, num s) {
      double c = 0.0;
      if(b <= 0.25)
        c = ((16 * b - 12) * b + 4) * b;
      else
        c = Math.sqrt(b);

      if(s <= 0.5)
        return b - (1 - 2 * s) * b * (1 - b);

      return b + (2  * s - 1) * (c - b);
    },
    'difference': (num b, num s) {
      return abs(b - s);
    },
    'exclusion': (num b, num s) {
      return s + b - 2 * b * s;
    }
  };
}

applyBlendMode(b, s, blendFunc) {
  var resultedColor = [0, 0, 0, 255];
  for (var i = 0; i < 3; ++i)
    resultedColor[i] = 255 * (s[3] * (1 - b[3]) * s[i] + b[3] * s[3] *
        blendFunc(b[i], s[i]) + (1 - s[3]) * b[3] * b[i]);
  return resultedColor;
}


// Helper functions for nonseparate blend modes

var nonSeparateBlendModes = ["hue", "saturation", "color", "luminosity"];

luminosity(c) {
  return 0.3 * c[0] + 0.59 * c[1] + 0.11 * c[2];
}

clipColor(c) {
  var l = luminosity(c);
  var n = min([c[0], c[1], c[2]]);
  var x = max([c[0], c[1], c[2]]);

  if (n < 0) {
    c[0] = l + (((c[0] - l) * l) / (l - n));
    c[1] = l + (((c[1] - l) * l) / (l - n));
    c[2] = l + (((c[1] - l) * l) / (l - n));
  }

  if (x > 1) {
    c[0] = l + (((c[0] - l) * (1 - l)) / (x - l));
    c[1] = l + (((c[1] - l) * (1 - l)) / (x - l));
    c[2] = l + (((c[2] - l) * (1 - l)) / (x - l));
  }

  return c;
}

setLuminosity(c, l) {
  var d = l - luminosity(c);
  c[0] += d;
  c[1] += d;
  c[2] += d;
  return clipColor(c);
}

saturation(c) {
  return max([c[0], c[1], c[2]]) - min([c[0], c[1], c[2]]);
}

setSaturation(c, s) {
  var _max = max([c[0], c[1], c[2]]);
  var _min = min([c[0], c[1], c[2]]);
  var index_max = -1;
  var index_min = -1;

  for (var i = 0; i < 3; ++i) {
    if (c[i] == _min && index_min == -1) {
      index_min = i;
      continue;
    }
    if (c[i] == _max && index_max == -1)
      index_max = i;
  }
  var index_mid = 3 - index_max - index_min;
  var _mid = c[index_mid];


  if (_max > _min) {
    _mid = (((_mid - _min) * s) / (_max - _min));
    _max = s;
  } else {
    _mid = 0;
    _max = 0;
  }
  _min = 0;

  var newColor = [0, 0, 0];

  newColor[index_min] = _min;
  newColor[index_mid] = _mid;
  newColor[index_max] = _max;

  return newColor;
}

var nonSeparateBlendFunctions = {
  'hue': (b, s) {
    var bCopy = [b[0], b[1], b[2]];
    var sCopy = [s[0], s[1], s[2]];
    return setLuminosity(
        setSaturation(sCopy, saturation(bCopy)), luminosity(bCopy));
  },
  'saturation': (b, s) {
    var bCopy = [b[0], b[1], b[2]];
    var sCopy = [s[0], s[1], s[2]];
    return setLuminosity(
        setSaturation(bCopy, saturation(sCopy)), luminosity(bCopy));
  },
  'color': (b, s) {
    var bCopy = [b[0], b[1], b[2]];
    var sCopy = [s[0], s[1], s[2]];
    return setLuminosity(sCopy, luminosity(bCopy));
  },
  'luminosity': (b, s) {
    var bCopy = [b[0], b[1], b[2]];
    var sCopy = [s[0], s[1], s[2]];
    return setLuminosity(bCopy, luminosity(sCopy));
  }
};

// Helper functions for drawing in canvas tests

drawColorInContext(color, context) {
  context.fillStyle = color;
  context.fillRect(0, 0, 10, 10);
}

drawBackdropColorInContext(context) {
  drawColorInContext("rgba(129, 255, 129, 1)", context);
}

drawSourceColorInContext(context) {
  drawColorInContext("rgba(255, 129, 129, 1)", context);
}

fillPathWithColorInContext(color, context) {
  context.fillStyle = color;
  context.lineTo(0, 10);
  context.lineTo(10, 10);
  context.lineTo(10, 0);
  context.lineTo(0, 0);
  context.fill();
}

fillPathWithBackdropInContext(context) {
  fillPathWithColorInContext("rgba(129, 255, 129, 1)", context);
}

fillPathWithSourceInContext(context) {
  fillPathWithColorInContext("rgba(255, 129, 129, 1)", context);
}

applyTransformsToContext(context) {
  context.translate(1, 1);
  context.rotate(Math.pi / 2);
  context.scale(2, 2);
}

drawBackdropColorWithShadowInContext(context) {
  context.save();
  context.shadowOffsetX = 2;
  context.shadowOffsetY = 2;
  context.shadowColor = 'rgba(192, 192, 192, 1)';
  drawBackdropColorInContext(context);
  context.restore();
}

drawSourceColorRectOverShadow(context) {
  context.fillStyle = "rgba(255, 129, 129, 1)";
  context.fillRect(0, 0, 12, 12);
}

drawColorImageInContext(color, context, callback) {
  dynamic cvs = document.createElement("canvas");
  var ctx = cvs.getContext("2d");
  drawColorInContext(color, ctx);
  var imageURL = cvs.toDataUrl();

  var backdropImage = new ImageElement();
  asyncStart();
  backdropImage.onLoad.listen((_) {
    context.drawImage(backdropImage, 0, 0);
    callback();
    asyncEnd();
  });
  backdropImage.src = imageURL;
}

drawBackdropColorImageInContext(context, callback) {
  drawColorImageInContext("rgba(129, 255, 129, 1)", context, callback);
}

drawSourceColorImageInContext(context, callback) {
  drawColorImageInContext("rgba(255, 129, 129, 1)", context, callback);
}

drawColorPatternInContext(color, context, callback) {
  dynamic cvs = document.createElement("canvas");
  var ctx = cvs.getContext("2d");
  drawColorInContext(color, ctx);
  var imageURL = cvs.toDataUrl();

  var backdropImage = new ImageElement();
  asyncStart();
  backdropImage.onLoad.listen((_) {
    var pattern = context.createPatternFromImage(backdropImage, 'repeat');
    context.rect(0, 0, 10, 10);
    context.fillStyle = pattern;
    context.fill();
    callback();
    asyncEnd();
  });
  backdropImage.src = imageURL;
}

drawBackdropColorPatternInContext(context, callback) {
  drawColorPatternInContext("rgba(129, 255, 129, 1)", context, callback);
}

drawSourceColorPatternInContext(context, callback) {
  drawColorPatternInContext("rgba(255, 129, 129, 1)", context, callback);
}

drawGradientInContext(color1, context) {
  var grad = context.createLinearGradient(0, 0, 10, 10);
  grad.addColorStop(0, color1);
  grad.addColorStop(1, color1);
  context.fillStyle = grad;
  context.fillRect(0, 0, 10, 10);
}

drawBackdropColorGradientInContext(context) {
  drawGradientInContext("rgba(129, 255, 129, 1)", context);
}

drawSourceColorGradientInContext(context) {
  drawGradientInContext("rgba(255, 129, 129, 1)", context);
}

blendColors(backdrop, source, blendModeIndex) {
  if (blendModeIndex < separateBlendmodes.length)
    return separateBlendColors(backdrop, source, blendModeIndex);
  return nonSeparateBlendColors(backdrop, source,
      blendModeIndex - separateBlendmodes.length);
}

separateBlendColors(backdrop, source, blendModeIndex) {
  return applyBlendMode(backdrop, source,
      separateBlendFunctions[separateBlendmodes[blendModeIndex]]);
}

nonSeparateBlendColors(backdrop, source, blendModeIndex) {
  var expectedColor = nonSeparateBlendFunctions[
      nonSeparateBlendModes[blendModeIndex]](backdrop, source);
  for (var i = 0; i < 3; ++i)
    expectedColor[i] = source[3] * (1 - backdrop[3]) * source[i] + source[3] *
        backdrop[3] * expectedColor[i] + (1 - source[3]) * backdrop[3] *
        backdrop[i];
  return [round(255 * expectedColor[0]), round(255 * expectedColor[1]),
      round(255 * expectedColor[2]), 255];
}
