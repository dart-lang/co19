/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests generation of synthetic and real GL errors
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

var shouldBeUndefined = shouldBeNull;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = create3DContext();
  var program = loadStandardProgram(context);

  // Other tests in this directory like getActiveTest and
  // incorrect-context-object-behaviour already test the raising of many
  // synthetic GL errors. This test verifies the raising of certain
  // known real GL errors, and contains a few regression tests for bugs
  // discovered in the synthetic error generation and in the WebGL
  // implementation itself.

  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);

  debug("Testing getActiveAttrib");
  // Synthetic OpenGL error
  shouldBeNull(context.getActiveAttrib(null, 2));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
  // Real OpenGL error
  shouldBeNull(context.getActiveAttrib(program, 2));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);

  debug("Testing getActiveUniform");
  // Synthetic OpenGL error
  shouldBeNull(context.getActiveUniform(null, 0));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
  // Real OpenGL error
  shouldBeNull(context.getActiveUniform(program, 50));
  glErrorShouldBe(context, wgl.WebGL.INVALID_VALUE);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);

  debug("Testing attempts to manipulate the default framebuffer");
  shouldBeUndefined(context.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
  shouldBeUndefined(context.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.RENDERBUFFER, null));
  // Synthetic OpenGL error
  glErrorShouldBe(context, wgl.WebGL.INVALID_OPERATION);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
  shouldBeUndefined(context.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, null, 0));
  // Synthetic OpenGL error
  glErrorShouldBe(context, wgl.WebGL.INVALID_OPERATION);
  // Error state should be clear by this point
  glErrorShouldBe(context, wgl.WebGL.NO_ERROR);
}
