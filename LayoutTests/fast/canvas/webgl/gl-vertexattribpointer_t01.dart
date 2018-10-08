/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks vertexAttribPointer behaviors in WebGL.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

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

    debug("Checking gl.vertexAttribPointer.");

    var FIXED = 0x140C;

    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 12);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION,
        "vertexAttribPointer should fail if no buffer is bound");

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List(0), wgl.WebGL.STATIC_DRAW);

    gl.vertexAttribPointer(0, 1, wgl.WebGL.INT, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_ENUM,
        "vertexAttribPointer should not support INT");
    gl.vertexAttribPointer(0, 1, wgl.WebGL.UNSIGNED_INT, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_ENUM,
        "vertexAttribPointer should not support UNSIGNED_INT");
    gl.vertexAttribPointer(0, 1, FIXED, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_ENUM,
        "vertexAttribPointer should not support FIXED");

    checkVertexAttribPointer(
        gl, err, reason, size, type, normalize, stride, offset) {
          gl.vertexAttribPointer(0, size, type, normalize, stride, offset);
          glErrorShouldBe(gl, err,
              "gl.vertexAttribPointer(0, $size" +
              ", " + wtu.glEnumToString(gl, type) +
              ", $normalize" +
              ", $stride" +
              ", $offset" +
              ") should " + (err == wgl.WebGL.NO_ERROR ? "succeed " : "fail ") + reason);
        }

    var types = [
    { 'type':wgl.WebGL.BYTE,           'bytesPerComponent': 1 },
    { 'type':wgl.WebGL.UNSIGNED_BYTE,  'bytesPerComponent': 1 },
    { 'type':wgl.WebGL.SHORT,          'bytesPerComponent': 2 },
    { 'type':wgl.WebGL.UNSIGNED_SHORT, 'bytesPerComponent': 2 },
    { 'type':wgl.WebGL.FLOAT,          'bytesPerComponent': 4 },
    ];

    for (var ii = 0; ii < types.length; ++ii) {
      var info = types[ii];
      var type = info['type'];
      var bytesPerComponent = info['bytesPerComponent'];
      debug("");
      for (var size = 1; size <= 4; ++size) {
        debug("");
        debug("checking: " + wtu.glEnumToString(gl, type) + " with size $size");
        var bytesPerElement = size * bytesPerComponent;
        var offsetSet;
        if (bytesPerComponent > 1)
          offsetSet = [0, bytesPerComponent - 1];
        else
          offsetSet = [0];
        for (var jj = 0; jj < offsetSet.length; ++jj) {
          var offset = offsetSet[jj];
          var strideSet;
          if (bytesPerElement > 1)
            strideSet = [0, bytesPerElement - 1, bytesPerElement];
          else
            strideSet = [0, bytesPerElement];
          for (var kk = 0; kk < strideSet.length; ++kk) {
            var stride = strideSet[kk];
            var err = wgl.WebGL.NO_ERROR;
            var reason = "";
              if (offset != 0) {
                reason = "because offset is bad";
                err = wgl.WebGL.INVALID_OPERATION;
              }
            if (stride % bytesPerComponent != 0) {
              reason = "because stride is bad";
              err = wgl.WebGL.INVALID_OPERATION;
            }
            checkVertexAttribPointer(
                gl, err, reason, size, type, false, stride, offset);
          }
          var stride = floor(255 / bytesPerComponent) * bytesPerComponent;

          if (offset == 0) {
            checkVertexAttribPointer(
                gl, wgl.WebGL.NO_ERROR, "at stride limit",
                size, type, false, stride, offset);
            checkVertexAttribPointer(
                gl, wgl.WebGL.INVALID_VALUE, "over stride limit",
                size, type, false,
                stride + bytesPerComponent, offset);
          }
        }
      }
    }
  }
}
