/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests behavior under a restored context.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  var shouldGenerateGLError = wtu.shouldGenerateGLError;
  dynamic canvas;
  var gl;
  var extension;
  var bufferObjects;
  var program;
  var texture;
  var texColor = [255, 10, 20, 255];
  var allowRestore;
  var contextLostEventFired;
  var contextRestoredEventFired;

  var testLosingContext,testLosingAndRestoringContext,testRendering,
      testOriginalContext,testLostContext,testShouldNotRestoreContext,
      testResources,testRestoredContext;

  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  setupTest()
  {
    canvas = document.createElement("canvas");
    canvas.width = 1;
    canvas.height = 1;
    gl = wtu.create3DContext(canvas);
    extension = gl.getExtension("WEBGL_lose_context");
    if (extension == null) {
      debug("Could not find lose_context extension under the following names: WEBGL_lose_context");
      return false;
    }
    return true;
  }

  testLosingContext = ()
  {
    if (!setupTest())
      asyncEnd();

    debug("Test losing a context and inability to restore it.");

    canvas.addEventListener("webglcontextlost", (e) {
      testLostContext(e);
      // restore the context after this event has exited.
      setTimeout(() {
        // we didn't call prevent default so we should not be able to restore the context
        shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => extension.restoreContext());
        testLosingAndRestoringContext();
      }, 0);
    });
    canvas.addEventListener("webglcontextrestored", testShouldNotRestoreContext);
    allowRestore = false;
    contextLostEventFired = false;
    contextRestoredEventFired = false;

    testOriginalContext();
    extension.loseContext();
    // The context should be lost immediately.
    shouldBeTrue(gl.isContextLost());
    shouldBe(gl.getError(), wgl.WebGL.CONTEXT_LOST_WEBGL);
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    // gl methods should be no-ops
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.blendFunc(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_CUBE_MAP));
    // but the event should not have been fired.
    shouldBeFalse(contextLostEventFired);
  };

  testLosingAndRestoringContext = ()
  {
    if (!setupTest())
      asyncEnd();

    debug("Test losing and restoring a context.");

    canvas.addEventListener("webglcontextlost", (e) {
      testLostContext(e);
      // restore the context after this event has exited.
      setTimeout(() {
        shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => extension.restoreContext());
        // The context should still be lost. It will not get restored until the 
        // webglrestorecontext event is fired.
        shouldBeTrue(gl.isContextLost());
        shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
        // gl methods should still be no-ops
        shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.blendFunc(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_CUBE_MAP));
      }, 0);
    });
    canvas.addEventListener("webglcontextrestored", (e) {
      testRestoredContext();
      asyncEnd();
    });
    allowRestore = true;
    contextLostEventFired = false;
    contextRestoredEventFired = false;

    testOriginalContext();
    extension.loseContext();
    // The context should be lost immediately.
    shouldBeTrue(gl.isContextLost());
    shouldBe(gl.getError(), wgl.WebGL.CONTEXT_LOST_WEBGL);
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    // gl methods should be no-ops
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.blendFunc(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_CUBE_MAP));
    // but the event should not have been fired.
    shouldBeFalse(contextLostEventFired);
  };

  testRendering = ()
  {
    gl.clearColor(0, 0, 0, 255);
    gl.colorMask(true, true, true, false);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);

    program = wtu.setupSimpleTextureProgram(gl);
    bufferObjects = wtu.setupUnitQuad(gl);
    texture = wtu.createColoredTexture(gl, canvas.width, canvas.height, texColor);

    gl.uniform1i(gl.getUniformLocation(program, "tex"), 0);
    wtu.drawQuad(gl, [0, 0, 0, 255]);

    var compare = texColor.sublist(0,3);
    wtu.checkCanvasRect(gl, 0, 0, canvas.width, canvas.height, compare, "should be $compare");

    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
  };

  testOriginalContext = ()
  {
    debug("Test valid context");
    shouldBeFalse(gl.isContextLost());
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    testRendering();
  };

  testLostContext = (e)
  {
    debug("Test lost context");
    shouldBeFalse(contextLostEventFired);
    contextLostEventFired = true;
    shouldBeTrue(gl.isContextLost());
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    if (allowRestore)
      e.preventDefault();
  };

  testShouldNotRestoreContext = (e)
  {
    testFailed("Should not restore the context unless preventDefault is called on the context lost event");
  };

  testResources = (expected)
  {
    var tests = [
      () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture),
      () => gl.useProgram(program),
      () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, bufferObjects[0]),
    ];

    for (var i = 0; i < tests.length; ++i)
      shouldGenerateGLError(gl, expected, tests[i]);
  };

  testRestoredContext = ()
  {
    debug("Test restored context");
    shouldBeFalse(contextRestoredEventFired);
    contextRestoredEventFired = true;
    shouldBeFalse(gl.isContextLost());
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);

    // Validate that using old resources fails.
    testResources(wgl.WebGL.INVALID_OPERATION);

    testRendering();

    // Validate new resources created in testRendering().
    testResources(wgl.WebGL.NO_ERROR);
  };

  asyncStart();
  testLosingContext();
}
