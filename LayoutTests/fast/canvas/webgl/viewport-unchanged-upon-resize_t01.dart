/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies that GL viewport does not change when canvas is
 * resized
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec3 g_Position;

      void main()
      {
          gl_Position = vec4(g_Position.x, g_Position.y, g_Position.z, 1.0);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      void main()
      {
          gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
      }
      </script>
      <canvas id="example" width="4px" height="4px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = initWebGL("example", "vshader", "fshader", ["g_Position"],
      [0, 0, 1, 1], 1);
  var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);

  var vertices = new Float32List.fromList([
      1.0,  1.0, 0.0,
      -1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
      1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
      1.0, -1.0, 0.0]);
  var vbo = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, vertices, wgl.WebGL.STATIC_DRAW);

  gl.enableVertexAttribArray(0);
  gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

  // Clear and set up
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
  gl.useProgram(program);
  // Draw the triangle pair to the frame buffer
  gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

  // Ensure that the frame buffer is red at the sampled pixel
  var buf = new Uint8List(1 * 1 * 4);
  gl.readPixels(2, 2, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
  var passed = true;
  if (buf[0] != 255 ||
      buf[1] != 0 ||
      buf[2] != 0 ||
      buf[3] != 255) {
        testFailed(
            "Pixel at (2, 2) should have been (255, 0, 0, 255), was $buf");
        passed = false;
      }

  if (passed) {
    // Now resize the canvas
    dynamic canvas = document.getElementById("example");
    canvas.width = 8;
    canvas.height = 8;
    // Do another render
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
    // This time, because we did not change the viewport, it should
    // still be (0, 0, 4, 4), so only the lower-left quadrant should
    // have been filled.
    var buf = new Uint8List(1 * 1 * 4);
    gl.readPixels(6, 6, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    if (buf[0] != 0 ||
        buf[1] != 0 ||
        buf[2] != 255 ||
        buf[3] != 255) {
          testFailed(
              "Pixel at (6, 6) should have been (0, 0, 255, 255), was $buf");
          passed = false;
        }
  }

  if (passed)
    testPassed("Viewport correctly did not change size during canvas resize");
}
