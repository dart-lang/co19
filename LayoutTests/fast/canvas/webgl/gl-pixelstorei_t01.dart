/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="50" height="50"></canvas>
      <canvas id="2d00" width="50" height="50"></canvas>
      <canvas id="2d01" width="50" height="50"></canvas>
      <canvas id="2d02" width="50" height="50"></canvas>
      <canvas id="2d03" width="50" height="50"></canvas>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      void main() {
        gl_Position = vPosition;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      void main() {
        gl_FragColor = vec4(1.0,0.0,0.0,1.0);
      }
      </script>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  fail(x,y, name, buf, shouldBe) {
    var reason = "pixel in $name at ($x,$y)is ${buf.sublist(0,4)}, should be $shouldBe";
    testFailed(reason);
  }

  pass(name) {
    testPassed("drawing is correct in " + name);
  }

  dynamic gl;

  init() {
    debug("There should be 5 red triangles on 5 black squares above");

    debug("This test checks that drawImage and readPixels are not effected by wgl.WebGL.Pixelstorei(wgl.WebGL.PACK_ALIGNMENT) and visa versa");

    var canvas3d = document.getElementById("example");
    gl = initWebGL("example", "vshader", "fshader", [ "vPosition"], [ 0, 0, 0, 1 ], 1);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([ 0.0,0.5,0.0, -0.5,-0.5,0.0, 0.5,-0.5,0.0 ]), wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 3);

    checkData(buf, name) {
      // Test several locations
      // First line should be all black
      for (var i = 0; i < 50; ++i) {
        if (buf[i*4] != 0 || buf[i*4+1] != 0 || buf[i*4+2] != 0 || buf[i*4+3] != 255) {
          fail(i, 0, name, buf, "(0,0,0,255)");
          return;
        }
      }

      // Line 25 should be red for at least 6 red pixels starting 22 pixels in
      var offset = (25*50+22) * 4;
      for (var i = 0; i < 6; ++i) {
        if (buf[offset+i*4] != 255 || buf[offset+i*4+1] != 0 || buf[offset+i*4+2] != 0 || buf[offset+i*4+3] != 255) {
          fail(22 + i, 25, name, buf, "(255,0,0,255)");
          return;
        }
      }

      // Last line should be all black
      offset = (49*50) * 4;
      for (var i = 0; i < 50; ++i) {
        if (buf[offset+i*4] != 0 || buf[offset+i*4+1] != 0 || buf[offset+i*4+2] != 0 || buf[offset+i*4+3] != 255) {
          fail(i, 49, name, buf, "(0,0,0,255)");
          return;
        }
      }

      pass(name);
    }

    var ctx2d;

    checkColors() {
      var buf = new Uint8List(50 * 50 * 4);
      gl.readPixels(0, 0, 50, 50, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
      checkData(buf, "3d context");
      var imgData = ctx2d.getImageData(0, 0, 50, 50);
      checkData(imgData.data, "2d context");
    }

    var table = [1, 2, 4, 8];
    for (var ii = 0; ii < table.length; ++ii) {
      gl.pixelStorei(wgl.WebGL.PACK_ALIGNMENT, table[ii]);
      dynamic canvas = document.getElementById("2d0$ii");
      ctx2d = canvas.getContext("2d");
      ctx2d.globalCompositeOperation = 'copy';
      ctx2d.drawImage(canvas3d, 0, 0);
      checkColors();
      assertMsg(gl.getParameter(wgl.WebGL.PACK_ALIGNMENT) == table[ii],
          "PACK_ALIGNMENT is ${table[ii]}");
    }
  }

  init();
}
