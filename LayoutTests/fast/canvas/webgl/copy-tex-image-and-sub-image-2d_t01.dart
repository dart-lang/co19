/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify copyTexImage2D and copyTexSubImage2D
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
      attribute vec2 g_TexCoord0;

      varying vec2 texCoord;

      void main()
      {
          gl_Position = vec4(g_Position.x, g_Position.y, g_Position.z, 1.0);
          texCoord = g_TexCoord0;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision mediump float;
#endif
      uniform sampler2D tex;
      varying vec2 texCoord;
      void main()
      {
          gl_FragColor = texture2D(tex, texCoord);
      }
      </script>
      <canvas id="antialiasOn" width="2px" height="2px"></canvas>
      <canvas id="antialiasOff" width="2px" height="2px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var pixel = [0, 0, 0];
  var correctColor = null;
  var gl = null;

  runTestIteration(antialias)
  {
    if (antialias)
      gl = initWebGL("antialiasOn", "vshader", "fshader", [ "g_Position", "g_TexCoord0" ], [ 0, 0, 0, 1 ], 1);
    else
      gl = initWebGL("antialiasOff", "vshader", "fshader", [ "g_Position", "g_TexCoord0" ], [ 0, 0, 0, 1 ], 1, { 'antialias': false });

    var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);

    var textureLoc = gl.getUniformLocation(program, "tex");

    var vertices = new Float32List.fromList([
        1.0,  1.0, 0.0,
        -1.0,  1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0,  1.0, 0.0,
        -1.0, -1.0, 0.0,
        1.0, -1.0, 0.0]);
    var texCoords = new Float32List.fromList([
        1.0, 1.0,
        0.0, 1.0,
        0.0, 0.0,
        1.0, 1.0,
        0.0, 0.0,
        1.0, 0.0]);
    var texCoordOffset = vertices.lengthInBytes;

    var vbo = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER,
        texCoordOffset + texCoords.lengthInBytes,
        wgl.WebGL.STATIC_DRAW);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, vertices);
    gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, texCoordOffset, texCoords);

    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, texCoordOffset);

    gl.colorMask(true, true, true, false);
    gl.disable(wgl.WebGL.BLEND);
    debug('Testing copyTexImage2D');

    // Red canvas
    gl.clearColor(1, 0, 0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    var texture = gl.createTexture();
    // Bind the texture to texture unit 0
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    // Set up texture
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 2, 2, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, 2, 2, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    // Green canvas
    gl.clearColor(0, 1, 0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    // Point the uniform sampler to texture unit 0
    gl.uniform1i(textureLoc, 0);
    // Draw the triangles
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

    // Read back the rendering results, should be red
    var buf = new Uint8List(2 * 2 * 4);
    gl.readPixels(0, 0, 2, 2, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    var idx = 0;
    correctColor = [255, 0, 0];
    for (var y = 0; y < 2; y++) {
      for (var x = 0; x < 2; x++) {
        idx = (y * 2 + x) * 4;
        pixel[0] = buf[idx];
        pixel[1] = buf[idx + 1];
        pixel[2] = buf[idx + 2];
        shouldBeList(pixel, correctColor);
      }
    }

    debug('Testing copyTexSubImage2D');

    // Green canvas
    gl.clearColor(0, 1, 0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, 2, 2);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    // Blue canvas
    gl.clearColor(0, 0, 1, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    // Draw the triangles
    gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

    // Read back the rendering results, should be green
    gl.readPixels(0, 0, 2, 2, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    correctColor = [0, 255, 0];
    for (var y = 0; y < 2; y++) {
      for (var x = 0; x < 2; x++) {
        idx = (y * 2 + x) * 4;
        pixel[0] = buf[idx];
        pixel[1] = buf[idx + 1];
        pixel[2] = buf[idx + 2];
        shouldBeList(pixel, correctColor);
      }
    }
  }

  debug("Testing with antialias on");
  runTestIteration(true);
  debug("Testing with antialias off");
  runTestIteration(false);
}
