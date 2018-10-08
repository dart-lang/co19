/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests calling WebGL APIs without providing the necessary
 * objects
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = wtu.create3DContext();
  var program = wtu.loadStandardProgram(context);
  var shader = wtu.loadStandardVertexShader(context);
  var shouldGenerateGLError = wtu.shouldGenerateGLError;

  assertMsg(program != null, "Program Compiled");
  assertMsg(shader != null, "Shader Compiled");
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.compileShader(null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.linkProgram(null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.attachShader(null, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.attachShader(program, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.attachShader(null, shader));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.detachShader(program, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.detachShader(null, shader));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.shaderSource(null, ''));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.shaderSource(null, 'foo'));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.bindAttribLocation(null, 0, 'foo'));
  shouldThrow(() => context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, 0));
  shouldThrow(() => context.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, 0));
  shouldThrow(() => context.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, 0));
  shouldThrow(() => context.bindTexture(wgl.WebGL.TEXTURE_2D, 0));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindTexture(wgl.WebGL.TEXTURE_2D, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bindTexture(wgl.WebGL.TEXTURE_2D, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, null, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getProgramParameter(null, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getProgramInfoLog(null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getShaderParameter(null, 0));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getShaderInfoLog(null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getShaderSource(null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getUniform(null, null));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_VALUE, () => context.getUniformLocation(null, 'foo'));

  debug("");
  debug("check with bindings");
  context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, context.createBuffer());
  context.bindTexture(wgl.WebGL.TEXTURE_2D, context.createTexture());
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.bufferData(wgl.WebGL.ARRAY_BUFFER, 1, wgl.WebGL.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.getBufferParameter(wgl.WebGL.ARRAY_BUFFER, wgl.WebGL.BUFFER_SIZE));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, new Uint8List.fromList([0,0,0,0])));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST));
  shouldGenerateGLError(context, wgl.WebGL.NO_ERROR, () => context.getTexParameter(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER));

  debug("");
  debug("check without bindings");
  context.bindBuffer(wgl.WebGL.ARRAY_BUFFER, null);
  context.bindTexture(wgl.WebGL.TEXTURE_2D, null);
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.bufferData(wgl.WebGL.ARRAY_BUFFER, 1, wgl.WebGL.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.getBufferParameter(wgl.WebGL.ARRAY_BUFFER, wgl.WebGL.BUFFER_SIZE));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 1, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, new Uint8List.fromList([0,0,0,0])));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST));
  shouldGenerateGLError(context, wgl.WebGL.INVALID_OPERATION, () => context.getTexParameter(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER));
}
