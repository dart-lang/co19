/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that index validation verifies the correct number of
 * indices
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  List<double> toFloatList(list) =>
      (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  sizeInBytes(type) {
    switch (type) {
      case wgl.WebGL.BYTE:
      case wgl.WebGL.UNSIGNED_BYTE:
        return 1;
      case wgl.WebGL.SHORT:
      case wgl.WebGL.UNSIGNED_SHORT:
        return 2;
      case wgl.WebGL.INT:
      case wgl.WebGL.UNSIGNED_INT:
      case wgl.WebGL.FLOAT:
        return 4;
      default:
        throw "unknown type";
    }
  }

  var gl = create3DContext();
  var program = loadStandardProgram(gl);

  // 3 vertices => 1 triangle, interleaved data
  var dataComplete = float32list([0, 0, 0, 1,
      0, 0, 1,
      1, 0, 0, 1,
      0, 0, 1,
      1, 1, 1, 1,
      0, 0, 1]);
  var dataIncomplete = float32list([0, 0, 0, 1,
      0, 0, 1,
      1, 0, 0, 1,
      0, 0, 1,
      1, 1, 1, 1]);
  var indices = new Uint16List.fromList([0, 1, 2]);

  debug("Testing with valid indices");

  var bufferComplete = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, bufferComplete);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, dataComplete, wgl.WebGL.STATIC_DRAW);
  var elements = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elements);
  gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
  gl.useProgram(program);
  var vertexLoc = gl.getAttribLocation(program, "a_vertex");
  var normalLoc = gl.getAttribLocation(program, "a_normal");
  gl.vertexAttribPointer(vertexLoc, 4, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), 0);
  gl.enableVertexAttribArray(vertexLoc);
  gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
  gl.enableVertexAttribArray(normalLoc);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("Testing with out-of-range indices");

  var bufferIncomplete = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, bufferIncomplete);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, dataIncomplete, wgl.WebGL.STATIC_DRAW);
  gl.vertexAttribPointer(vertexLoc, 4, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), 0);
  gl.enableVertexAttribArray(vertexLoc);
  gl.disableVertexAttribArray(normalLoc);
  debug("Enable vertices, valid");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  debug("Enable normals, out-of-range");
  gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
  gl.enableVertexAttribArray(normalLoc);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION);

  debug("Test with enabled attribute that does not belong to current program");

  gl.disableVertexAttribArray(normalLoc);
  var extraLoc = max([vertexLoc, normalLoc]) + 1;
  gl.enableVertexAttribArray(extraLoc);
  debug("Enable an extra attribute with null");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION);
  debug("Enable an extra attribute with insufficient data buffer");
  gl.vertexAttribPointer(extraLoc, 3, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
  debug("Pass large negative index to vertexAttribPointer");
  gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false,
      7 * sizeInBytes(wgl.WebGL.FLOAT), -2000000000 * sizeInBytes(wgl.WebGL.FLOAT));
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);
  gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
}
