/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that glActiveTexture and glBindTexture work as expected.
 * Specifically texture targets are per active texture unit.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="2" height="2" style="width: 40px; height: 40px;"></canvas>
      <canvas id="canvas2d" width="1" height="1" style="width: 40px; height: 40px;"></canvas>
      <div id="description"></div>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
      uniform mat4 world;
      attribute vec3 vPosition;
      attribute vec2 texCoord0;
      varying vec2 texCoord;
      void main()
      {
        gl_Position = world * vec4(vPosition, 1);
        texCoord = texCoord0;
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
      ''', treeSanitizer: new NullTreeSanitizer());

  List<double> toFloatList(list) =>
      (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  init()
  {
    dynamic canvas2d = document.getElementById("canvas2d");
    var ctx2d = canvas2d.getContext("2d");

    var gl = initWebGL("example", "vshader", "fshader",
        ["vPosition", "texCoord0"],
        [ 0, 0, 0, 1 ], 1);
    var program = gl.getParameter(wgl.CURRENT_PROGRAM);

    gl.disable(wgl.DEPTH_TEST);
    gl.disable(wgl.BLEND);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
    gl.bufferData(
        wgl.ARRAY_BUFFER,
        float32list([-1, 1,0, 1,1,0, -1,-1,0,
          -1,-1,0, 1,1,0,  1,-1,0]),
        wgl.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.FLOAT, false, 0, 0);

    vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
    gl.bufferData(
        wgl.ARRAY_BUFFER,
        float32list([ 0,0, 1,0, 0,1,
          0,1, 1,0, 1,1]),
        wgl.STATIC_DRAW);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.FLOAT, false, 0, 0);
    shouldBe(gl.getError(), wgl.NO_ERROR);

    var colors = [
      [0,192,128,255],
      [128,64,255,255],
      [192,255,64,255],
      [200,0,255,255]];

    // Make 4 textures by using 4 active texture units.
    var textures = [];
    for (var ii = 0; ii < colors.length; ++ii) {
      var tex = gl.createTexture();
      gl.activeTexture(wgl.TEXTURE0 + ii);
      gl.bindTexture(wgl.TEXTURE_2D, tex);
      textures.add(tex);
    }
    shouldBe(gl.getError(), wgl.NO_ERROR);

    // now use each texture unit to write into the textures,
    for (var ii = 0; ii < colors.length; ++ii) {
      var c = colors[ii];
      ctx2d.fillStyle =
        "rgba(" + c.join(",") + ")";
      ctx2d.fillRect(0, 0, 1, 1);
      gl.activeTexture(wgl.TEXTURE0 + ii);
      gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE,
          canvas2d);
    }
    shouldBe(gl.getError(), wgl.NO_ERROR);

    var textureLoc = gl.getUniformLocation(program, "tex");
    var worldLoc = gl.getUniformLocation(program, "world");
    shouldBe(gl.getError(), wgl.NO_ERROR);

    gl.clearColor(1,0,0,1);
    gl.clear(wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT);

    for (var ii = 0; ii < colors.length; ++ii) {
      var x = ii % 2;
      var y = floor(ii / 2);
      gl.uniform1i(textureLoc, ii);
      gl.uniformMatrix4fv(
          worldLoc, false, float32list(
          [0.5, 0, 0, 0,
          0, 0.5, 0, 0,
          0, 0, 1, 0,
          -0.5 + x, -0.5 + y, 0, 1]));
      gl.drawArrays(wgl.TRIANGLES, 0, 6);
    }
    shouldBe(gl.getError(), wgl.NO_ERROR);

    for (var ii = 0; ii < colors.length; ++ii) {
      var c = colors[ii];
      var x = ii % 2;
      var y = floor(ii / 2);
      var buf = new Uint8List(4);
      gl.readPixels(x, y, 1, 1, wgl.RGBA, wgl.UNSIGNED_BYTE, buf);
      var msg = 'expected:' + c.join(',') + ' found: ' + buf.join(',');
      if (buf[0] != c[0] ||
          buf[1] != c[1] ||
          buf[2] != c[2] ||
          buf[3] != c[3])
        testFailed(msg);
      else
        testPassed(msg);
    }
  }

  init();
}
