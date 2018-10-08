/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description texImage2D ImageData Test
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
          attribute vec3 vPosition;
          attribute vec2 vTexCoord0;
          varying vec2 texCoord;
          void main()
          {
              gl_Position = vec4(vPosition.x, vPosition.y, vPosition.z, 1.0);
              texCoord = vTexCoord0;
          }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
          #ifdef GL_ES
          precision highp float;
          #endif
          uniform sampler2D tex;
          varying vec2 texCoord;
          void main()
          {
              gl_FragColor = texture2D(tex, texCoord);
          }
      </script>
      <canvas id="texcanvas" width="64px" height="64px"></canvas>
      <canvas id="example" width="64px" height="64px">
      There is supposed to be an example drawing here, but it's not important.
      </canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl;

  fail(x,y, buf, shouldBe)
  {
    var i = (y*64+x) * 4;
    var actual = buf.sublist(i, i+4);
    var reason = "pixel at ($x,$y) is $actual, should be $shouldBe";
    testFailed(reason);
  }
        
  checkGLError()
  {
    var error = gl.getError();
    if (error != wgl.WebGL.NO_ERROR) {
      testFailed("Expected wgl.WebGL.NO_ERROR, got $error");
    }
  }

  List<double> toFloatList(list) =>
      (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  init()
  {
    // Set up a canvas to get image data from
    dynamic canvas2d = document.getElementById("texcanvas");
    var context2d = canvas2d.getContext("2d");
    context2d.fillStyle = 'red';
    context2d.fillRect(0,0,64,64);

    gl = initWebGL("example", "vshader", "fshader",
        [ "vPosition", "vTexCoord0"], [ 1, 0, 1, 1 ], 100);
    var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    var vertices = float32list([
        -1,  1, 0,
        -1, -1, 0,
        1,  1, 0,
        1, -1, 0,
        1,  1, 0,
        -1, -1, 0]);
    var texCoords = float32list([
        0, 1,
        0, 0,
        1, 1,
        1, 0,
        1, 1,
        0, 0]);
    var g_texCoordOffset = vertices.lengthInBytes;
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, g_texCoordOffset + texCoords.lengthInBytes,
        wgl.WebGL.STATIC_DRAW);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, vertices);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, g_texCoordOffset, texCoords);

    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, g_texCoordOffset);

    // Create a texture from the canvas's image data
    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE,
        context2d.getImageData(0, 0, 64, 64));
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);

    var g_textureLoc = gl.getUniformLocation(program, "tex");
    gl.uniform1i(g_textureLoc, 0);

    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

    checkGLError();

    // Test several locations
    // Each line should be all red 
    var buf = new Uint8List(64 * 64 * 4);
    gl.readPixels(0, 0, 64, 64, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);

    var offset15 = 3840; // (15*64) * 4
    var offset40 = 10240; // (40*64) * 4
    var offset63 = 16128; // (63*64) * 4
    for (var i = 0; i < 64; ++i) {
      var test0 = (buf[i*4] != 255 || buf[i*4+1] != 0 || buf[i*4+2] != 0 || buf[i*4+3] != 255);
      var test15 = (buf[offset15+i*4] != 255 || buf[offset15+i*4+1] != 0 || buf[offset15+i*4+2] != 0 || buf[offset15+i*4+3] != 255);
      var test40 = (buf[offset40+i*4] != 255 || buf[offset40+i*4+1] != 0 || buf[offset40+i*4+2] != 0 || buf[offset40+i*4+3] != 255);
      var test63 = (buf[offset63+i*4] != 255 || buf[offset63+i*4+1] != 0 || buf[offset63+i*4+2] != 0 || buf[offset63+i*4+3] != 255);
      if (test0) {
        fail(i, 0, buf, "(255,0,0,255)");
        return;
      }
      if (test15) {
        fail(i, 15, buf, "(255,0,0,255)");
        return;
      }
      if (test40) {
        fail(i, 40, buf, "(255,0,0,255)");
        return;
      }
      if (test63) {
        fail(i, 63, buf, "(255,0,0,255)");
        return;
      }
    }
  }
  init();
}
