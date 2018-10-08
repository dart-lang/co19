/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description WebGL Non-Power of 2 texture conformance test.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="4" height="4" style="width: 40px; height: 30px;"></canvas>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      attribute vec2 texCoord0;
      varying vec2 texCoord;
      void main()
      {
          gl_Position = vPosition;
          texCoord = texCoord0;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision mediump float;
#endif
      uniform samplerCube tex;
      varying vec2 texCoord;
      void main()
      {
          gl_FragColor = textureCube(tex, normalize(vec3(texCoord, 1)));
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var program = wtu.setupTexturedQuad(gl);

  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  var tex = gl.createTexture();

  // Check that an NPOT texture not on level 0 generates INVALID_VALUE
  wtu.fillTexture(gl, tex, 5, 3, [0, 192, 128, 255], 1);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE,
      "gl.texImage2D with NPOT texture with level > 0 should return INVALID_VALUE");

  // Check that an NPOT texture on level 0 succeeds
  wtu.fillTexture(gl, tex, 5, 3, [0, 192, 128, 255]);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "gl.texImage2D with NPOT texture at level 0 should succeed");

  // Check that generateMipmap fails on NPOT
  gl.generateMipmap(wgl.WebGL.TEXTURE_2D);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION,
      "gl.generateMipmap with NPOT texture should return INVALID_OPERATION");

  var loc = gl.getUniformLocation(program, "tex");
  gl.uniform1i(loc, 0);

  // Check that nothing is drawn if filtering is not correct for NPOT
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.REPEAT);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.REPEAT);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 0, 0, 255],
      "NPOT texture with TEXTURE_WRAP set to REPEAT should draw with 0,0,0,255");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST_MIPMAP_LINEAR);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 0, 0, 255],
      "NPOT texture with TEXTURE_MIN_FILTER not NEAREST or LINEAR should draw with 0,0,0,255");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 192, 128, 255],
      "NPOT texture with TEXTURE_MIN_FILTER set to LINEAR should draw.");

  gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 1, wgl.WebGL.RGBA, 0, 0, 5, 3, 0);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE,
      "copyTexImage2D with NPOT texture with level > 0 should return INVALID_VALUE.");

  // Check that generateMipmap for an POT texture succeeds
  wtu.fillTexture(gl, tex, 4, 4, [0, 192, 128, 255]);
  gl.generateMipmap(wgl.WebGL.TEXTURE_2D);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "gl.texImage2D and gl.generateMipmap with POT texture at level 0 should succeed");

  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR_MIPMAP_LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.REPEAT);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.REPEAT);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 192, 128, 255],
      "POT texture with TEXTURE_MIN_FILTER set to LINEAR_MIPMAP_LINEAR should draw.");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  debug("");
  debug("check using cubemap");
  program = wtu.setupProgram(
      gl,
      [wtu.loadShaderFromScript(gl, 'vshader', wgl.WebGL.VERTEX_SHADER),
      wtu.loadShaderFromScript(gl, 'fshader', wgl.WebGL.FRAGMENT_SHADER)],
      ['vPosition', 'texCoord0'], [0, 1]);
  tex = gl.createTexture();

  fillCubeTexture(gl, tex, width, height, color, [opt_level=0]) {
    dynamic canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    var ctx2d = canvas.getContext('2d');
    ctx2d.fillStyle = "rgba(" + color.join(",") + ")";
    ctx2d.fillRect(0, 0, width, height);
    gl.bindTexture(wgl.WebGL.TEXTURE_CUBE_MAP, tex);
    var targets = [
      wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_X,
      wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_X,
      wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Y,
      wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Y,
      wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Z,
      wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Z];
    for (var tt = 0; tt < targets.length; ++tt) {
      gl.texImage2D(
          targets[tt], opt_level, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas);
    }
  };

  // Check that an NPOT texture not on level 0 generates INVALID_VALUE
  fillCubeTexture(gl, tex, 5, 3, [0, 192, 128, 255], 1);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE,
      "gl.texImage2D with NPOT texture with level > 0 should return INVALID_VALUE");

  // Check that an NPOT texture on level 0 succeeds
  fillCubeTexture(gl, tex, 5, 5, [0, 192, 128, 255]);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "gl.texImage2D with NPOT texture at level 0 should succeed");

  // Check that generateMipmap fails on NPOT
  gl.generateMipmap(wgl.WebGL.TEXTURE_CUBE_MAP);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION,
      "gl.generateMipmap with NPOT texture should return INVALID_OPERATION");

  loc = gl.getUniformLocation(program, "tex");
  gl.uniform1i(loc, 0);

  // Check that nothing is drawn if filtering is not correct for NPOT
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.REPEAT);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.REPEAT);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 0, 0, 255],
      "NPOT cubemap with TEXTURE_WRAP set to REPEAT should draw with 0,0,0,255");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST_MIPMAP_LINEAR);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 0, 0, 255],
      "NPOT cubemap with TEXTURE_MIN_FILTER not NEAREST or LINEAR should draw with 0,0,0,255");
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors from setup.");

  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 192, 128, 255],
      "NPOT cubemap with TEXTURE_MIN_FILTER set to LINEAR should draw.");

  // Check that an POT texture on level 0 succeeds
  fillCubeTexture(gl, tex, 4, 4, [0, 192, 128, 255]);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "gl.texImage2D with POT texture at level 0 should succeed");

  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR_MIPMAP_LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.REPEAT);
  gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.REPEAT);

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 0, 0, 255],
      "POT cubemap with TEXTURE_MIN_FILTER set to LINEAR_MIPMAP_LINEAR but no mips draw with 0,0,0,255");

  // Check that generateMipmap succeeds on POT
  gl.generateMipmap(wgl.WebGL.TEXTURE_CUBE_MAP);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR,
      "gl.generateMipmap with POT texture should return succeed");

  wtu.drawQuad(gl);
  wtu.checkCanvas(
      gl, [0, 192, 128, 255],
      "POT cubemap with TEXTURE_MIN_FILTER set to LINEAR_MIPMAP_LINEAR should draw.");
}
