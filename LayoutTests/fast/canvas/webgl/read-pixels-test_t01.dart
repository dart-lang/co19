/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks that ReadPixels works as expected.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="200" height="200" style="width: 20px; height: 20px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = create3DContext(canvas);
  var actual;
  var expected;
  var width = 2;
  var height = 2;
  var continueTestFunc;

  EventListener continueTestAfterContextRestored(Event event) {
    gl = create3DContext(canvas);
    var func = continueTestFunc;
    continueTestFunc = () { testFailed("should not be here"); };
    func();
    return null;
  }

  continueTestPart2() {
    gl.viewport(0, 0, 1024, 1024);
    var program = wtu.setupTexturedQuad(gl);
    var loc = gl.getUniformLocation(program, "tex");
    gl.disable(wgl.WebGL.BLEND);
    gl.disable(wgl.WebGL.DEPTH_TEST);
    var colors = [[255, 0, 0, 255], [0, 255, 0, 255], [0, 0, 255, 255]];
    var textures = [];
    var results = [];
    for (var ii = 0; ii < colors.length; ++ii) {
      gl.activeTexture(wgl.WebGL.TEXTURE0 + ii);
      var tex = gl.createTexture();
      wtu.fillTexture(gl, tex, 1, 1, colors[ii]);
      textures.add(tex);
    }
    for (var ii = 0; ii < colors.length; ++ii) {
      for (var jj = 0; jj < 0 + ii + 1; ++jj) {
        gl.uniform1i(loc, jj % 3);
        gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
      }
      var buf = new Uint8List(4);
      gl.readPixels(512, 512, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      results.add(buf);
      for (var kk = 0; kk < 1; ++kk) {
        gl.uniform1i(loc, (ii + 1 + kk) % 3);
        gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
      }
    }
    for (var ii = 0; ii < colors.length; ++ii) {
      var buf = results[ii];
      var color = colors[ii];
      actual = [buf[0], buf[1], buf[2], buf[3]];
      expected = [color[0], color[1], color[2], color[3]];
      shouldBeList(actual, expected);
    }
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "there should be no GL errors");

    debug("");
    asyncEnd();
  }

  continueTestPart1() {
    gl.clearColor(0.5, 0.7, 1.0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);

    var innerColor = [0.5, 0.7, 1.0, 1];
    var outerColor = [0, 0, 0, 0];

    var tests = [
    { 'msg': 'in range', 'checkColor': innerColor, 'x':  0, 'y':  0,
      'oneColor': innerColor, 'oneX': 0, 'oneY': 0},
    { 'msg': 'off top left', 'checkColor': outerColor, 'x': -1, 'y': -1,
      'oneColor': innerColor, 'oneX': 1, 'oneY': 1},
    { 'msg': 'off bottom right', 'checkColor': outerColor, 'x':  1, 'y':  1,
      'oneColor': innerColor, 'oneX': 0, 'oneY': 0},
    { 'msg': 'completely off top ', 'checkColor': outerColor, 'x':  0, 'y': -2,
      'oneColor': outerColor, 'oneX': 0, 'oneY': 0},
    { 'msg': 'completely off bottom', 'checkColor': outerColor, 'x':  0, 'y':  2,
      'oneColor': outerColor, 'oneX': 0, 'oneY': 0},
    { 'msg': 'completely off left', 'checkColor': outerColor, 'x': -2, 'y':  0,
      'oneColor': outerColor, 'oneX': 0, 'oneY': 0},
    { 'msg': 'completeley off right', 'checkColor': outerColor, 'x':  2, 'y':  0,
      'oneColor': outerColor, 'oneX': 0, 'oneY': 0}
    ];

    checkBuffer(checkColor, x, y, oneColor, oneX, oneY) {
      var buf = new Uint8List(width * height * 4);
      gl.readPixels(x, y, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      for (var yy = 0; yy < height; ++yy) {
        for (var xx = 0; xx < width; ++xx) {
          var offset = (yy * width + xx) * 4;
          var expectedColors = (oneX == xx && oneY == yy) ? oneColor : checkColor;
          for (var cc = 0; cc < 4; ++cc) {
            var expectedColor = expectedColors[cc] * 255;
            var color = buf[offset + cc];
            var diff = abs(expectedColor - color);
            assertMsg(diff < 3,
                "color pixel at $xx,$yy should be about $expectedColor");
          }
        }
      }
    }

    for (var tt = 0; tt < tests.length; ++tt) {
      var test = tests[tt];
      debug("");
      debug("checking: " + test['msg']);
      checkBuffer(test['checkColor'], test['x'], test['y'],
          test['oneColor'], test['oneX'], test['oneY']);
    }

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "there should be no GL errors");

    var badFormats = [
    {
      'format': wgl.WebGL.RGB,
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'dest': new Uint8List(3),
      'error': wgl.WebGL.INVALID_OPERATION
    },
    {
      'format': wgl.WebGL.RGB,
      'type': wgl.WebGL.UNSIGNED_SHORT_5_6_5,
      'dest': new Uint8List(3),
      'error': wgl.WebGL.INVALID_OPERATION
    },
    {
      'format': wgl.WebGL.RGBA,
      'type': wgl.WebGL.UNSIGNED_SHORT_5_5_5_1,
      'dest': new Uint16List(1),
      'error': wgl.WebGL.INVALID_OPERATION
    },
    {
      'format': wgl.WebGL.RGBA,
      'type': wgl.WebGL.UNSIGNED_SHORT_4_4_4_4,
      'dest': new Uint16List(1),
      'error': wgl.WebGL.INVALID_OPERATION
    },
    {
      'format': wgl.WebGL.ALPHA,
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'dest': new Uint8List(1),
      'error': wgl.WebGL.INVALID_OPERATION
    },
    {
      'format': wgl.WebGL.LUMINANCE,
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'dest': new Uint8List(1),
      'error': wgl.WebGL.INVALID_ENUM
    },
    {
      'format': wgl.WebGL.LUMINANCE_ALPHA,
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'dest': new Uint8List(2),
      'error': wgl.WebGL.INVALID_ENUM
    }
    ];
    debug("");
    debug("check disallowed formats");
    for (var tt = 0; tt < badFormats.length; ++ tt) {
      var info = badFormats[tt];
      var format = info['format'];
      var type = info['type'];
      var dest = info['dest'];
      var error = info['error'];
      gl.readPixels(0, 0, 1, 1, format, type, dest);
      // note that the GL error is INVALID_OPERATION if both format and type are invalid, but
      // INVALID_ENUM if only one is.
      glErrorShouldBe(
          gl, error,
          "Should not be able to read as " + wtu.glEnumToString(gl, format) +
          " / " + wtu.glEnumToString(gl, type));
    }

    debug("");
    debug("check reading with lots of drawing");
    continueTestFunc = continueTestPart2;
    width = 1024;
    height = 1024;
    canvas.width = width;
    canvas.height = height;
    if (gl.getError() != wgl.WebGL.CONTEXT_LOST_WEBGL) {
      continueTestPart2();
    }
  }

  continueTestFunc = continueTestPart1;

  gl.clearColor(1, 1, 1, 1);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  // Resize the canvas to 2x2. This is an attempt to get stuff in the backbuffer.
  // that shouldn't be there.
  canvas.addEventListener("webglcontextrestored", continueTestAfterContextRestored, false);
  canvas.width = width;
  canvas.height = height;

  asyncStart();

  if (gl.getError() != wgl.WebGL.CONTEXT_LOST_WEBGL) {
    continueTestPart1();
  }
}
