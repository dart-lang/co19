/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Validate tex functions input parameters
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

  var gl = null;
  var tex = null;
  var error = 0;

  enumToString(value) {
    return wtu.glEnumToString(gl, value);
  }

  testTexImage2D(testCase)
  {
    var level = 0;
    var width = 16;
    var height = 16;
    var msg = "" +
      " internalFormat: " + enumToString(testCase['internalFormat']) +
      " target: " + enumToString(testCase['target']) +
      " format: " + enumToString(testCase['format']) +
      " type: " + enumToString(testCase['type']) +
      " border: ${testCase['border']}";

    gl.texImage2D(testCase['target'], level, testCase['internalFormat'], width, height, testCase['border'], testCase['format'], testCase['type'], null);
    error = testCase['expectedError'];
    glErrorShouldBe(gl, error, msg);
  }

  testTexSubImage2D(testCase)
  {
    var level = 0;
    var xoffset = 0;
    var yoffset = 0;
    var width = 16;
    var height = 16;
    var msg = ""+
      " format: " + enumToString(testCase['format']) +
      " type: " + enumToString(testCase['type']);
    var array = new Uint8List(width * height * 4);
    gl.texSubImage2D(testCase['target'], level, xoffset, yoffset, width, height, testCase['format'], testCase['type'], array);
    error = testCase['expectedError'];
    glErrorShouldBe(gl, error, msg);
  }

  testTexParameter(testCase)
  {
    var msg = "paramName: " + enumToString(testCase['pname']);
    error = testCase['expectedError'];
    gl.texParameteri(testCase['target'], testCase['pname'], testCase['param']);
    glErrorShouldBe(gl, error, msg);
    gl.texParameterf(testCase['target'], testCase['pname'], testCase['param']);
    glErrorShouldBe(gl, error, msg);
  }

  testGetTexParameter(testCase)
  {
    var msg = "paramName: " + enumToString(testCase['pname']);
    error = testCase['expectedError'];
    gl.getTexParameter(testCase['target'], testCase['pname']);
    glErrorShouldBe(gl, error, msg);
  }

  testCopyTexImage2D(testCase)
  {
    var level = 0;
    var x = 0;
    var y = 0;
    var width = 16;
    var height = 16;

    var msg = "" +
      " colorBufferFormat: " + enumToString(testCase['colorBufferFormat']) +
      " internalFormat: " + enumToString(testCase['internalFormat']) +
      " target: " + enumToString(testCase['target']) +
      " border: ${testCase['border']}";

    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, testCase['colorBufferFormat'], width, height);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);

    gl.copyTexImage2D(testCase['target'], level, testCase['internalFormat'], x, y, width, height, testCase['border']);
    error = testCase['expectedError'];
    glErrorShouldBe(gl, error, msg);
  }

  testCopyTexSubImage2D(testCase)
  {
    var level = 0;
    var x = 0;
    var y = 0;
    var width = 16;
    var height = 16;
    var xoffset = 0;
    var yoffset = 0;
    var border = 0;
    var type = wgl.WebGL.UNSIGNED_BYTE;
    var msg = "" +
      " colorBufferFormat: " + enumToString(testCase['colorBufferFormat']) +
      " internalFormat: " + enumToString(testCase['internalFormat']) +
      " target: " + enumToString(testCase['target']);

    gl.renderbufferStorage(wgl.WebGL.RENDERBUFFER, testCase['colorBufferFormat'], width, height);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);

    gl.texImage2D(testCase['target'], level, testCase['internalFormat'], xoffset + width, yoffset + height, border, testCase['internalFormat'], type, null);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    gl.copyTexSubImage2D(testCase['target'], level, xoffset, yoffset, x, y, width, height);
    error = testCase['expectedError'];
    glErrorShouldBe(gl, error, msg);
  }

  testCopyFromInternalFBO(testCase)
  {
    var target = wgl.WebGL.TEXTURE_2D;
    var level = 0;
    var x = 0;
    var y = 0;
    var width = 16;
    var height = 16;
    var xoffset = 0;
    var yoffset = 0;
    var border = 0;
    var type = wgl.WebGL.UNSIGNED_BYTE;
    var msg = "" +
      " colorBufferFormat: " + enumToString(testCase['contextAlpha'] ? wgl.WebGL.RGBA : wgl.WebGL.RGB) +
      " internalFormat: " + enumToString(testCase['internalFormat']);

    if (testCase['contextAlpha'])
      gl = create3DContext(null, { 'alpha': true });
    else
      gl = create3DContext(null, { 'alpha': false });
    shouldBeNonNull(gl);
    shouldBeNonNull(tex = gl.createTexture());
    gl.bindTexture(target, tex);
    if (testCase['subImage']) {
      gl.texImage2D(target, level, testCase['internalFormat'], xoffset + width, yoffset + height, border, testCase['internalFormat'], type, null);
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      gl.copyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);
    } else {
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      gl.copyTexImage2D(target, level, testCase['internalFormat'], x, y, width, height, border);
    }
    error = testCase['expectedError'];
    glErrorShouldBe(gl, error, msg);
  }

  shouldBeNonNull(gl = create3DContext());
  shouldBeNonNull(tex = gl.createTexture());
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  debug("");
  debug("Checking TexImage2D: a set of inputs that are valid in GL but invalid in GLES2");

  var testCases =
    [ {'target': 0x8064, // GL_PROXY_TEXTURE_2D
      'internalFormat': wgl.WebGL.RGBA,
      'border': 0,
      'format': wgl.WebGL.RGBA,
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'internalFormat': 0x1903, // GL_RED
    'border': 0,
    'format': 0x1903, // GL_RED
    'type': wgl.WebGL.UNSIGNED_BYTE,
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 1,
    'format': wgl.WebGL.RGBA,
    'type': wgl.WebGL.UNSIGNED_BYTE,
    'expectedError': wgl.WebGL.INVALID_VALUE},
  {'target': wgl.WebGL.TEXTURE_2D,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 0,
    'format': wgl.WebGL.RGB,
    'type': wgl.WebGL.UNSIGNED_BYTE,
    'expectedError': wgl.WebGL.INVALID_OPERATION},
  {'target': wgl.WebGL.TEXTURE_2D,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 0,
    'format': wgl.WebGL.RGBA,
    'type': wgl.WebGL.BYTE,
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 0,
    'format': wgl.WebGL.RGBA,
    'type': wgl.WebGL.UNSIGNED_BYTE,
    'expectedError': wgl.WebGL.NO_ERROR} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testTexImage2D(testCases[ii]);

  debug("");
  debug("Checking TexSubImage2D: a set of inputs that are valid in GL but invalid in GLES2");

  testCases =
    [ {'target': wgl.WebGL.TEXTURE_2D,
      'format': 0x1903, // GL_RED
      'type': wgl.WebGL.UNSIGNED_BYTE,
      'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'format': wgl.WebGL.RGBA,
    'type': wgl.WebGL.BYTE,
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'format': wgl.WebGL.RGBA,
    'type': wgl.WebGL.UNSIGNED_BYTE,
    'expectedError': wgl.WebGL.NO_ERROR} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testTexSubImage2D(testCases[ii]);

  debug("");
  debug("Checking TexParameter: a set of inputs that are valid in GL but invalid in GLES2");

  testCases =
    [ {'target': 0x0DE0, // GL_TEXTURE_1D
      'pname': wgl.WebGL.TEXTURE_WRAP_T,
      'param': wgl.WebGL.REPEAT,
      'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'pname': 0x813A, // GL_TEXTURE_MIN_LOD
    'param': 0,
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'pname': wgl.WebGL.TEXTURE_WRAP_T,
    'param': 0x2900, // GL_CLAMP
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'pname': wgl.WebGL.TEXTURE_WRAP_T,
    'param': wgl.WebGL.REPEAT,
    'expectedError': wgl.WebGL.NO_ERROR} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testTexParameter(testCases[ii]);

  debug("");
  debug("Checking GetTexParameter: a set of inputs that are valid in GL but invalid in GLES2");

  testCases =
    [ {'target': 0x0DE0, // GL_TEXTURE_1D
      'pname': wgl.WebGL.TEXTURE_WRAP_T,
      'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'pname': 0x813A, // GL_TEXTURE_MIN_LOD
    'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'pname': wgl.WebGL.TEXTURE_WRAP_T,
    'expectedError': wgl.WebGL.NO_ERROR} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testGetTexParameter(testCases[ii]);

  debug("");
  debug("Checking CopyTexImage2D: a set of inputs that are valid in GL but invalid in GLES2");

  var colorBuffer = null;
  var fbo = null;

  shouldBeNonNull(fbo = gl.createFramebuffer());
  gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
  shouldBeNonNull(colorBuffer = gl.createRenderbuffer());
  gl.bindRenderbuffer(wgl.WebGL.RENDERBUFFER, colorBuffer);
  gl.framebufferRenderbuffer(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.RENDERBUFFER, colorBuffer);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  testCases =
    [ {'target': wgl.WebGL.TEXTURE_2D,
      'colorBufferFormat': wgl.WebGL.RGB565,
      'internalFormat': 0x8054, // GL_RGB16
      'border': 0,
      'expectedError': wgl.WebGL.INVALID_ENUM},
  {'target': wgl.WebGL.TEXTURE_2D,
    'colorBufferFormat': wgl.WebGL.RGB565,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 1,
    'expectedError': wgl.WebGL.INVALID_VALUE},
  {'target': wgl.WebGL.TEXTURE_2D,
    'colorBufferFormat': wgl.WebGL.RGB565,
    'internalFormat': wgl.WebGL.RGBA,
    'border': 0,
    'expectedError': wgl.WebGL.INVALID_OPERATION},
  {'target': wgl.WebGL.TEXTURE_2D,
    'colorBufferFormat': wgl.WebGL.RGB565,
    'internalFormat': wgl.WebGL.RGB,
    'border': 0,
    'expectedError': wgl.WebGL.NO_ERROR} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testCopyTexImage2D(testCases[ii]);

  debug("");
  debug("Checking CopyTexSubImage2D: a set of inputs that are valid in GL but invalid in GLES2");

  testCases =
    [ {'target': wgl.WebGL.TEXTURE_2D,
      'colorBufferFormat': wgl.WebGL.RGB5_A1,
      'internalFormat': wgl.WebGL.RGBA,
      'expectedError': wgl.WebGL.NO_ERROR},
  {'target': wgl.WebGL.TEXTURE_2D,
    'colorBufferFormat': wgl.WebGL.RGB565,
    'internalFormat': wgl.WebGL.RGBA,
    'expectedError': wgl.WebGL.INVALID_OPERATION} ];

  for (var ii = 0; ii < testCases.length; ++ii)
    testCopyTexSubImage2D(testCases[ii]);

  debug("");
  debug("Checking CopyTex{Sub}Image2D: copy from WebGL internal framebuffer");

  var testCases1 =
    [ {'contextAlpha': true,
      'internalFormat': wgl.WebGL.RGBA,
      'subImage': false,
      'expectedError': wgl.WebGL.NO_ERROR},
  {'contextAlpha': false,
    'internalFormat': wgl.WebGL.RGBA,
    'subImage': false,
    'expectedError': wgl.WebGL.INVALID_OPERATION},
  {'contextAlpha': true,
    'internalFormat': wgl.WebGL.RGBA,
    'subImage': true,
    'expectedError': wgl.WebGL.NO_ERROR},
  {'contextAlpha': false,
    'internalFormat': wgl.WebGL.RGBA,
    'subImage': true,
    'expectedError': wgl.WebGL.INVALID_OPERATION} ];

  for (var ii = 0; ii < testCases1.length; ++ii)
    testCopyFromInternalFBO(testCases1[ii]);
}
