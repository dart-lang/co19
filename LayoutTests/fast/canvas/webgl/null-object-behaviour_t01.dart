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
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.compileShader(null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.linkProgram(null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.attachShader(null, null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.attachShader(program, null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.attachShader(null, shader));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.detachShader(program, null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.detachShader(null, shader));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.shaderSource(null, ''));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.shaderSource(null, 'foo'));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.bindAttribLocation(null, 0, 'foo'));
  shouldThrow(() => context.bindBuffer(wgl.ARRAY_BUFFER, 0));
  shouldThrow(() => context.bindFramebuffer(wgl.FRAMEBUFFER, 0));
  shouldThrow(() => context.bindRenderbuffer(wgl.RENDERBUFFER, 0));
  shouldThrow(() => context.bindTexture(wgl.TEXTURE_2D, 0));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindBuffer(wgl.ARRAY_BUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindFramebuffer(wgl.FRAMEBUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindRenderbuffer(wgl.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindTexture(wgl.TEXTURE_2D, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindBuffer(wgl.ARRAY_BUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindFramebuffer(wgl.FRAMEBUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindRenderbuffer(wgl.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindTexture(wgl.TEXTURE_2D, null));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.framebufferRenderbuffer(wgl.FRAMEBUFFER, wgl.DEPTH_ATTACHMENT, wgl.RENDERBUFFER, null));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.framebufferTexture2D(wgl.FRAMEBUFFER, wgl.COLOR_ATTACHMENT0, wgl.TEXTURE_2D, null, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getProgramParameter(null, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getProgramInfoLog(null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getShaderParameter(null, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getShaderInfoLog(null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getShaderSource(null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getUniform(null, null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.getUniformLocation(null, 'foo'));

  debug("");
  debug("check with bindings");
  context.bindBuffer(wgl.ARRAY_BUFFER, context.createBuffer());
  context.bindTexture(wgl.TEXTURE_2D, context.createTexture());
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferData(wgl.ARRAY_BUFFER, 1, wgl.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.getBufferParameter(wgl.ARRAY_BUFFER, wgl.BUFFER_SIZE));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 1, 1, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, new Uint8List.fromList([0,0,0,0])));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.getTexParameter(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER));

  debug("");
  debug("check without bindings");
  context.bindBuffer(wgl.ARRAY_BUFFER, null);
  context.bindTexture(wgl.TEXTURE_2D, null);
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.bufferData(wgl.ARRAY_BUFFER, 1, wgl.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.getBufferParameter(wgl.ARRAY_BUFFER, wgl.BUFFER_SIZE));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 1, 1, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, new Uint8List.fromList([0,0,0,0])));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.texParameteri(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER, wgl.NEAREST));
  shouldGenerateGLError(context, wgl.INVALID_OPERATION, () => context.getTexParameter(wgl.TEXTURE_2D, wgl.TEXTURE_MIN_FILTER));
}
