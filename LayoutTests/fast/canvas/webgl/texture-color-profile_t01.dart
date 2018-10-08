/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that applying a color profile to a texture with separate
 * alpha doesn't destroy the texture.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="16" height="16" style="width: 16px; height: 16px;"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("This test isn't appropriate to include in the WebGL conformance suite, since the browser's behavior when applying a color profile can't be guaranteed.");
  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var program = wtu.setupTexturedQuad(gl);

  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  var imgURLs = [
    '$root/resources/tan-1x1-with-alpha.png'
    ];

  runTests(imgs) {
    // pixelStorei defaults are UNPACK_PREMULTIPLY_ALPHA_WEBGL=false, UNPACK_COLORSPACE_CONVERSION_WEBGL=BROWSER_DEFAULT_WEBGL.
    var loc = gl.getUniformLocation(program, "tex");
    gl.uniform1i(loc, 0);

    gl.disable(wgl.WebGL.BLEND);
    gl.disable(wgl.WebGL.DEPTH_TEST);

    var width = canvas.width;
    var height = canvas.height;

    checkPixelRange(buf, x, y, color, allowedRange) {
      var off = (y * width + x) * 4;
      var actual = buf.sublist(off,off+4);
      var msg = "pixel $x, $y should be within $allowedRange units of " +
        color.join(",") + " was " +
        actual.join(",");
      for (var ii = 0; ii < 4; ++ii) {
        if (abs(buf[off + ii] - color[ii]) > allowedRange) {
          testFailed(msg);
          return;
        }
      }
      testPassed(msg);
    }

    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);

    var buf = new Uint8List(width * height * 4);

    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE,
        imgs['$root/resources/tan-1x1-with-alpha.png']);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup");
    wtu.drawQuad(gl);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    // This generous range is still enough to catch the regression.
    checkPixelRange(buf, 0, 0, [163, 126, 94, 129], 20);
    asyncEnd();
  }

  asyncStart();

  wtu.loadImagesAsync(imgURLs, runTests);
}
