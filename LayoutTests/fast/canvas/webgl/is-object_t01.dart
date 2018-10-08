/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 *@description Tests 'is' calls against non-bound and deleted objects
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas">
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas;
  var gl;
  var shouldGenerateGLError;

  var buffer;
  var framebuffer;
  var program;
  var renderbuffer;
  var shader;
  var texture;

  canvas = document.getElementById("canvas");
  gl = wtu.create3DContext(canvas);
  shouldGenerateGLError = wtu.shouldGenerateGLError;

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => buffer = gl.createBuffer());
  shouldBeFalse(gl.isBuffer(buffer));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer));
  shouldBeTrue(gl.isBuffer(buffer));
  debug("");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => framebuffer = gl.createFramebuffer());
  shouldBeFalse(gl.isFramebuffer(framebuffer));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer));
  shouldBeTrue(gl.isFramebuffer(framebuffer));
  debug("");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => renderbuffer = gl.createRenderbuffer());
  shouldBeFalse(gl.isRenderbuffer(renderbuffer));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, renderbuffer));
  shouldBeTrue(gl.isRenderbuffer(renderbuffer));
  debug("");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => texture = gl.createTexture());
  shouldBeFalse(gl.isTexture(texture));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture));
  shouldBeTrue(gl.isTexture(texture));
  debug("");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => program = gl.createProgram());
  shouldBeTrue(gl.isProgram(program));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteProgram(program));
  shouldBeFalse(gl.isProgram(program));
  debug("");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => shader = gl.createShader(wgl.WebGL.VERTEX_SHADER));
  shouldBeTrue(gl.isShader(shader));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.deleteShader(shader));
  shouldBeFalse(gl.isShader(shader));
}
