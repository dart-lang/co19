/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies that GL framebuffer bindings do not change when canvas
 * is resized
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

var shouldBeUndefined = shouldBeNull;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="4px" height="4px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var green = [0, 255, 0, 255];
  var blue = [0, 0, 255, 255];
  var fboSize = 2;
  shouldBeTrue(fboSize < canvas.width);
  var fbo = gl.createFramebuffer();
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  var fboTex = gl.createTexture();
  gl.activeTexture(wgl.WebGL.TEXTURE1);
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, fboTex);
  gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, fboTex, 0);
  gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, fboSize, fboSize, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
  gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);

  checkFBO(color, msg) {
    wtu.checkCanvasRect(gl, 0, 0, fboSize, fboSize, color, msg);
    wtu.checkCanvasRect(gl, fboSize, fboSize, fboSize, fboSize, [0, 0, 0, 0], "area outside fbo should be transparent black");
  }

  // The FBO is 2x2 and it's bound so clearing should clear a 2x2 area
  // and calling read pixels should read the clear color in that 2x2 area
  // and 0,0,0,0 outside that area.
  //
  // If the FBO is no longer bound because of a WebGL implementation error
  // then likely the clear will clear the backbuffer and reading outside
  // the 2x2 area will not be 0,0,0,0

  test() {
    gl.clearColor(0, 0, 1, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
    checkFBO(blue, "should be blue");
    gl.clearColor(0, 1, 0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
    checkFBO(green, "should be green");
  }

  debug("test before resizing canvas");
  test();
  debug("test after resizing canvas");
  canvas.width = 8;
  test();
  debug("test after resizing canvas and waiting for compositing");
  canvas.width = 16;

  asyncStart();
  wtu.waitFrames(5, () {
    test();
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors.");
    asyncEnd();
  });
}
