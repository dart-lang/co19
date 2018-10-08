/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests calling WebGL APIs with objects from other contexts
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var contextA = create3DContext();
  var contextB = create3DContext();
  var programA = loadStandardProgram(contextA);
  var programB = loadStandardProgram(contextB);
  var shaderA = loadStandardVertexShader(contextA);
  var shaderB = loadStandardVertexShader(contextB);
  var textureB = contextB.createTexture();
  var frameBufferB = contextB.createFramebuffer();
  var renderBufferB = contextB.createRenderbuffer();
  var locationA = contextA.getUniformLocation(programA, 'u_modelViewProjMatrix');

  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.compileShader(shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.linkProgram(programB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.attachShader(programA, shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.attachShader(programB, shaderA));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.attachShader(programB, shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.detachShader(programA, shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.detachShader(programB, shaderA));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.detachShader(programB, shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.shaderSource(shaderB, 'foo'));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.bindAttribLocation(programB, 0, 'foo'));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, frameBufferB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, renderBufferB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.bindTexture(wgl.WebGL.TEXTURE_2D, textureB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.DEPTH_ATTACHMENT, wgl.WebGL.RENDERBUFFER, renderBufferB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, textureB, 0));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getProgramParameter(programB, 0));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getProgramInfoLog(programB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getShaderParameter(shaderB, 0));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getShaderInfoLog(shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getShaderSource(shaderB));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getUniform(programB, locationA));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getUniformLocation(programB, 'u_modelViewProjMatrix'));
}
