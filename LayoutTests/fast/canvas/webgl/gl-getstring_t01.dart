/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks getParameter returns strings in the correct
 * format
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic gl;

  checkPrefix(expected, enum_val) {
    debug(expected);
    var s = gl.getParameter(enum_val);
    if (s != null && s.startsWith(expected)) {
          testPassed("correctly started with " + expected);
        } else {
          testFailed("did not start with " + expected);
        }
  }

  debug("Canvas.getContext");

  gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    checkPrefix("WebGL 1.0", wgl.WebGL.VERSION);
    checkPrefix("WebGL GLSL ES 1.0", wgl.WebGL.SHADING_LANGUAGE_VERSION);
    shouldBeNonNull(gl.getParameter(wgl.WebGL.VENDOR));
    shouldBeNonNull(gl.getParameter(wgl.WebGL.RENDERER));
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
  }
}
