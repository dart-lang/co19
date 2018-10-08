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
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer);
    framebuffer = gl.createFramebuffer();
    gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer);
    program = wtu.setupSimpleTextureProgram(gl);
    renderbuffer = gl.createRenderbuffer();
    gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, renderbuffer);
    shader = gl.createShader(wgl.WebGL.VERTEX_SHADER);
    texture = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);

    // Test is queries that will later be false
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.enable(wgl.WebGL.BLEND));
    shouldBeTrue(gl.isBuffer(buffer));
    shouldBeTrue(gl.isEnabled(wgl.WebGL.BLEND));
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
    shouldBe(gl.getError(), wgl.WebGL.CONTEXT_LOST_WEBGL);
    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_UNSUPPORTED);
    shouldBe(gl.getAttribLocation(program, 'u_modelViewProjMatrix'), -1);
    shouldBe(gl.getVertexAttribOffset(0, wgl.WebGL.VERTEX_ATTRIB_ARRAY_POINTER), 0);

    // Test the extension itself.
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => extension.loseContext());

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
      () => gl.activeTexture(wgl.WebGL.TEXTURE0),
      () => gl.attachShader(program, shader),
      () => gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer),
      () => gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, framebuffer),
      () => gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, renderbuffer),
      () => gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture),
      () => gl.blendColor(1.0, 1.0, 1.0, 1.0),
      () => gl.blendEquation(wgl.WebGL.FUNC_ADD),
      () => gl.blendEquationSeparate(wgl.WebGL.FUNC_ADD, wgl.WebGL.FUNC_ADD),
      () => gl.blendFunc(wgl.WebGL.ONE, wgl.WebGL.ONE),
      () => gl.blendFuncSeparate(wgl.WebGL.ONE, wgl.WebGL.ONE, wgl.WebGL.ONE, wgl.WebGL.ONE),
      () => gl.bufferData(wgl.WebGL.ARRAY_BUFFER, 0, wgl.WebGL.STATIC_DRAW),
      () => gl.bufferData(wgl.WebGL.ARRAY_BUFFER, arrayBufferView, wgl.WebGL.STATIC_DRAW),
      () => gl.bufferData(wgl.WebGL.ARRAY_BUFFER, arrayBuffer, wgl.WebGL.STATIC_DRAW),
      () => gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, arrayBufferView),
      () => gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 0, arrayBuffer),
      () => gl.clear(wgl.WebGL.COLOR_BUFFER_BIT),
      () => gl.clearColor(1, 1, 1, 1),
      () => gl.clearDepth(1),
      () => gl.clearStencil(0),
      () => gl.colorMask(true, true, true, true),
      () => gl.compileShader(shader),
      () => gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, 0, 0, 0),
      () => gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, 0, 0),
      () => gl.cullFace(wgl.WebGL.FRONT),
      () => gl.deleteBuffer(buffer),
      () => gl.deleteFramebuffer(framebuffer),
      () => gl.deleteProgram(program),
      () => gl.deleteRenderbuffer(renderbuffer),
      () => gl.deleteShader(shader),
      () => gl.deleteTexture(texture),
      () => gl.depthFunc(wgl.WebGL.NEVER),
      () => gl.depthMask(false),
      () => gl.depthRange(0, 1),
      () => gl.detachShader(program, shader),
      () => gl.disable(wgl.WebGL.BLEND),
      () => gl.disableVertexAttribArray(0),
      () => gl.drawArrays(wgl.WebGL.POINTS, 0, 0),
      () => gl.drawElements(wgl.WebGL.POINTS, 0, wgl.WebGL.UNSIGNED_SHORT, 0),
      () => gl.enable(wgl.WebGL.BLEND),
      () => gl.enableVertexAttribArray(0),
      () => gl.finish(),
      () => gl.flush(),
      () => gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, renderbuffer),
      () => gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, texture, 0),
      () => gl.frontFace(wgl.WebGL.CW),
      () => gl.generateMipmap(wgl.WebGL.TEXTURE_2D),
      () => gl.hint(wgl.WebGL.GENERATE_MIPMAP_HINT, wgl.WebGL.FASTEST),
      () => gl.lineWidth(0),
      () => gl.linkProgram(program),
      () => gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 0),
      () => gl.polygonOffset(0, 0),
      () => gl.readPixels(0, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, arrayBufferView),
      () => gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RGBA4, 0, 0),
      () => gl.sampleCoverage(0, false),
      () => gl.scissor(0, 0, 0, 0),
      () => gl.shaderSource(shader, ''),
      () => gl.stencilFunc(wgl.WebGL.NEVER, 0, 0),
      () => gl.stencilFuncSeparate(wgl.WebGL.FRONT, wgl.WebGL.NEVER, 0, 0),
      () => gl.stencilMask(0),
      () => gl.stencilMaskSeparate(wgl.WebGL.FRONT, 0),
      () => gl.stencilOp(wgl.WebGL.KEEP, wgl.WebGL.KEEP, wgl.WebGL.KEEP),
      () => gl.stencilOpSeparate(wgl.WebGL.FRONT, wgl.WebGL.KEEP, wgl.WebGL.KEEP, wgl.WebGL.KEEP),
      () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, arrayBufferView),
      () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, imageData),
      () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, image),
      () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas),
      () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, video),
      () => gl.texParameterf(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST),
      () => gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST),
      () => gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, arrayBufferView),
      () => gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, imageData),
      () => gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, image),
      () => gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, canvas),
      () => gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, video),
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
      () => gl.vertexAttribPointer(0, 0, wgl.WebGL.FLOAT, false, 0, 0),
      () => gl.viewport(0, 0, 0, 0),
    ];
    for (var i = 0; i < voidTests.length; ++i) {
      shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, voidTests[i]);
    }

    debug('should be nulls:');
    // Functions return nullable values should all return null.
    var nullTests = [
      () => gl.createBuffer(),
      () => gl.createFramebuffer(),
      () => gl.createProgram(),
      () => gl.createRenderbuffer(),
      () => gl.createShader(wgl.WebGL.VERTEX_SHADER),
      () => gl.createTexture(),
      () => gl.getActiveAttrib(program, 0),
      () => gl.getActiveUniform(program, 0),
      () => gl.getAttachedShaders(program),
      () => gl.getBufferParameter(wgl.WebGL.ARRAY_BUFFER, wgl.WebGL.BUFFER_SIZE),
      () => gl.getContextAttributes(),
      () => gl.getFramebufferAttachmentParameter(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME),
      () => gl.getParameter(wgl.WebGL.CURRENT_PROGRAM),
      () => gl.getProgramInfoLog(program),
      () => gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS),
      () => gl.getRenderbufferParameter(wgl.WebGL.RENDERBUFFER, wgl.WebGL.RENDERBUFFER_WIDTH),
      () => gl.getShaderInfoLog(shader),
      () => gl.getShaderParameter(shader, wgl.WebGL.SHADER_TYPE),
      () => gl.getShaderSource(shader),
      () => gl.getTexParameter(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S),
      () => gl.getUniform(program, uniformLocation),
      () => gl.getUniformLocation(program, 'vPosition'),
      () => gl.getVertexAttrib(0, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING),
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
    shouldBeFalse(gl.isEnabled(wgl.WebGL.BLEND));
    shouldBeFalse(gl.isFramebuffer(framebuffer));
    shouldBeFalse(gl.isProgram(program));
    shouldBeFalse(gl.isRenderbuffer(renderbuffer));
    shouldBeFalse(gl.isShader(shader));
    shouldBeFalse(gl.isTexture(texture));

    shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);

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
