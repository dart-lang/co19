/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests to check user code cannot access uninitialized data from
 * GL resources.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("canvas");
  var gl = create3DContext(canvas);
  if (gl == null)
    testFailed("Context created.");
  else
    testPassed("Context created.");

  setupTexture(texWidth, texHeight) {
    var texture = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, texWidth, texHeight, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);

    // this can be quite undeterministic so to improve odds of seeing uninitialized data write bits
    // into tex then delete texture then re-create one with same characteristics (driver will likely reuse mem)
    // with this trick on r59046 WebKit/OSX I get FAIL 100% of the time instead of ~15% of the time.

    var badData = new Uint8List(texWidth * texHeight * 4);
    for (var i = 0; i < badData.length; ++i)
      badData[i] = i % 255;

    gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, texWidth, texHeight, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, badData);
    gl.finish(); // make sure it has been uploaded

    gl.deleteTexture(texture);
    gl.finish(); // make sure it has been deleted

    texture = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    return texture;
  }

  checkNonZeroPixels(texture, texWidth, texHeight, skipX, skipY, skipWidth, skipHeight, skipR, skipG, skipB, skipA) {
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, null);
    var fb = gl.createFramebuffer();
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fb);
    gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, texture, 0);
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);

    var data = new Uint8List(texWidth * texHeight * 4);
    gl.readPixels(0, 0, texWidth, texHeight, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, data);

    var k = 0;
    for (var y = 0; y < texHeight; ++y) {
      for (var x = 0; x < texWidth; ++x) {
        var index = (y * texWidth + x) * 4;
        if (x >= skipX && x < skipX + skipWidth && y >= skipY && y < skipY + skipHeight) {
          if (data[index] != skipR || data[index + 1] != skipG || data[index + 2] != skipB || data[index + 3] != skipA) {
            testFailed("non-zero pixel values are wrong");
            return;
          }
        } else {
          for (var i = 0; i < 4; ++i) {
            if (data[index + i] != 0)
              k++;
          }
        }
      }
    }
    if (k > 0) {
      testFailed("Found $k non-zero bytes");
    } else {
      testPassed("All data initialized");
    }
  }

  var width = 512;
  var height = 512;

  debug("");
  debug("Reading an uninitialized texture (texImage2D) should succeed with all bytes set to 0.");

  var tex = setupTexture(width, height);
  gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, width, height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
  checkNonZeroPixels(tex, width, height, 0, 0, 0, 0, 0, 0, 0, 0);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexImage2D) should succeed with all bytes set to 0.");

  tex = setupTexture(width, height);
  var fbo = gl.createFramebuffer();
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  var rbo = gl.createRenderbuffer();
  gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo);
  var fboWidth = 16;
  var fboHeight = 16;
  gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, fboWidth, fboHeight);
  gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
  gl.clearColor(1.0, 0.0, 0.0, 1.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, width, height, 0);
  checkNonZeroPixels(tex, width, height, 0, 0, fboWidth, fboHeight, 255, 0, 0, 255);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexImage2D with negative x and y) should succeed with all bytes set to 0.");

  tex = setupTexture(width, height);
  fbo = gl.createFramebuffer();
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  rbo = gl.createRenderbuffer();
  gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo);
  fboWidth = 16;
  fboHeight = 16;
  gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, fboWidth, fboHeight);
  gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
  gl.clearColor(1.0, 0.0, 0.0, 1.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  var x = -8;
  var y = -8;
  gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, x, y, width, height, 0);
  checkNonZeroPixels(tex, width, height, -x, -y, fboWidth, fboHeight, 255, 0, 0, 255);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexImage2D from WebGL internal fbo) should succeed with all bytes set to 0.");

  tex = setupTexture(width, height);
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
  gl.clearColor(0.0, 1.0, 0.0, 0.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, width, height, 0);
  checkNonZeroPixels(tex, width, height, 0, 0, canvas.width, canvas.height, 0, 255, 0, 0);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexSubImage2D) should succeed with all bytes set to 0.");

  tex = gl.createTexture();
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  var data = new Uint8List(width * height * 4);
  for (var i = 0; i < width * height * 4; ++i)
    data[i] = 255;
  gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, width, height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, data);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  fbo = gl.createFramebuffer();
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  rbo = gl.createRenderbuffer();
  gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo);
  fboWidth = 16;
  fboHeight = 16;
  gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, fboWidth, fboHeight);
  gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
  gl.clearColor(1.0, 0.0, 0.0, 1.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, width, height);
  checkNonZeroPixels(tex, width, height, 0, 0, fboWidth, fboHeight, 255, 0, 0, 255);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexSubImage2D with negative x and y) should succeed with all bytes set to 0.");

  tex = gl.createTexture();
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  data = new Uint8List(width * height * 4);
  for (var i = 0; i < width * height * 4; ++i)
    data[i] = 255;
  gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, width, height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, data);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  fbo = gl.createFramebuffer();
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  rbo = gl.createRenderbuffer();
  gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo);
  fboWidth = 16;
  fboHeight = 16;
  gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, fboWidth, fboHeight);
  gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo);
  shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
  gl.clearColor(1.0, 0.0, 0.0, 1.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  x = -8;
  y = -8;
  gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, x, y, width, height);
  checkNonZeroPixels(tex, width, height, -x, -y, fboWidth, fboHeight, 255, 0, 0, 255);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Reading an uninitialized portion of a texture (copyTexSubImage2D from WebGL internal fbo) should succeed with all bytes set to 0.");

  tex = gl.createTexture();
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  data = new Uint8List(width * height * 4);
  for (var i = 0; i < width * height * 4; ++i)
    data[i] = 255;
  gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, width, height, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, data);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
  gl.clearColor(0.0, 1.0, 0.0, 0.0);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
  gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, width, height);
  checkNonZeroPixels(tex, width, height, 0, 0, canvas.width, canvas.height, 0, 255, 0, 0);
  gl.deleteTexture(tex);
  gl.finish();
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  //TODO: uninitialized vertex array buffer
  //TODO: uninitialized vertex elements buffer
  //TODO: uninitialized framebuffer? (implementations would need to do a GL clear at first binding?)
  //TODO: uninitialized renderbuffer? (implementations would need to do a GL clear at first binding?)
  //TODO: uninitialized uniform arrays?
}
