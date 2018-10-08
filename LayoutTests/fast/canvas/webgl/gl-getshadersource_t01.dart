/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that the source that goes into a shader is what comes
 * out.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="4" height="4" style="width: 40px; height: 30px;"></canvas>
      <div id="description"></div>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">abc//defＮＯＴＡＳＣＩＩ</script>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");
  var gl = wtu.create3DContext(canvas);
  var original = document.getElementById("vshader").text;
  var shader = gl.createShader(wgl.WebGL.VERTEX_SHADER);
  gl.shaderSource(shader, original);
  var source = gl.getShaderSource(shader);
  shouldBe(source, original);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors.");
}
