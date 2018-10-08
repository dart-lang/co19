/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify renderbuffers are initialized to 0 before being read in
 * WebGL
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="testbed" width="400px" height="400px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(gl, width, height) {
    debug('Test whether the WebGL internal buffers have been initialized to 0.');
    var totalBytes = width * height * 4;
    var buf = new Uint8List(totalBytes);
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    if (gl.getError() != wgl.WebGL.NO_ERROR) {
      testFailed('GL error detected after readPixels().');
      return false;
    }
    for (var i = 0; i < totalBytes; ++i) {
      if (buf[i] != 0) {
        testFailed('WebGL internal buffers are dirty.');
        return false;
      }
    }
    testPassed('Buffers have been initialized to 0.');

    debug('Test whether user created buffers have been initialized to 0.');
    var fbo = gl.createFramebuffer();
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
    var colorbuffer = gl.createRenderbuffer();
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorbuffer);
    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, width, height);
    if (gl.getError() != wgl.WebGL.NO_ERROR) {
      testFailed('GL error detected after renderbufferStorage(internalformat = RGBA4).');
      return false;
    }
    gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorbuffer);
    if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) != wgl.WebGL.FRAMEBUFFER_COMPLETE) {
      testFailed('Framebuffer incomplete.');
      return false;
    }
    gl.readPixels(0, 0, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    if (gl.getError() != wgl.WebGL.NO_ERROR) {
      testFailed('GL error detected after readPixels().');
      return false;
    }
    for (var i = 0; i < totalBytes; ++i) {
      if (buf[i] != 0) {
        testFailed('User created buffers are dirty.');
        return false;
      }
    }

    testPassed('Buffers have been initialized to 0.');
    return true;
  }

  dynamic canvas = document.getElementById("testbed");
  var gl = canvas.getContext("experimental-webgl");
  if (gl != null) {
    runTest(gl, canvas.width, canvas.height);

    // Testing that canvas resizing will clear the buffers with 0 instead of the current clear values.
    gl.clearColor(1, 0, 0, 1);
    canvas.width += 1;
    canvas.height += 1;
    runTest(gl, canvas.width, canvas.height);

    // Testing buffer clearing won't change the clear values.
    var clearColor = gl.getParameter(wgl.WebGL.COLOR_CLEAR_VALUE);
    shouldBeList(clearColor, [1, 0, 0, 1]);
  } else
    testFailed('canvas.getContext() failed');
}
