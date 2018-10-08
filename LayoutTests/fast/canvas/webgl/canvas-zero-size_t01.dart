/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that a zero size canvas does not fail.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  dynamic canvas = document.createElement('canvas');
  var gl = wtu.create3DContext(canvas);
  canvas.width = 0;
  canvas.height = 0;
  gl.viewport(0, 0, 0, 0);
  var program = wtu.setupTexturedQuad(gl);
  shouldBeTrue(program != null);
  var tex = gl.createTexture();
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  var pixel = new Uint8List.fromList([0, 255, 0, 255]);
  gl.texImage2D(
      wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, pixel);
  wtu.drawQuad(gl);

  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");
}
