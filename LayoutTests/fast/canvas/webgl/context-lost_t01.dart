/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests behavior under a lost context
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";

main() {
  dynamic canvas;
  var gl;
  var shouldGenerateGLError;
  var extension;

  var buffer;
  var framebuffer;
  var program;
  var renderbuffer;
  var shader;
  var texture;
  var uniformLocation;
  var arrayBuffer;
  var arrayBufferView;
  var image;
  var video;
  dynamic canvas2d;
  var ctx2d;
  var imageData;
  var float32array;
  var int32array;

  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas">
      ''', treeSanitizer: new NullTreeSanitizer());


  loseContext()
  {
    debug("");
    debug("Lose context");

    // Note: this will cause the context to be lost, but the
    // webglcontextlost event listener to be queued.
    extension.loseContext();
    debug("");
  }

  testValidContext()
  {
    debug("Test valid context");

    shouldBeFalse(gl.isContextLost());

    arrayBufferView = new Int8List(4);
    arrayBuffer = arrayBufferView.buffer;

    // Generate resources for testing.
    buffer = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, buffer);
    framebuffer = gl.createFramebuffer();
    gl.bindFramebuffer(wgl.FRAMEBUFFER, framebuffer);
    program = wtu.setupSimpleTextureProgram(gl);
    renderbuffer = gl.createRenderbuffer();
    gl.bindRenderbuffer(wgl.RENDERBUFFER, renderbuffer);
    shader = gl.createShader(wgl.VERTEX_SHADER);
    texture = gl.createTexture();
    gl.bindTexture(wgl.TEXTURE_2D, texture);
    shouldBe(gl.getError(), wgl.NO_ERROR);

    // Test is queries that will later be false
    shouldGenerateGLError(gl, wgl.NO_ERROR, () => gl.enable(wgl.BLEND));
    shouldBeTrue(gl.isBuffer(buffer));
    shouldBeTrue(gl.isEnabled(wgl.BLEND));
    shouldBeTrue(gl.isFramebuffer(framebuffer));
    shouldBeTrue(gl.isProgram(program));
    shouldBeTrue(gl.isRenderbuffer(renderbuffer));
    shouldBeTrue(gl.isShader(shader));
    shouldBeTrue(gl.isTexture(texture));
  }

  testLostContext(_)
  {
    debug("Test lost context");

    // Functions with special return values.
    shouldBeTrue(gl.isContextLost());
    shouldBe(gl.getError(), wgl.CONTEXT_LOST_WEBGL);
    shouldBe(gl.getError(), wgl.NO_ERROR);
    shouldBe(gl.checkFramebufferStatus(wgl.FRAMEBUFFER), wgl.FRAMEBUFFER_UNSUPPORTED);
    shouldBe(gl.getAttribLocation(program, 'u_modelViewProjMatrix'), -1);
    shouldBe(gl.getVertexAttribOffset(0, wgl.VERTEX_ATTRIB_ARRAY_POINTER), 0);

    // Test the extension itself.
    shouldGenerateGLError(gl, wgl.INVALID_OPERATION, () => extension.loseContext());

    image = document.createElement("img");
    video = document.createElement("video");
    canvas2d = document.createElement("canvas");
    ctx2d = canvas2d.getContext("2d");
    imageData = ctx2d.createImageData(1, 1);
    float32array = new Float32List(1);
    int32array = new Int32List(1);

    // Functions returning void should return immediately.
    // This is untestable, but we can at least be sure they cause no errors
    // and the codepaths are exercised.
    var voidTests = [
      () => gl.activeTexture(wgl.TEXTURE0),
      () => gl.attachShader(program, shader),
      () => gl.bindBuffer(wgl.ARRAY_BUFFER, buffer),
      () => gl.bindFramebuffer(wgl.FRAMEBUFFER, framebuffer),
      () => gl.bindRenderbuffer(wgl.RENDERBUFFER, renderbuffer),
      () => gl.bindTexture(wgl.TEXTURE_2D, texture),
      () => gl.blendColor(1.0, 1.0, 1.0, 1.0),
      () => gl.blendEquation(wgl.FUNC_ADD),
      () => gl.blendEquationSeparate(wgl.FUNC_ADD, wgl.FUNC_ADD),
      () => gl.blendFunc(wgl.ONE, wgl.ONE),
      () => gl.blendFuncSeparate(wgl.ONE, wgl.ONE, wgl.ONE, wgl.ONE),
      () => gl.bufferData(wgl.ARRAY_BUFFER, 0, wgl.STATIC_DRAW),
      () => gl.bufferData(wgl.ARRAY_BUFFER, arrayBufferView, wgl.STATIC_DRAW),
      () => gl.bufferData(wgl.ARRAY_BUFFER, arrayBuffer, wgl.STATIC_DRAW),
      () => gl.bufferSubData(wgl.ARRAY_BUFFER, 0, arrayBufferView),
      () => gl.bufferSubData(wgl.ARRAY_BUFFER, 0, arrayBuffer),
      () => gl.clear(wgl.COLOR_BUFFER_BIT),
      () => gl.clearColor(1, 1, 1, 1),
      () => gl.clearDepth(1),
      () => gl.clearStencil(0),
      () => gl.colorMask(true, true, true, true),
      () => gl.compileShader(shader),
      () => gl.copyTexImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 0, 0, 0, 0, 0),
      () => gl.copyTexSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 0, 0, 0, 0),
      () => gl.cullFace(wgl.FRONT),
      () => gl.deleteBuffer(buffer),
      () => gl.deleteFramebuffer(framebuffer),
      () => gl.deleteProgram(program),
      () => gl.deleteRenderbuffer(renderbuffer),
      () => gl.deleteShader(shader),
      () => gl.deleteTexture(texture),
      () => gl.depthFunc(wgl.NEVER),
      () => gl.depthMask(false),
      () => gl.depthRange(0, 1),
      () => gl.detachShader(program, shader),
      () => gl.disable(wgl.BLEND),
      () => gl.disableVertexAttribArray(0),
      () => gl.drawArrays(wgl.POINTS, 0, 0),
      () => gl.drawElements(wgl.POINTS, 0, wgl.UNSIGNED_SHORT, 0),
      () => gl.enable(wgl.BLEND),
      () => gl.enableVertexAttribArray(0),
      () => gl.finish(),
      () => gl.flush(),
      () => gl.framebufferRenderbuffer(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.RENDERBUFFER, renderbuffer),
      () => gl.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, texture, 0),
      () => gl.frontFace(wgl.CW),
      () => gl.generateMipmap(wgl.TEXTURE_2D),
      () => gl.hint(wgl.GENERATE_MIPMAP_HINT, wgl.FASTEST),
      () => gl.lineWidth(0),
      () => gl.linkProgram(program),
      () => gl.pixelStorei(wgl.UNPACK_FLIP_Y_WEBGL, 0),
      () => gl.polygonOffset(0, 0),
      () => gl.readPixels(0, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, arrayBufferView),
      () => gl.renderbufferStorage(wgl.RENDERBUFFER, wgl.RGBA4, 0, 0),
      () => gl.sampleCoverage(0, false),
      () => gl.scissor(0, 0, 0, 0),
      () => gl.shaderSource(shader, ''),
      () => gl.stencilFunc(wgl.NEVER, 0, 0),
      () => gl.stencilFuncSeparate(wgl.FRONT, wgl.NEVER, 0, 0),
      () => gl.stencilMask(0),
      () => gl.stencilMaskSeparate(wgl.FRONT, 0),
      () => gl.stencilOp(wgl.KEEP, wgl.KEEP, wgl.KEEP),
      () => gl.stencilOpSeparate(wgl.FRONT, wgl.KEEP, wgl.KEEP, wgl.KEEP),
      () => gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, arrayBufferView),
      () => gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, imageData),
      () => gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, image),
      () => gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, canvas),
      () => gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, video),
      () => gl.texParameterf(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST),
      () => gl.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST),
      () => gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, arrayBufferView),
      () => gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, imageData),
      () => gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, image),
      () => gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, canvas),
      () => gl.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, video),
      () => gl.uniform1f(uniformLocation, 0),
      () => gl.uniform1fv(uniformLocation, float32array),
      //() => gl.uniform1fv(uniformLocation, [0]),
      () => gl.uniform1i(uniformLocation, 0),
      () => gl.uniform1iv(uniformLocation, int32array),
      //() => gl.uniform1iv(uniformLocation, [0]),
      () => gl.uniform2f(uniformLocation, 0, 0),
      () => gl.uniform2fv(uniformLocation, float32array),
      //() => gl.uniform2fv(uniformLocation, [0, 0]),
      () => gl.uniform2i(uniformLocation, 0, 0),
      () => gl.uniform2iv(uniformLocation, int32array),
      //() => gl.uniform2iv(uniformLocation, [0, 0]),
      () => gl.uniform3f(uniformLocation, 0, 0, 0),
      () => gl.uniform3fv(uniformLocation, float32array),
      //() => gl.uniform3fv(uniformLocation, [0, 0, 0]),
      () => gl.uniform3i(uniformLocation, 0, 0, 0),
      () => gl.uniform3iv(uniformLocation, int32array),
      //() => gl.uniform3iv(uniformLocation, [0, 0, 0]),
      () => gl.uniform4f(uniformLocation, 0, 0, 0, 0),
      () => gl.uniform4fv(uniformLocation, float32array),
      //() => gl.uniform4fv(uniformLocation, [0, 0, 0, 0]),
      () => gl.uniform4i(uniformLocation, 0, 0, 0, 0),
      () => gl.uniform4iv(uniformLocation, int32array),
      //() => gl.uniform4iv(uniformLocation, [0, 0, 0, 0]),
      () => gl.uniformMatrix2fv(uniformLocation, false, float32array),
      //() => gl.uniformMatrix2fv(uniformLocation, false, [0, 0, 0, 0]),
      () => gl.uniformMatrix3fv(uniformLocation, false, float32array),
      //() => gl.uniformMatrix3fv(uniformLocation, false, [0, 0, 0, 0, 0, 0, 0, 0, 0]),
      () => gl.uniformMatrix4fv(uniformLocation, false, float32array),
      //() => gl.uniformMatrix4fv(uniformLocation, false, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
      () => gl.useProgram(program),
      () => gl.validateProgram(program),
      () => gl.vertexAttrib1f(0, 0),
      () => gl.vertexAttrib1fv(0, float32array),
      //() => gl.vertexAttrib1fv(0, [0]),
      () => gl.vertexAttrib2f(0, 0, 0),
      () => gl.vertexAttrib2fv(0, float32array),
      //() => gl.vertexAttrib2fv(0, [0, 0]),
      () => gl.vertexAttrib3f(0, 0, 0, 0),
      () => gl.vertexAttrib3fv(0, float32array),
      //() => gl.vertexAttrib3fv(0, [0, 0, 0]),
      () => gl.vertexAttrib4f(0, 0, 0, 0, 0),
      () => gl.vertexAttrib4fv(0, float32array),
      //() => gl.vertexAttrib4fv(0, [0, 0, 0, 0]),
      () => gl.vertexAttribPointer(0, 0, wgl.FLOAT, false, 0, 0),
      () => gl.viewport(0, 0, 0, 0),
    ];
    for (var i = 0; i < voidTests.length; ++i) {
      shouldGenerateGLError(gl, wgl.NO_ERROR, voidTests[i]);
    }

    debug('should be nulls:');
    // Functions return nullable values should all return null.
    var nullTests = [
      () => gl.createBuffer(),
      () => gl.createFramebuffer(),
      () => gl.createProgram(),
      () => gl.createRenderbuffer(),
      () => gl.createShader(wgl.VERTEX_SHADER),
      () => gl.createTexture(),
      () => gl.getActiveAttrib(program, 0),
      () => gl.getActiveUniform(program, 0),
      () => gl.getAttachedShaders(program),
      () => gl.getBufferParameter(wgl.ARRAY_BUFFER, wgl.BUFFER_SIZE),
      () => gl.getContextAttributes(),
      () => gl.getFramebufferAttachmentParameter(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME),
      () => gl.getParameter(wgl.CURRENT_PROGRAM),
      () => gl.getProgramInfoLog(program),
      () => gl.getProgramParameter(program, wgl.LINK_STATUS),
      () => gl.getRenderbufferParameter(wgl.RENDERBUFFER, wgl.RENDERBUFFER_WIDTH),
      () => gl.getShaderInfoLog(shader),
      () => gl.getShaderParameter(shader, wgl.SHADER_TYPE),
      () => gl.getShaderSource(shader),
      () => gl.getTexParameter(wgl.TEXTURE_2D, wgl.TEXTURE_WRAP_S),
      () => gl.getUniform(program, uniformLocation),
      () => gl.getUniformLocation(program, 'vPosition'),
      () => gl.getVertexAttrib(0, wgl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING),
      //() => gl.getSupportedExtensions(),
      () => gl.getExtension('WEBGL_lose_context'),
      ];
    for (var i = 0; i < nullTests.length; ++i) {
      debug('case $i');
      shouldBeNull(nullTests[i]());
    }

    debug('should be false:');
    // "Is" queries should all return false.
    shouldBeFalse(gl.isBuffer(buffer));
    shouldBeFalse(gl.isEnabled(wgl.BLEND));
    shouldBeFalse(gl.isFramebuffer(framebuffer));
    shouldBeFalse(gl.isProgram(program));
    shouldBeFalse(gl.isRenderbuffer(renderbuffer));
    shouldBeFalse(gl.isShader(shader));
    shouldBeFalse(gl.isTexture(texture));

    shouldBe(gl.getError(), wgl.NO_ERROR);

    asyncEnd();
  }

  init()
  {
    canvas = document.getElementById("canvas");
    gl = wtu.create3DContext(canvas);
    shouldGenerateGLError = wtu.shouldGenerateGLError;

    // call testValidContext() before checking for the extension, because this is where we check
    // for the isContextLost() method, which we want to do regardless of the extension's presence.
    testValidContext();

    extension = gl.getExtension("WEBGL_lose_context");
    if (extension == null) {
      debug("Could not find lose_context extension under the following names: WEBGL_lose_context");
      asyncEnd();
      return false;
    }

    canvas.addEventListener("webglcontextlost", testLostContext, false);

    loseContext();
  }

  asyncStart();
  init();
}
