/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify limits on the lengths of attrib locations.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="50" height="50">
      There is supposed to be an example drawing here, but it's not important.
      </canvas>
      <div id="console"></div>
      <script id="goodVertexShader1" type="x-shader/x-vertex">
      // A vertex shader where the needed attrib location is long, but not over the limit.
      attribute vec4 vPosition01234567890123456789012345678901234567890123456789012345678901234567890;

      void main()
      {
          gl_Position = vPosition01234567890123456789012345678901234567890123456789012345678901234567890;
      }
      </script>
      <script id="goodVertexShader2" type="x-shader/x-vertex">
      // A vertex shader where the needed attrib location is exactly 256 characters.
      attribute vec4 vPosition0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456;

      void main()
      {
          gl_Position = vPosition0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456;
      }
      </script>
      <script id="badVertexShader" type="x-shader/x-vertex">
      // A vertex shader where the needed attrib location is 257 characters.
      attribute vec4 vPosition01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567;

      void main()
      {
          gl_Position = vPosition01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567;
      }
      </script>
      <script id="fragmentShader" type="x-shader/x-fragment">
      precision mediump float;

      void main() {
          gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = wtu.create3DContext(document.getElementById("example"));

  debug("Test attrib location underneath the length limit");
  var program = wtu.loadProgramFromScript(gl, "goodVertexShader1", "fragmentShader");
  shouldBe(gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS), true);
  var attribLoc = gl.getAttribLocation(program, "vPosition01234567890123456789012345678901234567890123456789012345678901234567890");
  if (attribLoc == -1) {
      testFailed("attrib location was -1, should not be");
  } else {
      testPassed("attrib location should not be -1");
  }
  wtu.glErrorShouldBe(gl, wgl.WebGL.NONE);

  debug("Test attrib location exactly at the length limit");
  program = wtu.loadProgramFromScript(gl, "goodVertexShader2", "fragmentShader");
  shouldBe(gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS), true);
  attribLoc = gl.getAttribLocation(program, "vPosition0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456");
  if (attribLoc == -1) {
      testFailed("attrib location was -1, should not be");
  } else {
      testPassed("attrib location should not be -1");
  }
  wtu.glErrorShouldBe(gl, wgl.WebGL.NONE);

  debug("Test attrib location over the length limit");
  debug("Shader compilation should fail");
  shouldBe(wtu.loadShaderFromScript(gl, "badVertexShader", wgl.WebGL.VERTEX_SHADER, (err) {}), null);
  wtu.glErrorShouldBe(gl, wgl.WebGL.NONE);

  debug("Attempt to bind too-long attrib location should produce error");
  program = gl.createProgram();
  gl.bindAttribLocation(program, 0, "vPosition01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567");
  wtu.glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);

  debug("Attempt to fetch too-long attrib location should produce error");
  shouldBe(gl.getAttribLocation(program, "vPosition01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567"), -1);
  wtu.glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);
}
