/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as WebGLTestUtils;

main() {
  var evt;
  dynamic canvas;
  var context;
  var extension;

  createNewCanvas()
  {
    canvas = document.createElement("canvas");
    canvas.width = 1;
    canvas.height = 1;

    context = WebGLTestUtils.create3DContext(canvas);
    extension = context.getExtension("WEBGL_lose_context");
    if (extension == null) {
      debug("Could not find the WEBGL_lose_context extension.");
      return;
    }
  }

  runTest2()
  {
    createNewCanvas();
    canvas.addEventListener("webglcontextlost", (e) {
      e.preventDefault();
      // Restore the context after event dispatch has finished.
      setTimeout(() {
        // Because context restoration is specified as being asynchronous, we can not verify
        // that the GL error state is empty here.
        extension.restoreContext();
      }, 0);
    }, false);
    canvas.addEventListener("webglcontextrestored", (e) {
      evt = e;
      shouldBe(context.getError(), wgl.WebGL.NO_ERROR);
      debug("Test that the event passed to a listener of webglcontextrestored is a WebGLContextEvent.");
      shouldBeTrue(evt is wgl.ContextEvent);
      shouldBe(evt.statusMessage, '');

      setTimeout(asyncEnd, 0);
    }, false);
    extension.loseContext();
  }

  runTest1()
  {
    createNewCanvas();
    canvas.addEventListener("webglcontextlost", (e) {
      evt = e;
      debug("Test that the event passed to a listener of webglcontextlost is a WebGLContextEvent.");
      shouldBeTrue(evt is wgl.ContextEvent);
      shouldBe(evt.statusMessage, '');
      // Start the next test when event dispatch has finished.
      setTimeout(() {
        runTest2();
      }, 0);
    }, false);
    extension.loseContext();
  }

  asyncStart();
  runTest1();
}
