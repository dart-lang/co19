/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks that copying canvas results to a WebGL texture functions
 * without error.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="webgl-canvas" width="32px" height="32px"></canvas>
      <canvas id="canvas-2d" style="-webkit-transform: translateZ(0);"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas, canvas2d;
  var gl;
  var ctx;

  draw() {
    ctx.fillStyle = "rgb(200, 0, 0)";
    ctx.fillRect(0, 0, 256, 256);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d);

    wtu.drawQuad(gl);
    wtu.checkCanvasRect(gl, 0, 0, 1, 1, [200, 0, 0, 255], "Should have rendered red.", 1);

    ctx.fillStyle = "rgb(0, 0, 200)";
    ctx.fillRect(0, 0, 256, 256);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas2d);
    ctx.fillStyle = "rgb(200, 0, 0)";
    ctx.fillRect(0, 0, 256, 256);

    wtu.drawQuad(gl);
    wtu.checkCanvasRect(gl, 0, 0, 1, 1, [0, 0, 200, 255], "Should have rendered blue.", 1);

    asyncEnd();
  }

  canvas = document.getElementById("webgl-canvas");
  gl = create3DContext(canvas);

  canvas2d = document.getElementById("canvas-2d");

  // Set a size that ensures a hardware-accelerated canvas.
  canvas2d.width = 256;
  canvas2d.height = 256;
  ctx = canvas2d.getContext("2d");

  var program = wtu.setupTexturedQuad(gl);

  var texture = gl.createTexture();
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);

  gl.uniform1i(gl.getUniformLocation(program, "tex"), 0);
  gl.viewport(0, 0, canvas.width, canvas.height);

  // Ensure that the compositor has become active.
  setTimeout(draw, 0);

  asyncStart();
}

