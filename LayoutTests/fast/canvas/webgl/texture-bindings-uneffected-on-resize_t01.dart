/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies that GL texture bindings do not change when canvas is
 * resized
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="4px" height="4px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var program = wtu.setupTexturedQuad(gl);

  var green = [0, 255, 0, 255];
  var blue = [0, 0, 255, 255];
  var tex0 = gl.createTexture();
  wtu.fillTexture(gl, tex0, 1, 1, blue, 0);
  gl.activeTexture(wgl.WebGL.TEXTURE1);
  var tex1 = gl.createTexture();
  wtu.fillTexture(gl, tex1, 1, 1, green, 0);

  var loc = gl.getUniformLocation(program, "tex");

  test() {
    gl.viewport(0, 0, canvas.width, canvas.height);
    gl.uniform1i(loc, 0);
    wtu.drawQuad(gl);
    wtu.checkCanvas(gl, blue, "should be blue");
    gl.uniform1i(loc, 1);
    wtu.drawQuad(gl);
    wtu.checkCanvas(gl, green, "should be green");
  }

  debug("test before resizing canvas");
  test();
  debug("test after resizing canvas");
  canvas.width = 8;
  test();
}
