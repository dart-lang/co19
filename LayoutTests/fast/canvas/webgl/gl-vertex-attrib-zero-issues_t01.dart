/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test some of the issues of the difference between attrib 0 on
 * OpenGL vs WebGL
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="50" height="50">
      </canvas>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
          attribute vec4 vPosition;
          void main()
          {
              gl_Position = vPosition;
          }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
          void main()
          {
              gl_FragColor = vec4(0.0,0.0,0.0,0.0);
          }
      </script>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);

  setup(numVerts, attribIndex) {
    var program = wtu.setupProgram(
        gl,
        [wtu.loadShaderFromScript(gl, 'vshader', wgl.WebGL.VERTEX_SHADER),
        wtu.loadShaderFromScript(gl, 'fshader', wgl.WebGL.FRAGMENT_SHADER)],
        ['vPosition'], [attribIndex]);
    // draw with something on attrib zero with a small number of vertices
    var vertexObject = gl.createBuffer();
    var g_program = program;
    var g_attribLocation = attribIndex;
    shouldBe(g_attribLocation, gl.getAttribLocation(g_program, 'vPosition'));
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(
        wgl.WebGL.ARRAY_BUFFER, new Float32List(numVerts * 3), wgl.WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(attribIndex, 3, wgl.WebGL.FLOAT, false, 0, 0);
    var indices = new Uint16List(numVerts);
    for (var ii = 0; ii < numVerts; ++ii) {
      indices[ii] = ii;
    }
    var indexBuffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexBuffer);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
    return program;
  }

  var p1 = setup(3, 0);
  var p2 = setup(60000, 3);

  for (var ii = 0; ii < 5; ++ii) {
    gl.useProgram(p1);
    gl.enableVertexAttribArray(0);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_SHORT, 0);
    glErrorShouldBe(
        gl, wgl.WebGL.NO_ERROR,
        "drawing using attrib 0 with 3 verts");

    gl.useProgram(p2);
    gl.enableVertexAttribArray(3);
    gl.drawArrays(wgl.WebGL.LINES, 0, 60000);
    glErrorShouldBe(
        gl, wgl.WebGL.NO_ERROR,
        "drawing using attrib 3 with 60000 verts");
  }

  wtu.checkCanvas(gl, [0, 0, 0, 0], "canvas should be 0, 0, 0, 0");
}
