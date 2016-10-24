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
  gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
  gl.enableVertexAttribArray(0);
  glErrorShouldBe(gl, wgl.NO_ERROR, "Setup should succeed");

  debug("Verify that constant color and constant alpha cannot be used together as source and destination factors in the blend function");
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.CONSTANT_COLOR, wgl.CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.ONE_MINUS_CONSTANT_COLOR, wgl.CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.CONSTANT_COLOR, wgl.ONE_MINUS_CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.ONE_MINUS_CONSTANT_COLOR, wgl.ONE_MINUS_CONSTANT_ALPHA));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.CONSTANT_ALPHA, wgl.CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.CONSTANT_ALPHA, wgl.ONE_MINUS_CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.CONSTANT_COLOR));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFunc(wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.ONE_MINUS_CONSTANT_COLOR));

  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.CONSTANT_COLOR, wgl.CONSTANT_ALPHA, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.ONE_MINUS_CONSTANT_COLOR, wgl.CONSTANT_ALPHA, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.CONSTANT_COLOR, wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.ONE_MINUS_CONSTANT_COLOR, wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.CONSTANT_ALPHA, wgl.CONSTANT_COLOR, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.CONSTANT_ALPHA, wgl.ONE_MINUS_CONSTANT_COLOR, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.CONSTANT_COLOR, wgl.ONE, wgl.ZERO));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.blendFuncSeparate(wgl.ONE_MINUS_CONSTANT_ALPHA, wgl.ONE_MINUS_CONSTANT_COLOR, wgl.ONE, wgl.ZERO));

  debug("Verify that in depthRange zNear <= zFar");
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.depthRange(20, 10));

  debug("Verify that front/back settings should be the same for stenclMask and stencilFunc");

  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilMask(255));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilMaskSeparate(wgl.FRONT, 1));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilMaskSeparate(wgl.BACK, 1));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));

  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilFunc(wgl.ALWAYS, 0, 255));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilFuncSeparate(wgl.BACK, wgl.ALWAYS, 1, 255));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilFuncSeparate(wgl.FRONT, wgl.ALWAYS, 1, 255));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilFuncSeparate(wgl.BACK, wgl.ALWAYS, 1, 1));
  shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.stencilFuncSeparate(wgl.FRONT, wgl.ALWAYS, 1, 1));
  shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.drawArrays(wgl.TRIANGLES, 0, 0));

   debug("Verify that UNPACK_COLORSPACE_CONVERSION_WEBGL is supported");
  shouldBe(gl.getParameter(wgl.UNPACK_COLORSPACE_CONVERSION_WEBGL), wgl.BROWSER_DEFAULT_WEBGL);
  gl.pixelStorei(wgl.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.NONE);
  shouldBe(gl.getParameter(wgl.UNPACK_COLORSPACE_CONVERSION_WEBGL), wgl.NONE);
  glErrorShouldBe(gl, wgl.NO_ERROR, "set/get UNPACK_COLORSPACE_CONVERSION_WEBGL should generate no error");

  debug("Verify that drawingBufferWidth and drawingBufferHeights are implemented");
  shouldBeTrue(gl.drawingBufferWidth >= 0 && gl.drawingBufferHeight >= 0);

  debug("Verify that bindAttribLocation rejects names start with webgl_ or _webgl_");
  //TODO
  //shouldGenerateGLError(gl, wgl.INVALID_OPERATION, gl.bindAttribLocation(program, 0, 'webgl_a'));
  //shouldGenerateGLError(gl, wgl.INVALID_OPERATION, gl.bindAttribLocation(program, 0, '_webgl_a'));
}
