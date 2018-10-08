/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests there is no garbage in transparent regions of images
 * uploaded as textures
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="32px" height="32px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl;
  var textureLoc;
  var texture;

  runTest(image)
  {
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    gl.enable(wgl.WebGL.BLEND);
    gl.blendFunc(wgl.WebGL.SRC_ALPHA, wgl.WebGL.ONE_MINUS_SRC_ALPHA);
    // Bind the texture to texture unit 0
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    // Point the uniform sampler to texture unit 0
    gl.uniform1i(textureLoc, 0);
    // Draw the triangles
    wtu.drawQuad(gl, [0, 0, 0, 255]);

    // Spot check a couple of 2x2 regions in the upper and lower left
    // corners; they should be the rgb values in the texture.
    var color = [0, 0, 0];
    debug("Checking lower left corner");
    wtu.checkCanvasRect(gl, 1, gl.canvas.height - 3, 2, 2, color,
        "shouldBe $color");
    debug("Checking upper left corner");
    wtu.checkCanvasRect(gl, 1, 1, 2, 2, color,
        "shouldBe $color");

    asyncEnd();
  }

  init()
  {
    dynamic canvas = document.getElementById("example");
    gl = wtu.create3DContext(canvas);
    var program = wtu.setupTexturedQuad(gl);
    gl.clearColor(0.5,0.5,0.5,1);
    gl.clearDepth(1);

    textureLoc = gl.getUniformLocation(program, "tex");

    // The input texture has 8 characters; take the leftmost one
    var coeff = 1.0 / 8.0;
    var texCoords = new Float32List.fromList([
        coeff, 1.0,
        0.0, 1.0,
        0.0, 0.0,
        coeff, 1.0,
        0.0, 0.0,
        coeff, 0.0]);

    var vbo = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vbo);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, texCoords, wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, 0);

    texture = wtu.loadTexture(gl, "$root/resources/bug-32888-texture.png", runTest);
  }

  asyncStart();

  init();
}
