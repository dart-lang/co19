/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that functions returning strings really do return strings
 * (and not e.g. null)
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <canvas id="canvas" width="2" height="2"> </canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var validVertexShaderString =
    "attribute vec4 aVertex; attribute vec4 aColor; varying vec4 vColor; void main() { vColor = aColor; gl_Position = aVertex; }";
  var validFragmentShaderString =
    "precision mediump float; varying vec4 vColor; void main() { gl_FragColor = vColor; }";

  shouldReturnString(x) => shouldBeTrue(x is String);

  var gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    var vs = gl.createShader(wgl.WebGL.VERTEX_SHADER);
    shouldReturnString(gl.getShaderSource(vs));
    shouldReturnString(gl.getShaderInfoLog(vs));
    gl.shaderSource(vs, validVertexShaderString);
    gl.compileShader(vs);
    shouldReturnString(gl.getShaderSource(vs));
    shouldReturnString(gl.getShaderInfoLog(vs));

    var fs = gl.createShader(wgl.WebGL.FRAGMENT_SHADER);
    shouldReturnString(gl.getShaderSource(fs));
    shouldReturnString(gl.getShaderInfoLog(fs));
    gl.shaderSource(fs, validFragmentShaderString);
    gl.compileShader(fs);
    shouldReturnString(gl.getShaderSource(fs));
    shouldReturnString(gl.getShaderInfoLog(fs));

    var prog = gl.createProgram();
    shouldReturnString(gl.getProgramInfoLog(prog));
    gl.attachShader(prog, vs);
    gl.attachShader(prog, fs);
    gl.linkProgram(prog);
    shouldReturnString(gl.getProgramInfoLog(prog));

    // Make sure different numbers of extensions doesn't result in
    // different test output.
    var exts = gl.getSupportedExtensions();
    shouldBeTrue(exts is List<String>);

    shouldReturnString(gl.getParameter(wgl.WebGL.VENDOR));
    shouldReturnString(gl.getParameter(wgl.WebGL.RENDERER));
    shouldReturnString(gl.getParameter(wgl.WebGL.VERSION));
    shouldReturnString(gl.getParameter(wgl.WebGL.SHADING_LANGUAGE_VERSION));
  }
}
