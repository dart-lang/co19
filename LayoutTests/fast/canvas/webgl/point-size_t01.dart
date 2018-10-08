/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify GL_VERTEX_PROGRAM_POINT_SIZE is enabled in WebGL
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec3 pos;
      attribute vec4 colorIn;
      uniform float pointSize;
      varying vec4 color;

      void main()
      {
          gl_PointSize = pointSize;
          color = colorIn;
          gl_Position = vec4(pos.xyz, 3.0);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision mediump float;
#endif
      varying vec4 color;

      void main()
      {
          gl_FragColor = color;
      }
      </script>
      <canvas id="testbed" width="2px" height="2px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest() {
    var gl = initWebGL('testbed', 'vshader', 'fshader', ['pos', 'colorIn'], [0, 0, 0, 1], 1, { 'antialias': false });
    var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);
    if (gl == null) {
      testFailed('initWebGL(..) failed');
      return false;
    }
    gl.disable(wgl.WebGL.BLEND);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    // The choice of (0.4, 0.4) ensures that the centers of the surrounding
    // pixels are not contained within the point when it is of size 1, but
    // that they definitely are when it is of size 2.
    var vertices = new Float32List.fromList([
        0.4, 0.4, 0.0]);
    var colors = new Uint8List.fromList([
        255, 0, 0, 255]);

    var colorOffset = vertices.lengthInBytes;

    var vbo = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, colorOffset + colors.lengthInBytes, wgl.WebGL.STATIC_DRAW);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, vertices);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, colorOffset, colors);

    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(1, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, colorOffset);
    gl.enableVertexAttribArray(1);

    var locPointSize = gl.getUniformLocation(program, 'pointSize');

    debug('Draw a point of size 1 and verify it does not touch any other pixels.');

    gl.uniform1f(locPointSize, 1.0);
    gl.drawArrays(wgl.WebGL.POINTS, 0, vertices.length ~/ 3);
    var buf = new Uint8List(2 * 2 * 4);
    gl.readPixels(0, 0, 2, 2, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    var index = 0;
    for (var y = 0; y < 2; ++y) {
      for (var x = 0; x < 2; ++x) {
        var correctColor = [0, 0, 0];
        if (x == 1 && y == 1)
          correctColor[0] = 255;
        if (buf[index] != correctColor[0] || buf[index + 1] != correctColor[1] || buf[index + 2] != correctColor[2]) {
          testFailed('Drawing a point of size 1 touched pixels that should not be touched');
          return false;
        }
        index += 4;
      }
    }
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    debug('Draw a point of size 2 and verify it fills the appropriate region.');

    gl.uniform1f(locPointSize, 2.0);
    gl.drawArrays(wgl.WebGL.POINTS, 0, vertices.length ~/ 3);
    gl.readPixels(0, 0, 2, 2, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    index = 0;
    for (var y = 0; y < 2; ++y) {
      for (var x = 0; x < 2; ++x) {
        var correctColor = [255, 0, 0];
        if (buf[index] != correctColor[0] || buf[index + 1] != correctColor[1] || buf[index + 2] != correctColor[2]) {
          testFailed('Drawing a point of size 2 failed to fill the appropriate region');
          return false;
        }
        index += 4;
      }
    }

    return true;
  }

  if (runTest())
    testPassed("");
}
