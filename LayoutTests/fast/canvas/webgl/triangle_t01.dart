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
      <canvas id="example" width="50" height="50">
      There is supposed to be an example drawing here, but it's not important.
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
              gl_FragColor = vec4(1.0,0.0,0.0,1.0);
          }
      </script>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  List<double> toFloatList(list) =>
      (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  fail(x,y, buf, shouldBe)
  {
    var i = (y*50+x) * 4;
    var actual = buf.sublist(i, i+4);
    var reason = "pixel at ($x,$y) is $actual, should be $shouldBe";
    testFailed(reason);
  }


  init()
  {
    var gl = initWebGL("example", "vshader", "fshader", [ "vPosition"], [ 0, 0, 0, 1 ], 1);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list([ 0,0.5,0, -0.5,-0.5,0, 0.5,-0.5,0 ]), wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 3);

    var buf = new Uint8List(50 * 50 * 4);
    gl.readPixels(0, 0, 50, 50, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);

    // Test several locations
    // First line should be all black
    for (var i = 0; i < 50; ++i)
      if (buf[i*4] != 0 || buf[i*4+1] != 0 || buf[i*4+2] != 0 || buf[i*4+3] != 255) {
        fail(i, 0, buf, "(0,0,0,255)");
        return;
      }

    // Line 15 should be red for at least 10 red pixels starting 20 pixels in
    var offset = (15*50+20) * 4;
    for (var i = 0; i < 10; ++i)
      if (buf[offset+i*4] != 255 || buf[offset+i*4+1] != 0 || buf[offset+i*4+2] != 0 || buf[offset+i*4+3] != 255) {
        fail(20 + i, 15, buf, "(255,0,0,255)");
        return;
      }
    // Last line should be all black
    offset = (49*50) * 4;
    for (var i = 0; i < 50; ++i)
      if (buf[offset+i*4] != 0 || buf[offset+i*4+1] != 0 || buf[offset+i*4+2] != 0 || buf[offset+i*4+3] != 255) {
        fail(i, 49, buf, "(0,0,0,255)");
        return;
      }
  }

  init();
}
