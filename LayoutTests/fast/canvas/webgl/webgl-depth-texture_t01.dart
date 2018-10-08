/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test verifies the functionality of the WEBGL_depth_texture
 * extension, if it is available.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec4 a_position;
      void main()
      {
          gl_Position = a_position;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      precision mediump float;
      uniform sampler2D u_texture;
      uniform vec2 u_resolution;
      void main()
      {
          vec2 texcoord = gl_FragCoord.xy / u_resolution;
          gl_FragColor = texture2D(u_texture, texcoord);
      }
      </script>
      <div id="console"></div>
      <canvas id="canvas" width="8" height="8" style="width: 8px; height: 8px;"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("canvas");
  var gl = wtu.create3DContext(canvas, {'antialias': false});
  var ext = null;
  var tex;

  runSupportedTest(extensionEnabled) {
    var name = wtu.getSupportedExtensionWithKnownPrefixes(gl, "WEBGL_depth_texture");
    if (name != null) {
      if (extensionEnabled) {
        testPassed("WEBGL_depth_texture listed as supported and getExtension succeeded");
      } else {
        testFailed("WEBGL_depth_texture listed as supported but getExtension failed");
      }
    } else {
      if (extensionEnabled) {
        testFailed("WEBGL_depth_texture not listed as supported but getExtension succeeded");
      } else {
        testPassed("WEBGL_depth_texture not listed as supported and getExtension failed -- this is legal");
      }
    }
  }

  runTestDisabled() {
    debug("Testing binding enum with extension disabled");

    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM,
        () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.DEPTH_COMPONENT, 1, 1, 0,
                            wgl.WebGL.DEPTH_COMPONENT, wgl.WebGL.UNSIGNED_SHORT, null));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_ENUM,
        () => gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.DEPTH_COMPONENT, 1, 1, 0,
                            wgl.WebGL.DEPTH_COMPONENT, wgl.WebGL.UNSIGNED_INT, null));
  }

  dumpIt(gl, res, msg) {
    //return;  // comment out to debug
    debug(msg);
    var actualPixels = new Uint8List(res * res * 4);
    gl.readPixels(0, 0, res, res, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, actualPixels);

    for (var yy = 0; yy < res; ++yy) {
      var strs = [];
      for (var xx = 0; xx < res; ++xx) {
        var actual = (yy * res + xx) * 4;
        strs.add("(${actualPixels[actual]},${actualPixels[actual+1]},${actualPixels[actual+2]},${actualPixels[actual+3]})");
      }
      debug(strs.join(" "));
    }
  }

  runTestExtension() {
    debug("Testing WEBGL_depth_texture");

    var res = 8;

    // make canvas for testing.
    dynamic canvas2 = document.createElement("canvas");
    canvas2.width = res;
    canvas2.height = res;
    var ctx = canvas2.getContext("2d");
    ctx.fillStyle = "blue";
    ctx.fillRect(0, 0, canvas2.width, canvas2.height);

    var program = wtu.setupProgram(gl, ['vshader', 'fshader'], ['a_position']);
    gl.useProgram(program);
    gl.uniform2f(gl.getUniformLocation(program, "u_resolution"), res, res);

    var buffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer);
    gl.bufferData(
        wgl.WebGL.ARRAY_BUFFER,
        new Float32List.fromList(
          [1.0,  1.0,  1.0,
          -1.0,  1.0,  0.0,
          -1.0, -1.0, -1.0,
           1.0,  1.0,  1.0,
          -1.0, -1.0, -1.0,
           1.0, -1.0,  0.0,
          ]),
        wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    var parameters = [
    {'attachment': wgl.WebGL.DEPTH_ATTACHMENT, 'format': wgl.WebGL.DEPTH_COMPONENT, 'type': wgl.WebGL.UNSIGNED_SHORT, 'data': new Uint16List(1)},
    {'attachment': wgl.WebGL.DEPTH_ATTACHMENT, 'format': wgl.WebGL.DEPTH_COMPONENT, 'type': wgl.WebGL.UNSIGNED_INT, 'data': new Uint32List(1)},
    {'attachment': wgl.WebGL.DEPTH_STENCIL_ATTACHMENT, 'format': wgl.WebGL.DEPTH_STENCIL, 'type': wgl.DepthTexture.UNSIGNED_INT_24_8_WEBGL, 'data': new Uint32List(1)}
    ];

    for (var ii = 0; ii < parameters.length; ++ii) {
      var attachment = parameters[ii]['attachment'];
      var format = parameters[ii]['format'];
      var type = parameters[ii]['type'];
      var data = parameters[ii]['data'];

      debug("testing parameters $ii:");

      // check that cubemaps are not allowed.
      var cubeTex = gl.createTexture();
      gl.bindTexture(wgl.WebGL.TEXTURE_CUBE_MAP, cubeTex);
      
      var targets = [
        wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_X,
        wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_X,
        wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Y,
        wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Y,
        wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Z,
        wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Z
      ];
      for (var target in targets) {
        shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
          gl.texImage2D(target, 1, format, 1, 1, 0, format, type, null);
        });
      }

      // check 2d textures.
      tex = gl.createTexture();
      gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);
      gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);

      // test level > 0
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 1, format, 1, 1, 0, format, type, null);
      });

      // test with data
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, format, 1, 1, 0, format, type, data);
      });

      // test with canvas
      shouldGenerateGLError(gl, [wgl.WebGL.INVALID_VALUE, wgl.WebGL.INVALID_ENUM, wgl.WebGL.INVALID_OPERATION], () {
        gl.texImage2DCanvas(wgl.WebGL.TEXTURE_2D, 0, format, format, type, canvas2);
      });

      // test copyTexImage2D
      shouldGenerateGLError(gl, [wgl.WebGL.INVALID_ENUM, wgl.WebGL.INVALID_OPERATION], () {
        gl.copyTexImage2D(wgl.WebGL.TEXTURE_2D, 0, format, 0, 0, 1, 1, 0);
      });

      // test real thing
      shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () {
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, format, res, res, 0, format, type, null);
      });

      // test texSubImage2D
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
        gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 1, 1, format, type, data);
      });

      // test copyTexSubImage2D
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
        gl.copyTexSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 0, 0, 1, 1);
      });

      // test generateMipmap
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () {
        gl.generateMipmap(wgl.WebGL.TEXTURE_2D);
      });

      var fbo = gl.createFramebuffer();
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
      gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, attachment, wgl.WebGL.TEXTURE_2D, tex, 0);
      // TODO: remove this check if the spec is updated to require these combinations to work.
      if (gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER) != wgl.WebGL.FRAMEBUFFER_COMPLETE)
      {
        // try adding a color buffer.
        var colorTex = gl.createTexture();
        gl.bindTexture(wgl.WebGL.TEXTURE_2D, colorTex);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.LINEAR);
        gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.LINEAR);
        gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, res, res, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, null);
        gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, wgl.WebGL.COLOR_ATTACHMENT0, wgl.WebGL.TEXTURE_2D, colorTex, 0);
      }

      shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);

      // use the default texture to render with while we return to the depth texture.
      gl.bindTexture(wgl.WebGL.TEXTURE_2D, null);

      // render the z-quad
      gl.enable(wgl.WebGL.DEPTH_TEST);
      gl.clearColor(1, 0, 0, 1);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

      dumpIt(gl, res, "--first--");

      // render the depth texture.
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
      gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
      gl.clearColor(0, 0, 1, 1);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);

      var actualPixels = new Uint8List(res * res * 4);
      gl.readPixels(0, 0, res, res, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, actualPixels);

      dumpIt(gl, res, "--depth--");

      // Check that each pixel's RGB are the same and that it's value is less
      // than the previous pixel in either direction. Basically verify we have a
      // gradient.
      var success = true;
      for (var yy = 0; yy < res; ++yy) {
        for (var xx = 0; xx < res; ++xx) {
          var actual = (yy * res + xx) * 4;
          var left = actual - 4;
          var down = actual - res * 4;

          if (actualPixels[actual + 0] != actualPixels[actual + 1]) {
            testFailed('R != G');
            success = false;
          }
          if (actualPixels[actual + 0] != actualPixels[actual + 2]) {
            testFailed('R != B');
            success = false;
          }
          // ALPHA is implementation dependent
          if (actualPixels[actual + 3] != 0xFF && actualPixels[actual + 3] != actualPixels[actual + 0]) {
            testFailed('A != 255 && A != R');
            success = false;
          }

          if (xx > 0) {
            if (actualPixels[actual] <= actualPixels[left]) {
              testFailed("actual(${actualPixels[actual]}) < left(${actualPixels[left]})");
              success = false;
            }
          }
          if (yy > 0) {
            if (actualPixels[actual] <= actualPixels[down]) {
              testFailed("actual(${actualPixels[actual]}) < down(${actualPixels[down]})");
              success = false;
            }
          }
        }
      }

      // Check that bottom left corner is vastly different thatn top right.
      if (actualPixels[(res * res - 1) * 4] - actualPixels[0] < 0xC0) {
        testFailed("corners are not different enough");
        success = false;
      }

      if (success) {
        testPassed("depth texture rendered correctly.");
      }

      // check limitations
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, fbo);
      gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, attachment, wgl.WebGL.TEXTURE_2D, null, 0);
      var badAttachment = attachment == wgl.WebGL.DEPTH_ATTACHMENT ? wgl.WebGL.DEPTH_STENCIL_ATTACHMENT : wgl.WebGL.DEPTH_ATTACHMENT;
      shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () {
        gl.framebufferTexture2D(wgl.WebGL.FRAMEBUFFER, badAttachment, wgl.WebGL.TEXTURE_2D, tex, 0);
      });
      shouldNotBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
      shouldGenerateGLError(gl, wgl.WebGL.INVALID_FRAMEBUFFER_OPERATION, () {
        gl.clear(wgl.WebGL.DEPTH_BUFFER_BIT);
      });
      gl.bindFramebuffer(wgl.WebGL.FRAMEBUFFER, null);
      shouldBe(gl.getError(), wgl.WebGL.NO_ERROR);
    }
  }

  if (gl == null) {
    testFailed("WebGL context does not exist");
  } else {
    testPassed("WebGL context exists");

    // Run tests with extension disabled
    runTestDisabled();
    
    // Query the extension and store globally so shouldBe can access it
    ext = gl.getExtension("WEBGL_depth_texture");
    if (ext == null) {
      testPassed("No WEBGL_depth_texture support -- this is legal");
      runSupportedTest(false);
    } else {
      testPassed("Successfully enabled WEBGL_depth_texture extension");

      runSupportedTest(true);
      runTestExtension();
    }
  }
}
