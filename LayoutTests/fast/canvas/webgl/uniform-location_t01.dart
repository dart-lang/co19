/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests the WebGLUniformLocation API
 * @issue 19522
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var contextA = create3DContext();
  var programA1 = loadStandardProgram(contextA);
  var programA2 = loadStandardProgram(contextA);
  var programS = loadProgram(contextA, "$root/resources/structUniformShader.vert", "$root/resources/fragmentShader.frag");
  var programV = loadProgram(contextA, "$root/resources/floatUniformShader.vert", "$root/resources/noopUniformShader.frag");
  var locationA = contextA.getUniformLocation(programA1, 'u_modelViewProjMatrix');
  var locationSx = contextA.getUniformLocation(programS, "u_struct.x");
  var locationArray0 = contextA.getUniformLocation(programS, "u_array[0]");
  var locationArray1 = contextA.getUniformLocation(programS, "u_array[1]");
  var locationVec4 = contextA.getUniformLocation(programV, "fval4");

  var vec = new Float32List.fromList([1.0, 2.0, 3.0, 4.0]);
  var mat = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0]);

  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.useProgram(programA2));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.uniformMatrix4fv(locationA, false, mat));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.useProgram(programA1));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniformMatrix4fv(locationA, false, mat));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniformMatrix4fv(null, false, mat));

  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.useProgram(programS));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniform1i(locationSx, 3));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniform1f(locationArray0, 4.0));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniform1f(locationArray1, 5.0));

  shouldBe(contextA.getUniform(programS, locationSx), 3);
  shouldBe(contextA.getUniform(programS, locationArray0), 4.0);
  shouldBe(contextA.getUniform(programS, locationArray1), 5.0);

  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.useProgram(programV));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniform4fv(locationVec4, vec));
  shouldBe(contextA.getUniform(programV, locationVec4), vec);

  shouldBeNull(contextA.getUniformLocation(programV, "IDontExist"));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.linkProgram(programA1));
  // After linking all boxes are bad.
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.uniformMatrix4fv(locationA, false, mat));

  // after re-linking the same program, all uniform locations become invalid.
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.useProgram(programS));
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.linkProgram(programS));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.uniform1i(locationSx, 3));
  shouldGenerateGLError(contextA, wgl.WebGL.INVALID_OPERATION, () => contextA.getUniform(programS, locationSx));

  // Retrieve the locations again, and they should be good.
  locationSx = contextA.getUniformLocation(programS, "u_struct.x");
  locationArray0 = contextA.getUniformLocation(programS, "u_array[0]");
  shouldGenerateGLError(contextA, wgl.WebGL.NO_ERROR, () => contextA.uniform1i(locationSx, 3));
  shouldBe(contextA.getUniform(programS, locationSx), 3);
}
