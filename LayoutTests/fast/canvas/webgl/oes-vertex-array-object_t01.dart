/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test verifies the functionality of the
 * OES_vertex_array_object extension, if it is available.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

class _State {
  var vao;
  var buffer;
  var elbuffer;
}

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" style="width: 50px; height: 50px;"> </canvas>
      <div id="console"></div>
      <script id="vshader", type="x-shader/x-vertex">
      attribute vec4 a_position;
      attribute vec4 a_color;
      varying vec4 v_color;
      void main(void) {
          gl_Position = a_position;
          v_color = a_color;
      }
      </script>
      <script id="fshader", type="x-shader/x-fragment">
      precision mediump float;
      varying vec4 v_color;
      void main(void) {
          gl_FragColor = v_color;
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("canvas");
  var gl = create3DContext(canvas);
  var ext = null;
  var vao = null;

  runSupportedTest(extensionEnabled) {
    var supported = gl.getSupportedExtensions();
    if (supported.indexOf("OES_vertex_array_object") >= 0) {
      if (extensionEnabled) {
        testPassed("OES_vertex_array_object listed as supported and getExtension succeeded");
      } else {
        testFailed("OES_vertex_array_object listed as supported but getExtension failed");
      }
    } else {
      if (extensionEnabled) {
        testFailed("OES_vertex_array_object not listed as supported but getExtension succeeded");
      } else {
        testPassed("OES_vertex_array_object not listed as supported and getExtension failed -- this is legal");
      }
    }
  }

  runBindingTestDisabled() {
    debug("Testing binding enum with extension disabled");

    // Use the constant directly as we don't have the extension
    var VERTEX_ARRAY_BINDING_OES = 0x85B5;

    gl.getParameter(VERTEX_ARRAY_BINDING_OES);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_ENUM, "VERTEX_ARRAY_BINDING_OES should not be queryable if extension is disabled");
  }

  runBindingTestEnabled() {
    debug("Testing binding enum with extension enabled");

    shouldBe(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES, 0x85B5);

    gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "VERTEX_ARRAY_BINDING_OES query should succeed if extension is enable");

    // Default value is null
    if (gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) == null) {
      testPassed("Default value of VERTEX_ARRAY_BINDING_OES is null");
    } else {
      testFailed("Default value of VERTEX_ARRAY_BINDING_OES is not null");
    }

    debug("Testing binding a VAO");
    var vao0 = ext.createVertexArray();
    var vao1 = ext.createVertexArray();
    shouldBeNull(gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES));
    ext.bindVertexArray(vao0);
    if (gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) == vao0) {
      testPassed("gl.getParameter(wgl.WebGL.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) is expected VAO");
    } else {
      testFailed("gl.getParameter(wgl.WebGL.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) is not expected VAO");
    }
    ext.bindVertexArray(vao1);
    if (gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) == vao1) {
      testPassed("gl.getParameter(wgl.WebGL.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) is expected VAO");
    } else {
      testFailed("gl.getParameter(wgl.WebGL.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES) is not expected VAO");
    }
    ext.deleteVertexArray(vao1);
    shouldBeNull(gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES));
    ext.bindVertexArray(vao1);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION, "binding a deleted vertex array object");
    ext.bindVertexArray(null);
    shouldBeNull(gl.getParameter(wgl.OesVertexArrayObject.VERTEX_ARRAY_BINDING_OES));
    ext.deleteVertexArray(vao1);
  }

  runObjectTest() {
    debug("Testing object creation");

    vao = ext.createVertexArray();
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "createVertexArray should not set an error");
    shouldBeNonNull(vao);

    // Expect false if never bound
    shouldBeFalse(ext.isVertexArray(vao));
    ext.bindVertexArray(vao);
    shouldBeTrue(ext.isVertexArray(vao));
    ext.bindVertexArray(null);
    shouldBeTrue(ext.isVertexArray(vao));

    //shouldBeFalse(ext.isVertexArray());
    shouldBeFalse(ext.isVertexArray(null));

    ext.deleteVertexArray(vao);
    vao = null;
  }

  runAttributeTests() {
    debug("Testing attributes work across bindings");

    var states = [];

    var attrCount = gl.getParameter(wgl.WebGL.MAX_VERTEX_ATTRIBS);
    for (var n = 0; n < attrCount; n++) {
      gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, null);
      gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, null);

      var state = new _State();
      states.add(state);

      var vao = state.vao = ext.createVertexArray();
      ext.bindVertexArray(vao);

      if (n % 2 == 0) {
        gl.enableVertexAttribArray(n);
      } else {
        gl.disableVertexAttribArray(n);
      }

      if (n % 2 == 0) {
        var buffer = state.buffer = gl.createBuffer();
        gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buffer);
        gl.bufferData(wgl.WebGL.ARRAY_BUFFER, 1024, wgl.WebGL.STATIC_DRAW);

        gl.vertexAttribPointer(n, 1 + n % 4, wgl.WebGL.FLOAT, true, n * 4, n * 4);
      }

      if (n % 2 == 0) {
        var elbuffer = state.elbuffer = gl.createBuffer();
        gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elbuffer);
        gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, 1024, wgl.WebGL.STATIC_DRAW);
      }

      ext.bindVertexArray(null);
    }

    var anyMismatch = false;
    for (var n = 0; n < attrCount; n++) {
      var state = states[n];

      ext.bindVertexArray(state.vao);

      var isEnabled = gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_ENABLED);
      if ((n % 2 == 1) || isEnabled) {
        // Valid
      } else {
        testFailed("VERTEX_ATTRIB_ARRAY_ENABLED not preserved");
        anyMismatch = true;
      }

      var buffer = gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING);
      if (n % 2 == 0) {
        if (buffer == state.buffer) {
          // Matched
          if ((gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_SIZE) == 1 + n % 4) &&
              (gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_TYPE) == wgl.WebGL.FLOAT) &&
              (gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_NORMALIZED) == true) &&
              (gl.getVertexAttrib(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_STRIDE) == n * 4) &&
              (gl.getVertexAttribOffset(n, wgl.WebGL.VERTEX_ATTRIB_ARRAY_POINTER) == n * 4)) {
                // Matched
              } else {
                testFailed("VERTEX_ATTRIB_ARRAY_* not preserved");
                anyMismatch = true;
              }
        } else {
          testFailed("VERTEX_ATTRIB_ARRAY_BUFFER_BINDING not preserved");
          anyMismatch = true;
        }
      } else {
        // GL_CURRENT_VERTEX_ATTRIB is not preserved
        if (buffer) {
          testFailed("VERTEX_ATTRIB_ARRAY_BUFFER_BINDING not preserved");
          anyMismatch = true;
        }
      }

      var elbuffer = gl.getParameter(wgl.WebGL.ELEMENT_ARRAY_BUFFER_BINDING);
      if (n % 2 == 0) {
        if (elbuffer == state.elbuffer) {
          // Matched
        } else {
          testFailed("ELEMENT_ARRAY_BUFFER_BINDING not preserved");
          anyMismatch = true;
        }
      } else {
        if (elbuffer == null) {
          // Matched
        } else {
          testFailed("ELEMENT_ARRAY_BUFFER_BINDING not preserved");
          anyMismatch = true;
        }
      }
    }
    ext.bindVertexArray(null);
    if (!anyMismatch) {
      testPassed("All attributes preserved across bindings");
    }

    for (var n = 0; n < attrCount; n++) {
      var state = states[n];
      ext.deleteVertexArray(state.vao);
    }
  }

  runAttributeValueTests() {
    debug("Testing that attribute values are not attached to bindings");

    var v;
    var vao0 = ext.createVertexArray();
    var anyFailed = false;

    ext.bindVertexArray(null);
    gl.vertexAttrib4f(0, 0, 1, 2, 3);

    v = gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB);
    if (!(v[0] == 0 && v[1] == 1 && v[2] == 2 && v[3] == 3)) {
      testFailed("Vertex attrib value not round-tripped?");
      anyFailed = true;
    }

    ext.bindVertexArray(vao0);

    v = gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB);
    if (!(v[0] == 0 && v[1] == 1 && v[2] == 2 && v[3] == 3)) {
      testFailed("Vertex attrib value reset across bindings");
      anyFailed = true;
    }

    gl.vertexAttrib4f(0, 4, 5, 6, 7);
    ext.bindVertexArray(null);

    v = gl.getVertexAttrib(0, wgl.WebGL.CURRENT_VERTEX_ATTRIB);
    if (!(v[0] == 4 && v[1] == 5 && v[2] == 6 && v[3] == 7)) {
      testFailed("Vertex attrib value bound to buffer");
      anyFailed = true;
    }

    if (!anyFailed) {
      testPassed("Vertex attribute values are not attached to bindings");
    }

    ext.bindVertexArray(null);
    ext.deleteVertexArray(vao0);
  }

  runDrawTests() {
    debug("Testing draws with various VAO bindings");

    canvas.width = 50; canvas.height = 50;
    gl.viewport(0, 0, canvas.width, canvas.height);

    var vao0 = ext.createVertexArray();
    var vao1 = ext.createVertexArray();

    var program = wtu.setupSimpleTextureProgram(gl, 0, 1);

    setupQuad(s) {
      var opt_positionLocation = 0;
      var opt_texcoordLocation = 1;
      var vertexObject = gl.createBuffer();
      gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
      gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([
            1.0 * s,  1.0 * s, 0.0,
            -1.0 * s,  1.0 * s, 0.0,
            -1.0 * s, -1.0 * s, 0.0,
            1.0 * s,  1.0 * s, 0.0,
            -1.0 * s, -1.0 * s, 0.0,
            1.0 * s, -1.0 * s, 0.0]), wgl.WebGL.STATIC_DRAW);
      gl.enableVertexAttribArray(opt_positionLocation);
      gl.vertexAttribPointer(opt_positionLocation, 3, wgl.WebGL.FLOAT, false, 0, 0);

      vertexObject = gl.createBuffer();
      gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
      gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([
            1.0 * s, 1.0 * s,
            0.0 * s, 1.0 * s,
            0.0 * s, 0.0 * s,
            1.0 * s, 1.0 * s,
            0.0 * s, 0.0 * s,
            1.0 * s, 0.0 * s]), wgl.WebGL.STATIC_DRAW);
      gl.enableVertexAttribArray(opt_texcoordLocation);
      gl.vertexAttribPointer(opt_texcoordLocation, 2, wgl.WebGL.FLOAT, false, 0, 0);
    };

    readLocation(x, y) {
      var pixels = new Uint8List(1 * 1 * 4);
      gl.readPixels(x, y, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, pixels);
      return pixels;
    };
    testPixel(blackList, whiteList) {
      testList(list, expected) {
        for (var n = 0; n < list.length; n++) {
          var l = list[n];
          var x = (-floor(l * canvas.width / 2) + canvas.width / 2).toInt();
          var y = (-floor(l * canvas.height / 2) + canvas.height / 2).toInt();
          var source = readLocation(x, y);
          if (abs(source[0] - expected) > 2) {
            return false;
          }
        }
        return true;
      }
      return testList(blackList, 0) && testList(whiteList, 255);
    };
    verifyDraw(drawNumber, s) {
      wtu.drawQuad(gl);
      var blackList = [];
      var whiteList = [];
      var points = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0];
      for (var n = 0; n < points.length; n++) {
        if (points[n] <= s) {
          blackList.add(points[n]);
        } else {
          whiteList.add(points[n]);
        }
      }
      if (testPixel(blackList, whiteList)) {
        testPassed("Draw $drawNumber passed pixel test");
      } else {
        testFailed("Draw $drawNumber failed pixel test");
      }
    };

    // Setup all bindings
    setupQuad(1);
    ext.bindVertexArray(vao0);
    setupQuad(0.5);
    ext.bindVertexArray(vao1);
    setupQuad(0.25);

    // Verify drawing
    ext.bindVertexArray(null);
    verifyDraw(0, 1);
    ext.bindVertexArray(vao0);
    verifyDraw(1, 0.5);
    ext.bindVertexArray(vao1);
    verifyDraw(2, 0.25);

    ext.bindVertexArray(null);
    ext.deleteVertexArray(vao0);
    ext.deleteVertexArray(vao1);
  }

  runDeleteTests() {
    debug("Testing using deleted buffers referenced by VAOs");

    var program = wtu.setupProgram(gl, ["vshader", "fshader"], ["a_position", "a_color"]);
    gl.useProgram(program);

    var positionBuffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, positionBuffer);
    gl.bufferData(
        wgl.WebGL.ARRAY_BUFFER,
        new Float32List.fromList([
          1.0,  1.0,
          -1.0,  1.0,
          -1.0, -1.0,
          1.0, -1.0]),
        wgl.WebGL.STATIC_DRAW);

    var colors = [
      [255,   0,   0, 255],
      [  0, 255,   0, 255],
      [  0,   0, 255, 255],
      [  0, 255, 255, 255]
    ];
    var colorBuffers = [];
    var elementBuffers = [];
    var vaos = [];
    for (var ii = 0; ii < colors.length; ++ii) {
      var vao = ext.createVertexArray();
      vaos.add(vao);
      ext.bindVertexArray(vao);
      // Set the position buffer
      gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, positionBuffer);
      gl.enableVertexAttribArray(0);
      gl.vertexAttribPointer(0, 2, wgl.WebGL.FLOAT, false, 0, 0);

      var elementBuffer = gl.createBuffer();
      elementBuffers.add(elementBuffer);
      gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elementBuffer);
      gl.bufferData(
          wgl.WebGL.ELEMENT_ARRAY_BUFFER,
          new Uint8List.fromList([0, 1, 2, 0, 2, 3]),
          wgl.WebGL.STATIC_DRAW);

      // Setup the color attrib
      var color = colors[ii];
      if (ii < 3) {
        var colorBuffer = gl.createBuffer();
        colorBuffers.add(colorBuffer);
        gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, colorBuffer);
        gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Uint8List.fromList(
              [ color[0], color[1], color[2], color[3],
              color[0], color[1], color[2], color[3],
              color[0], color[1], color[2], color[3],
              color[0], color[1], color[2], color[3]
              ]), wgl.WebGL.STATIC_DRAW);
        gl.enableVertexAttribArray(1);
        gl.vertexAttribPointer(1, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, 0);
      } else {
        gl.vertexAttrib4f(1, color[0] / 255, color[1] / 255, color[2] / 255, color[3] / 255);
      }
    }

    // delete the color buffers AND the position buffer.
    ext.bindVertexArray(null);
    for (var ii = 0; ii < colorBuffers.length; ++ii) {
      gl.deleteBuffer(colorBuffers[ii]);
      gl.deleteBuffer(elementBuffers[ii]);
      // The buffers should still be valid at this point, since it was attached to the VAO
      if(!gl.isBuffer(colorBuffers[ii])) {
        testFailed("buffer removed too early");
      }
    }
    gl.deleteBuffer(positionBuffer);

    // Render with the deleted buffers. As they are referenced by VAOs they
    // must still be around.
    for (var ii = 0; ii < colors.length; ++ii) {
      var color = colors[ii];
      ext.bindVertexArray(vaos[ii]);
      gl.drawElements(wgl.WebGL.TRIANGLES, 6, wgl.WebGL.UNSIGNED_BYTE, 0);
      wtu.checkCanvas(gl, color, "should be $color");
    }

    // Clean up.
    for (var ii = 0; ii < colorBuffers.length; ++ii) {
      ext.deleteVertexArray(vaos[ii]);
    }

    for (var ii = 0; ii < colorBuffers.length; ++ii) {
      // The buffers should no longer be valid now that the VAOs are deleted
      if(gl.isBuffer(colorBuffers[ii])) {
        testFailed("buffer not properly cleaned up after VAO deletion");
      }
    }
  }

  runArrayBufferBindTests() {
    debug("Testing that VAOs don't effect ARRAY_BUFFER binding.");

    ext.bindVertexArray(null);

    var program = wtu.setupProgram(gl, ["vshader", "fshader"], ["a_color", "a_position"]);
    gl.useProgram(program);

    // create shared element buuffer
    var elementBuffer = gl.createBuffer();
    // bind to default
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elementBuffer);
    gl.bufferData(
        wgl.WebGL.ELEMENT_ARRAY_BUFFER,
        new Uint8List.fromList([0, 1, 2, 0, 2, 3]),
        wgl.WebGL.STATIC_DRAW);

    // first create the buffers for no vao draw.
    var nonVAOColorBuffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, nonVAOColorBuffer);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Uint8List.fromList(
          [ 0, 255, 0, 255,
          0, 255, 0, 255,
          0, 255, 0, 255,
          0, 255, 0, 255,
          ]), wgl.WebGL.STATIC_DRAW);

    // shared position buffer.
    var positionBuffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, positionBuffer);
    gl.bufferData(
        wgl.WebGL.ARRAY_BUFFER,
        new Float32List.fromList([
          1.0,  1.0,
          -1.0,  1.0,
          -1.0, -1.0,
          1.0, -1.0]),
        wgl.WebGL.STATIC_DRAW);

    // attach position buffer to default
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, 0);

    // now create vao
    var vao = ext.createVertexArray();
    ext.bindVertexArray(vao);

    // attach the position buffer vao
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, 0);

    var vaoColorBuffer = gl.createBuffer();
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, 0);
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vaoColorBuffer);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Uint8List.fromList(
          [ 255, 0, 0, 255,
          255, 0, 0, 255,
          255, 0, 0, 255,
          255, 0, 0, 255,
          ]), wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, 0);

    // now set the buffer back to the nonVAOColorBuffer
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, nonVAOColorBuffer);

    // bind to vao
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elementBuffer);
    gl.drawElements(wgl.WebGL.TRIANGLES, 6, wgl.WebGL.UNSIGNED_BYTE, 0);
    wtu.checkCanvas(gl, [255, 0, 0, 255], "should be red");

    // unbind vao
    ext.bindVertexArray(null);

    // At this point the nonVAOColorBuffer should be still be bound.
    // If the WebGL impl is emulating VAOs it must make sure
    // it correctly restores this binding.
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 4, wgl.WebGL.UNSIGNED_BYTE, true, 0, 0);
    gl.drawElements(wgl.WebGL.TRIANGLES, 6, wgl.WebGL.UNSIGNED_BYTE, 0);
    wtu.checkCanvas(gl, [0, 255, 0, 255], "should be green");
  }

  if (gl == null) {
    testFailed("WebGL context does not exist");
  } else {
    testPassed("WebGL context exists");

    // Run tests with extension disabled
    runBindingTestDisabled();

    // Query the extension and store globally so shouldBe can access it
    ext = gl.getExtension("OES_vertex_array_object");
    if (ext == null) {
      testPassed("No OES_vertex_array_object support -- this is legal");

      runSupportedTest(false);
    } else {
      testPassed("Successfully enabled OES_vertex_array_object extension");

      runSupportedTest(true);
      runBindingTestEnabled();
      runObjectTest();
      runAttributeTests();
      runAttributeValueTests();
      runDrawTests();
      runDeleteTests();
      runArrayBufferBindTests();
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "there should be no errors");
    }
  }
}
