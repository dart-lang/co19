/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description WebGL shader precision format test.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "resources/desktop-gl-constants.dart";
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="2" height="2" style="width: 40px; height: 40px;"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Tests that WebGLShaderPrecisionFormat class and getShaderPrecisionFormat work.");
  debug("");
  var gl = create3DContext(document.getElementById("canvas"));

  verifyShaderPrecisionFormat(shadertype, precisiontype) {
    shouldBeTrue(gl.getShaderPrecisionFormat(shadertype,precisiontype)
       is wgl.ShaderPrecisionFormat);
  }

  debug("");
  debug("Test that getShaderPrecisionFormat returns a WebGLShaderPrecisionFormat object.");
  debug("");

  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_FLOAT);
  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.MEDIUM_FLOAT);
  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.HIGH_FLOAT);
  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_INT);
  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.MEDIUM_INT);
  verifyShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.HIGH_INT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.LOW_FLOAT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.MEDIUM_FLOAT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.HIGH_FLOAT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.LOW_INT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.MEDIUM_INT);
  verifyShaderPrecisionFormat(wgl.FRAGMENT_SHADER, wgl.HIGH_INT);

  debug("");
  debug("Test that getShaderPrecisionFormat throws an error with invalid parameters.");
  debug("");

  shouldGenerateGLError(gl, wgl.INVALID_ENUM, () => gl.getShaderPrecisionFormat(wgl.HIGH_INT, wgl.VERTEX_SHADER));

  debug("");
  debug("Test that WebGLShaderPrecisionFormat values are sensible.");
  debug("");

  // The minimum values are from OpenGL ES Shading Language spec, section 4.5.

  var shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_FLOAT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 1);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 1);
  shouldBeTrue(shaderPrecisionFormat.precision >= 8);

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.MEDIUM_FLOAT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 14);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 14);
  shouldBeTrue(shaderPrecisionFormat.precision >= 10);

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.HIGH_FLOAT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 62);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 62);
  shouldBeTrue(shaderPrecisionFormat.precision >= 16);

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_INT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 8);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 8);
  shouldBeTrue(shaderPrecisionFormat.precision == 0);

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.MEDIUM_INT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 10);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 10);
  shouldBeTrue(shaderPrecisionFormat.precision == 0);

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.HIGH_INT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin >= 16);
  shouldBeTrue(shaderPrecisionFormat.rangeMax >= 16);
  shouldBeTrue(shaderPrecisionFormat.precision == 0);

  debug("");
  debug("Test that getShaderPrecisionFormat returns the same thing every call.");
  debug("");

  shaderPrecisionFormat = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_FLOAT);
  var shaderPrecisionFormat2 = gl.getShaderPrecisionFormat(wgl.VERTEX_SHADER, wgl.LOW_FLOAT);
  shouldBeTrue(shaderPrecisionFormat.rangeMin == shaderPrecisionFormat2.rangeMin);
  shouldBeTrue(shaderPrecisionFormat.rangeMax == shaderPrecisionFormat2.rangeMax);
  shouldBeTrue(shaderPrecisionFormat.precision == shaderPrecisionFormat2.precision);
}
