/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description WebGL array bounds clamping conformance test.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="40" height="40" style="width: 40px; height: 40px;"></canvas>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
#ifdef GL_ES
      precision highp float;
#endif
      attribute vec4 vPosition;
      attribute float index;
      uniform float shades[8];
      varying vec4 texColor;
      void main()
      {
          gl_Position = vPosition;
          texColor = vec4(shades[int(index)], 0, 0, 1.0);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision highp float;
#endif
      varying vec4 texColor;
      void main()
      {
          gl_FragColor = texColor;
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  init() {
    debug("Checks that array access in a shader can not read out of bounds");

    var gl = initWebGL("example", "vshader", "fshader",
        [ "vPosition", "index" ], [ 1, 1, 1, 1 ], 1);
    var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);

    gl.disable(wgl.WebGL.DEPTH_TEST);
    gl.disable(wgl.WebGL.BLEND);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER,
        new Float32List.fromList([-1.0,1.0,0.0, 1.0,1.0,0.0, -1.0,-1.0,0.0,
                                  -1.0,-1.0,0.0, 1.0,1.0,0.0, 1.0,-1.0,0.0 ]),
        wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER,
        // Create an array that exercises well outside the
        // limits on each side, near the limits, and the
        // exact limits.
        // This should be clamped to [0, 0, 0, 7, 7, 7]
        new Float32List.fromList([-123456789.0, -1.0, 0.0, 7.0, 8.0, 123456789.0]),
        wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 1, wgl.WebGL.FLOAT, false, 0, 0);

    var loc = gl.getUniformLocation(program, "shades");
    gl.uniform1fv(loc, new Float32List.fromList([0.25, 0.5, 0.0, 0.0, 0.0, 0.0, 0.75, 1.0]));

    checkRedValue(x, y, value, msg) {
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
      gl.flush();
      var buf = new Uint8List(4);
      gl.readPixels(x, y, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      if (buf[0] != value || buf[1] != 0 || buf[2] != 0 || buf[3] != 255) {
        var info = ' expected: rgb($value, 0, 0, 255) was rgb(${buf})';
        debug(info);
        testFailed(msg+info);
        return;
      }
      testPassed(msg);
    }

    checkRedValue(0, 38, 64, "Top left corner should clamp to index 0");
    checkRedValue(37, 38, 64, "Inside top right corner should clamp to index 0");
    checkRedValue(0, 1, 64, "Inside bottom left corner should clamp to index 0");

    checkRedValue(38, 0, 255, "Bottom right corner should clamp to index 7");
    checkRedValue(3, 1, 255, "Outside bottom left corner should clamp to index 7");
    checkRedValue(38, 37, 255, "Outside top right corner should clamp to index 7");
  }

  init();
}
