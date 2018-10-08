/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that updating the size of a vertex buffer is properly
 * noticed by the WebGL implementation.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="1px" height="1px"></canvas>
      <div id="description"></div>
      <div id="console"></div>

      <script id="vs" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      attribute vec4 vColor;
      varying vec4 color;
      void main() {
          gl_Position = vPosition;
          color = vColor;
      }
      </script>
      <script id="fs" type="x-shader/x-fragment">
#if defined(GL_ES)
      precision mediump float;
#endif
      varying vec4 color;
      void main() {
        gl_FragColor = color;
      }
      </script>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  List<double> toFloatList(list) =>
      (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(List list) => new Float32List.fromList(toFloatList(list));

  var gl = initWebGL("example", "vs", "fs", ["vPosition", "vColor"],
      [0, 0, 0, 1], 1);
  var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after initialization");

  gl.useProgram(program);
  var vertexObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list(
      [-1,1,0, 1,1,0, -1,-1,0,
       -1,-1,0, 1,1,0, 1,-1,0]), wgl.WebGL.STATIC_DRAW);
  gl.enableVertexAttribArray(0);
  gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after vertex setup");

  var texCoordObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list(
      [0,0, 1,0, 0,1,
       0,1, 1,0, 1,1]), wgl.WebGL.STATIC_DRAW);
  gl.enableVertexAttribArray(1);
  gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after texture coord setup");

  // Now resize these buffers because we want to change what we're drawing.
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list([
      -1,1,0, 1,1,0, -1,-1,0, 1,-1,0,
      -1,1,0, 1,1,0, -1,-1,0, 1,-1,0]), wgl.WebGL.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after vertex redefinition");
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, texCoordObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Uint8List.fromList([
      255, 0, 0, 255,
      255, 0, 0, 255,
      255, 0, 0, 255,
      255, 0, 0, 255,
      0, 255, 0, 255,
      0, 255, 0, 255,
      0, 255, 0, 255,
      0, 255, 0, 255]), wgl.WebGL.STATIC_DRAW);
  gl.vertexAttribPointer(1, 4, wgl.WebGL.UNSIGNED_BYTE, false, 0, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "after texture coordinate / color redefinition");

  var numQuads = 2;
  var indices = new Uint8List(numQuads * 6);
  for (var ii = 0; ii < numQuads; ++ii) {
      var offset = ii * 6;
      var quad = (ii == (numQuads - 1)) ? 4 : 0;
      indices[offset + 0] = quad + 0;
      indices[offset + 1] = quad + 1;
      indices[offset + 2] = quad + 2;
      indices[offset + 3] = quad + 2;
      indices[offset + 4] = quad + 1;
      indices[offset + 5] = quad + 3;
  }
  var indexObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
  gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after setting up indices");
  gl.drawElements(wgl.WebGL.TRIANGLES, numQuads * 6, wgl.WebGL.UNSIGNED_BYTE, 0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after drawing");
}
