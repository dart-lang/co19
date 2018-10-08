/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests passing a vec4 to a uniform and a canvas to texImage2D
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

  var gl = create3DContext();
  var floatProgram = loadProgram(gl, "$root/resources/floatUniformShader.vert", "$root/resources/noopUniformShader.frag");
  shouldBeNull(gl.useProgram(floatProgram));
  var fval4Loc = gl.getUniformLocation(floatProgram, "fval4");
  shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
  shouldBeNull(gl.uniform4fv(fval4Loc, new Float32List.fromList([0.1, 0.2, 0.4, 1.0])));

  dynamic tmpcanvas = document.createElement("canvas");
  tmpcanvas.width = 2;
  tmpcanvas.height = 2;
  var texture = gl.createTexture();
  shouldBeNull(gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture));
  shouldBeNull(gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, tmpcanvas));
}
