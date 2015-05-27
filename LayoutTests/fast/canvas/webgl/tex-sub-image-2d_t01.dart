/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests texSubImage2D upload path from Uint8List
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision highp float;
#endif
      uniform sampler2D tex;
      varying vec2 texCoord;

      void main()
      {
          float intensity = texture2D(tex, texCoord).a;
          gl_FragColor = vec4(intensity, intensity, intensity, 1.0);
      }
      </script>
      <canvas id="example" width="256px" height="1px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var program = wtu.setupProgram(
      gl,
      [wtu.setupSimpleTextureVertexShader(gl),
      wtu.loadShaderFromScript(gl, "fshader")],
      ['vPosition', 'texCoord0']);
  wtu.setupUnitQuad(gl);
  var textureWidth = 256;
  var textureHeight = 1;

  var textureLoc = gl.getUniformLocation(program, "tex");

  var texture = gl.createTexture();
  gl.bindTexture(wgl.TEXTURE_2D, texture);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_S, wgl.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_T, wgl.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST);
  gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MAG_FILTER, wgl.NEAREST);
  // Allocate the texture object
  gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.ALPHA, textureWidth, textureHeight, 0, wgl.ALPHA, wgl.UNSIGNED_BYTE, null);
  // Prepare the image data
  var array = new Uint8List(textureWidth);
  for (var i = 0; i < textureWidth; i++)
    array[i] = i;
  // Fill the texture object with data -- this is actually the code path being tested
  gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, textureWidth, textureHeight, wgl.ALPHA, wgl.UNSIGNED_BYTE, array);

  // Clear and set up
  gl.clear(wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT);
  gl.bindTexture(wgl.TEXTURE_2D, texture);
  gl.useProgram(program);
  gl.uniform1i(textureLoc, 0);
  // Draw the texture to the frame buffer
  gl.drawArrays(wgl.TRIANGLES, 0, 6);

  // Read back the frame buffer
  var buf = new Uint8List(textureWidth * textureHeight * 4);
  gl.readPixels(0, 0, textureWidth, textureHeight, wgl.RGBA, wgl.UNSIGNED_BYTE, buf);

  // Verify the frame buffer's contents
  for (var i = 0; i < textureWidth; i++) {
    var val = i;
    var actual = buf.sublist(4*i, 4*i+3);
    debug("pixel at ($i, 0)");
    shouldBeList(actual, [val,val,val]);
  }
}
