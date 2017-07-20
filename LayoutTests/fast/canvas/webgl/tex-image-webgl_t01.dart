/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test texImage2D from a webgl canvas.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="256" height="16" style="width: 256px; height: 48px;"></canvas>
      <canvas id="source" width="256" height="16" style="width: 256px; height: 48px;"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = wtu.create3DContext("example");
  gl.disable(wgl.DITHER);
  wtu.setupTexturedQuad(gl);
  var gl1 = wtu.create3DContext("source");
  gl1.disable(wgl.DITHER);

  glErrorShouldBe(gl, wgl.NO_ERROR, "Should be no errors from setup.");
  glErrorShouldBe(gl1, wgl.NO_ERROR, "Should be no errors from setup.");

  gl.disable(wgl.BLEND);
  gl.disable(wgl.DEPTH_TEST);

  gl1.clearColor(1.0, 0.0, 0.0, 1.0);
  gl1.clear(wgl.COLOR_BUFFER_BIT);

  var tex = gl.createTexture();
  gl.bindTexture(wgl.TEXTURE_2D, tex);
  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGB, wgl.RGB, wgl.UNSIGNED_BYTE, gl1.canvas);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_S, wgl.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_T, wgl.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MAG_FILTER, wgl.LINEAR);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.LINEAR);
  wtu.drawQuad(gl);

  wtu.checkCanvas(gl, [255, 0, 0, 255], "Canvas should be red");

  gl1.clearColor(0.0, 1.0, 0.0, 1.0);
  gl1.clear(wgl.COLOR_BUFFER_BIT);

  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGB, wgl.RGB, wgl.UNSIGNED_BYTE, gl1.canvas);
  wtu.drawQuad(gl);

  wtu.checkCanvas(gl, [0, 255, 0, 255], "Canvas should be green");
}
