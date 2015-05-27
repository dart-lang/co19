/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests texSubImage2D with bad arguments
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="testbed" width="16" height="16"></canvas>
      <canvas id="c" width="16" height="16"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("testbed");
  var c = document.getElementById("c");

  var gl = wtu.create3DContext(canvas);
  var tex = gl.createTexture();
  gl.bindTexture(wgl.TEXTURE_2D, tex);
  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "Setup should succeed"); 

  // FIXME: this behavior is still being discussed on the public_webgl mailing list and may
  // need to be changed to throw TypeError because the argument is not nullable.
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 4, 4, wgl.RGBA, wgl.UNSIGNED_BYTE, null);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "null argument");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 1, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "y + height > texture height");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 1, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "x + width > texture width");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, -1, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "negative x");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, -1, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "negative y");
  gl.texSubImage2D(wgl.TEXTURE_2D, -1, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_VALUE, "negative level");
  gl.texSubImage2D(wgl.FLOAT, 0, 0,0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_ENUM, "bad target");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "good args");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGB, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "format not same as original");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGBA, wgl.UNSIGNED_SHORT_4_4_4_4, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "type not same as original");
  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGB, wgl.RGB, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "make texture RGB");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGB, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "format same as original RGB");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "format not same as original RGB");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGB, wgl.UNSIGNED_SHORT_5_6_5, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "type not same as original RGB");
  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_SHORT_4_4_4_4, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "make texture RGBA 4_4_4_4");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGBA, wgl.UNSIGNED_SHORT_4_4_4_4, c);
  glErrorShouldBe(gl, wgl.NO_ERROR, "format same as original RGBA 4_4_4_4");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGB, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "format not same as original RGBA 4_4_4_4");
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0,0, wgl.RGBA, wgl.UNSIGNED_BYTE, c);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION, "type not same as original RGBA 4_4_4_4");
}
