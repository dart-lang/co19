/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests the a few differences between WebGL and GLES2
 */
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  var gl = wtu.create3DContext();
  var program = wtu.loadStandardProgram(gl);
  gl.useProgram(program);
  var vertexObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.enableVertexAttribArray(0);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Setup should succeed");

  debug("Verify that constant color and constant alpha cannot be used together as source and destination factors in the blend function");
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.ONE_MINUS_CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFunc(wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.ONE_MINUS_CONSTANT_COLOR));

  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.CONSTANT_ALPHA, wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.CONSTANT_COLOR, wgl.WebGL.ONE, wgl.WebGL.ZERO));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.WebGL.ONE_MINUS_CONSTANT_ALPHA, wgl.WebGL.ONE_MINUS_CONSTANT_COLOR, wgl.WebGL.ONE, wgl.WebGL.ZERO));

  debug("Verify that in depthRange zNear <= zFar");
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.depthRange(20, 10));

  debug("Verify that front/back settings should be the same for stenclMask and stencilFunc");

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilMask(255));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilMaskSeparate(wgl.WebGL.FRONT, 1));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilMaskSeparate(wgl.WebGL.BACK, 1));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));

  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilFunc(wgl.WebGL.ALWAYS, 0, 255));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilFuncSeparate(wgl.WebGL.BACK, wgl.WebGL.ALWAYS, 1, 255));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilFuncSeparate(wgl.WebGL.FRONT, wgl.WebGL.ALWAYS, 1, 255));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilFuncSeparate(wgl.WebGL.BACK, wgl.WebGL.ALWAYS, 1, 1));
  shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.stencilFuncSeparate(wgl.WebGL.FRONT, wgl.WebGL.ALWAYS, 1, 1));
  shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 0));

   debug("Verify that UNPACK_COLORSPACE_CONVERSION_WEBGL is supported");
  shouldBe(gl.getParameter(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL), wgl.WebGL.BROWSER_DEFAULT_WEBGL);
  gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.WebGL.NONE);
  shouldBe(gl.getParameter(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL), wgl.WebGL.NONE);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "set/get UNPACK_COLORSPACE_CONVERSION_WEBGL should generate no error");

  debug("Verify that drawingBufferWidth and drawingBufferHeights are implemented");
  shouldBeTrue(gl.drawingBufferWidth >= 0 && gl.drawingBufferHeight >= 0);

  debug("Verify that bindAttribLocation rejects names start with webgl_ or _webgl_");
  //TODO
  //shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, gl.bindAttribLocation(program, 0, 'webgl_a'));
  //shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, gl.bindAttribLocation(program, 0, '_webgl_a'));
}
