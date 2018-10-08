/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures WebGL implementations handle uniformMatrix in
 * a OpenGL ES 2.0 spec compliant way
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="example" width="2" height="2"> </canvas>

      <script id="vshader" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      uniform mat4 world4;
      uniform mat3 world3;
      uniform mat2 world2;
      void main()
      {
        gl_Position = vec4(vPosition.xyz, world3[0].x + world2[0].x) * world4;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      void main()
      {
        gl_FragColor = vec4(1.0,0.0,0.0,1.0);
      }
      </script>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Checking gl.uniformMatrix.");

  var gl = initWebGL("example", "vshader", "fshader", [ "vPosition"], [ 0, 0, 0, 1 ], 1);

  for (var ii = 2; ii <= 4; ++ii) {
    var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);
    var loc = gl.getUniformLocation(program, "world$ii");
    var matLess = new Float32List(ii*ii-1);
    var mat = new Float32List(ii*ii);
    var matMore = new Float32List(ii*ii+1);

    var name = "uniformMatrix${ii}fv";
    var func;
    switch (ii) {
      case 2: func = gl.uniformMatrix2fv; break;
      case 3: func = gl.uniformMatrix3fv; break;
      case 4: func = gl.uniformMatrix4fv; break;
    }
    func(loc, false, matLess);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE, "should fail with insufficient array size for " + name);
    func(loc, false, mat);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "should succeed with correct array size for " + name);
    func(loc, false, matMore);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE, "should fail with more than 1 array size for " + name);
    func(loc, false, mat);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "can call " + name + "with transpose = false");
    //according to OpenGL ES 2.0 spec:
    func(loc, true, mat);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE, name + " should return INVALID_VALUE with transpose = true");
  }
}
