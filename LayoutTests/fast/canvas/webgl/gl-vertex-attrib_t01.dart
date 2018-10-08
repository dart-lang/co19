/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations vertexAttrib can be set
 * and read.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  dynamic gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    debug("Checking gl.vertexAttrib.");

    gl.vertexAttrib4fv(0, new Float32List.fromList([1.0, 2.0, 3.0, 4.0]));
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[0], 1);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[1], 2);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[2], 3);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[3], 4);

    gl.vertexAttrib1f(0, 5);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[0], 5);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[1], 0);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[2], 0);
    shouldBe(gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB)[3], 1);
  }
}
