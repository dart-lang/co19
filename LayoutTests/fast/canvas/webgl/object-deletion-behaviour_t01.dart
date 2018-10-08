/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests deletion behavior for texture, renderbuffer, shader, and
 * program
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = wtu.create3DContext();
  var shouldGenerateGLError = wtu.shouldGenerateGLError;

  debug("");
  debug("shader and program deletion");

  var vertexShader = wtu.loadStandardVertexShader(gl);
  assertMsg(vertexShader != null, "vertex shader loaded");
  var fragmentShader = wtu.loadStandardFragmentShader(gl);
  assertMsg(fragmentShader != null, "fragment shader loaded");

  var program = gl.createProgram();
  shouldBeNonNull(program);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.attachShader(program, vertexShader));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.attachShader(program, fragmentShader));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.linkProgram(program));
  shouldBeTrue(gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.useProgram(program));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteShader(vertexShader));
  shouldBeTrue(gl.isShader(vertexShader));
  shouldBeTrue(gl.getShaderParameter(vertexShader, wgl.WebGL.DELETE_STATUS));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.detachShader(program, vertexShader));
  shouldBeFalse(gl.isShader(vertexShader));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteShader(fragmentShader));
  shouldBeTrue(gl.isShader(fragmentShader));
  shouldBeTrue(gl.getShaderParameter(fragmentShader, wgl.WebGL.DELETE_STATUS));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteProgram(program));
  shouldBeTrue(gl.isProgram(program));
  shouldBeTrue(gl.getProgramParameter(program, wgl.WebGL.DELETE_STATUS));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.useProgram(null));
  shouldBeFalse(gl.isProgram(program));
  shouldBeFalse(gl.isShader(fragmentShader));

  debug("");
  debug("texture deletion");

  var fbo = gl.createFramebuffer(), fbo2 = gl.createFramebuffer(), fbo3 = gl.createFramebuffer();
  shouldBeNonNull(fbo);
  shouldBeNonNull(fbo2);
  shouldBeNonNull(fbo3);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));

  var tex = gl.createTexture();
  shouldBeNonNull(tex);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex));
  shouldBe(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D), tex);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0));
  shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), tex);
  shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE), wgl.WebGL.TEXTURE);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(tex));
  // Deleting a texture bound to the currently-bound fbo is the same as
  // detaching the textue from fbo first, then delete the texture.
  shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE), wgl.WebGL.NONE);
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME));
  shouldBeFalse(gl.isTexture(tex));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D));

  var texCubeMap = gl.createTexture();
  shouldBeNonNull(texCubeMap);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_CUBE_MAP, texCubeMap));
  shouldBe(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_CUBE_MAP), texCubeMap);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(texCubeMap));
  shouldBeFalse(gl.isTexture(texCubeMap));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_CUBE_MAP));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_CUBE_MAP, texCubeMap));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_CUBE_MAP));

  var t = gl.createTexture();
  shouldBeNonNull(t);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, t));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(t));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, t));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE));

  var t2 = gl.createTexture();
  shouldBeNonNull(t2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.activeTexture(wgl.WebGL.TEXTURE0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, t2));
  shouldBe(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D), t2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.activeTexture(wgl.WebGL.TEXTURE1));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, t2));
  shouldBe(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D), t2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(t2));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.activeTexture(wgl.WebGL.TEXTURE0));
  shouldBeNull(gl.getParameter(wgl.WebGL.TEXTURE_BINDING_2D));

  debug("");
  debug("renderbuffer deletion");

  var rbo = gl.createRenderbuffer(), rbo2 = gl.createRenderbuffer(), rbo3 = gl.createRenderbuffer();
  shouldBeNonNull(rbo);
  shouldBeNonNull(rbo2);
  shouldBeNonNull(rbo3);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldBe(gl.getParameter(wgl.WebGL.RENDERBUFFER_BINDING), rbo);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
  shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), rbo);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo));
  // Deleting a renderbuffer bound to the currently-bound fbo is the same as
  // detaching the renderbuffer from fbo first, then delete the renderbuffer.
  shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE), wgl.WebGL.NONE);
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME));
  shouldBeFalse(gl.isRenderbuffer(rbo));
  shouldBeNull(gl.getParameter(wgl.WebGL.RENDERBUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldBeNull(gl.getParameter(wgl.WebGL.RENDERBUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo2));
  shouldBe(gl.getParameter(wgl.WebGL.RENDERBUFFER_BINDING), rbo2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo3));
  shouldBe(gl.getParameter(wgl.WebGL.RENDERBUFFER_BINDING), rbo2);

  debug("");
  debug("using deleted renderbuffer");
  rbo = gl.createRenderbuffer();
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    // make backbuffer red
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(1,0,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // make fbo green
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    // delete renderbuffer. It should still be attached to fbo though.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [255,0,0,255], "backbuffer should be red"));
    // Use fbo that has deleted rbo.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,0,1,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [0,0,255,255], "fbo should be blue"));
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [255,0,0,255], "backbuffer should be red"));
  }

  debug("");
  debug("renderbuffer attached twice to same framebuffer");
  rbo = gl.createRenderbuffer();
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    rbo2 = gl.createRenderbuffer();
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo2));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16));
    // attach rbo2 at two attachment points incompatible with it
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.RENDERBUFFER, rbo2));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.STENCIL_ATTACHMENT, wgl.WebGL.RENDERBUFFER, rbo2));
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), rbo2);
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.STENCIL_ATTACHMENT, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), rbo2);
    // fbo can't be complete as rbo2 is attached at incompatible attachment points
    shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // now we delete rbo2, which detaches it from the two attachment points where it currently is attached
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo2));
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE), wgl.WebGL.NONE);
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.STENCIL_ATTACHMENT, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE), wgl.WebGL.NONE);
    // we should now be in the same state as before with only rbo attached, so fbo should be complete again
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), rbo);
  }
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));

  debug("");
  debug("using deleted texture");
  tex = gl.createTexture();
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    // make fbo green
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    // delete texture. It should still be attached to fbo though.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(tex));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 1, 1, [255,0,0,255], "backbuffer should be red"));
    // Use fbo that has deleted texture.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 1, 1, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,0,1,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 1, 1, [0,0,255,255], "fbo should be blue"));
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [255,0,0,255], "backbuffer should be red"));
  }

  debug("");
  debug("using deleted renderbuffer");
  rbo = gl.createRenderbuffer();
  shouldBeNonNull(rbo);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // make backbuffer red
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(1,0,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // make fbo green
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // delete renderbuffer. It should still be attached to fbo2 though.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteRenderbuffer(rbo));
    // fbo has no attachments
    shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // Use fbo2 that has deleted rbo.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,0,1,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [0,0,255,255], "fbo should be blue"));
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), rbo);

    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME));
    shouldGenerateGLError(gl, wgl.WebGL.NONE, () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE));
    shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [255,0,0,255], "backbuffer should be red"));
  }

  debug("");
  debug("using deleted texture");
  tex = gl.createTexture();
  shouldBeNonNull(tex);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, tex, 0));
    // make fbo green
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // delete texture. It should still be attached to fbo2 though.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteTexture(tex));
    // fbo has no attachments
    shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // Use fbo that has deleted texture.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2));
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 1, 1, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,0,1,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 1, 1, [0,0,255,255], "fbo should be blue"));
    shouldBe(gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME), tex);

    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM, () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME));
    shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    // Bind backbuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [255,0,0,255], "backbuffer should be red"));
  }

  debug("");
  debug("buffer deletion");

  var buffer = gl.createBuffer();
  shouldBeNonNull(buffer);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer));
  shouldBe(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING), buffer);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(buffer));
  shouldBeFalse(gl.isBuffer(buffer));
  shouldBeNull(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer));
  shouldBeNull(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING));

  var buffer2 = gl.createBuffer();
  shouldBeNonNull(buffer2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer2));
  shouldBe(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING), buffer2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, null));
  shouldBeNull(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(buffer2));
  shouldBeFalse(gl.isBuffer(buffer2));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer2));
  shouldBeNull(gl.getParameter(wgl.WebGL.ARRAY_BUFFER_BINDING));

  var bufferElement = gl.createBuffer();
  shouldBeNonNull(bufferElement);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, bufferElement));
  shouldBe(gl.getParameter(wgl.WebGL.ELEMENT_ARRAY_BUFFER_BINDING), bufferElement);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(bufferElement));
  shouldBeFalse(gl.isBuffer(bufferElement));
  shouldBeNull(gl.getParameter(wgl.WebGL.ELEMENT_ARRAY_BUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, bufferElement));
  shouldBeNull(gl.getParameter(wgl.WebGL.ELEMENT_ARRAY_BUFFER_BINDING));

  var b = gl.createBuffer();
  shouldBeNonNull(b);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, b));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bufferData(wgl.WebGL.ARRAY_BUFFER, 1, wgl.WebGL.STATIC_DRAW));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(b));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, b));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.bufferData(wgl.WebGL.ARRAY_BUFFER, 1, wgl.WebGL.STATIC_DRAW));

  var b1 = gl.createBuffer();
  shouldBeNonNull(b1);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, b1));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.enableVertexAttribArray(1));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.vertexAttribPointer(1, 4, wgl.WebGL.FLOAT, false, 0, 0));
  var b2 = gl.createBuffer();
  shouldBeNonNull(b2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, b2));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.enableVertexAttribArray(2));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.vertexAttribPointer(2, 4, wgl.WebGL.FLOAT, false, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.enableVertexAttribArray(3));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.vertexAttribPointer(3, 4, wgl.WebGL.FLOAT, false, 0, 0));
  shouldBe(gl.getVertexAttrib(1, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING), b1);
  shouldBe(gl.getVertexAttrib(2, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING), b2);
  shouldBe(gl.getVertexAttrib(3, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING), b2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(b2));
  shouldBe(gl.getVertexAttrib(1, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING), b1);
  shouldBeNull(gl.getVertexAttrib(2, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING));
  shouldBeNull(gl.getVertexAttrib(3, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteBuffer(b1));
  shouldBeNull(gl.getVertexAttrib(1, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING));

  debug("");
  debug("framebuffer deletion");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldBe(gl.getParameter(wgl.WebGL.FRAMEBUFFER_BINDING), fbo);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteFramebuffer(fbo));
  shouldBeFalse(gl.isFramebuffer(fbo));
  shouldBeNull(gl.getParameter(wgl.WebGL.FRAMEBUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldBeNull(gl.getParameter(wgl.WebGL.FRAMEBUFFER_BINDING));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo2));
  shouldBe(gl.getParameter(wgl.WebGL.FRAMEBUFFER_BINDING), fbo2);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteFramebuffer(fbo3));
  shouldBe(gl.getParameter(wgl.WebGL.FRAMEBUFFER_BINDING), fbo2);

  fbo = gl.createFramebuffer();
  rbo = gl.createRenderbuffer();
  shouldBeNonNull(fbo);
  shouldBeNonNull(rbo);
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, rbo));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 16, 16));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, rbo));
  if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) == wgl.WebGL.FRAMEBUFFER_COMPLETE) {
    // set backbuffer to red
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(1,0,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // set framebuffer to green
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    // check framebuffer
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 16, 16, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 16, 16, 1, 1, [0,0,0,0], "outside fbo should be black"));
    // delete framebuffer. because this was the bound fbo the backbuffer should be active now
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteFramebuffer(fbo));
    // check backbuffer
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 300, 150, [255,0,0,255], "backbuffer should be red"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 300, 0, 300, 300, [0,0,0,0], "outside backbuffer should be black"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 150, 300, 300, [0,0,0,0], "outside backbuffer should be black"));
    // check drawing to backbuffer
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clearColor(0,1,0,1));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 300, 150, [0,255,0,255], "fbo should be green"));
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
    // check again because many buggy implementations will have bound to the true backbuffer on deleteFramebuffer.
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => wtu.checkCanvasRect(gl, 0, 0, 300, 150, [0,255,0,255], "fbo should be green"));
  }
}
