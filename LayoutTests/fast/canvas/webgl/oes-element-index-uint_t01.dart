/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test verifies the functionality of the
 * OES_element_index_uint extension, if it is available.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" style="width: 50px; height: 50px;"> </canvas>
      <div id="console"></div>
      <script id="vs" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      attribute vec4 vColor;
      varying vec4 color;
      void main() {
          gl_Position = vPosition;
          color = vColor;
      }
      </script>
      <script id="fs" type="x-shader/x-fragment">
#if defined(GL_ES)
      precision mediump float;
#endif
      varying vec4 color;
      void main() {
        gl_FragColor = color;
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("canvas");
  var gl = create3DContext(canvas);
  var ext = null;

  List<double> toFloatList(list) => (list.map((x) => x.toDouble()) as Iterable<double>).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  runSupportedTest(extensionEnabled) {
    var supported = gl.getSupportedExtensions();
    if (supported.indexOf("OES_element_index_uint") >= 0) {
      if (extensionEnabled) {
        testPassed("OES_element_index_uint listed as supported and getExtension succeeded");
      } else {
        testFailed("OES_element_index_uint listed as supported but getExtension failed");
      }
    } else {
      if (extensionEnabled) {
        testFailed("OES_element_index_uint not listed as supported but getExtension succeeded");
      } else {
        testPassed("OES_element_index_uint not listed as supported and getExtension failed -- this is legal");
      }
    }
  }

  runDrawTests() {
    debug("Test that draws with unsigned integer indices produce the expected results");

    canvas.width = 50; canvas.height = 50;
    gl.viewport(0, 0, canvas.width, canvas.height);

    var program = wtu.setupSimpleTextureProgram(gl);

    setupDraw(s) {
      // Create a vertex buffer that cannot be fully indexed via shorts
      var quadArrayLen = 65537 * 3;
      var quadArray = new Float32List(quadArrayLen);

      // Leave all but the last 4 values zero-ed out
      var idx = quadArrayLen - 12;

      // Initialized the last 4 values to a quad
      quadArray[idx++] = 1.0 * s;
      quadArray[idx++] = 1.0 * s;
      quadArray[idx++] = 0.0;

      quadArray[idx++] = -1.0 * s;
      quadArray[idx++] = 1.0 * s;
      quadArray[idx++] = 0.0;

      quadArray[idx++] = -1.0 * s;
      quadArray[idx++] = -1.0 * s;
      quadArray[idx++] = 0.0;

      quadArray[idx++] = 1.0 * s;
      quadArray[idx++] = -1.0 * s;
      quadArray[idx++] = 0.0;

      var vertexObject = gl.createBuffer();
      gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
      gl.bufferData(wgl.WebGL.ARRAY_BUFFER, quadArray, wgl.WebGL.STATIC_DRAW);

      // Create an unsigned int index buffer that indexes the last 4 vertices
      var baseIndex = (quadArrayLen ~/ 3) - 4;

      var indexObject = gl.createBuffer();
      gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
      gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, new Uint32List.fromList([
            baseIndex + 0,
            baseIndex + 1,
            baseIndex + 2,
            baseIndex + 2,
            baseIndex + 3,
            baseIndex + 0]), wgl.WebGL.STATIC_DRAW);

      var opt_positionLocation = 0;
      gl.enableVertexAttribArray(opt_positionLocation);
      gl.vertexAttribPointer(opt_positionLocation, 3, wgl.WebGL.FLOAT, false, 0, 0);
    }
    readLocation(x, y) {
      var pixels = new Uint8List(1 * 1 * 4);
      gl.readPixels(x, y, 1, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, pixels);
      return pixels;
    }
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
    }
    verifyDraw(drawNumber, s) {
      gl.clearColor(1.0, 1.0, 1.0, 1.0);
      gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
      gl.drawElements(wgl.WebGL.TRIANGLES, 6, wgl.WebGL.UNSIGNED_INT, 0);

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
    }

    setupDraw(0.5);
    verifyDraw(0, 0.5);
  }

  runIndexValidationTests() {
    description("Tests that index validation verifies the correct number of indices");

    sizeInBytes(type) {
      switch (type) {
        case wgl.WebGL.BYTE:
        case wgl.WebGL.UNSIGNED_BYTE:
          return 1;
        case wgl.WebGL.SHORT:
        case wgl.WebGL.UNSIGNED_SHORT:
          return 2;
        case wgl.WebGL.INT:
        case wgl.WebGL.UNSIGNED_INT:
        case wgl.WebGL.FLOAT:
          return 4;
        default:
          throw "unknown type";
      }
    }

    var program = loadStandardProgram(gl);

    // 3 vertices => 1 triangle, interleaved data
    var dataComplete = float32list([0, 0, 0, 1,
        0, 0, 1,
        1, 0, 0, 1,
        0, 0, 1,
        1, 1, 1, 1,
        0, 0, 1]);
    var dataIncomplete = float32list([0, 0, 0, 1,
        0, 0, 1,
        1, 0, 0, 1,
        0, 0, 1,
        1, 1, 1, 1]);
    var indices = new Uint32List.fromList([0, 1, 2]);

    debug("Testing with valid indices");

    var bufferComplete = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, bufferComplete);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, dataComplete, wgl.WebGL.STATIC_DRAW);
    var elements = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elements);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
    gl.useProgram(program);
    var vertexLoc = gl.getAttribLocation(program, "a_vertex");
    var normalLoc = gl.getAttribLocation(program, "a_normal");
    gl.vertexAttribPointer(vertexLoc, 4, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), 0);
    gl.enableVertexAttribArray(vertexLoc);
    gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
    gl.enableVertexAttribArray(normalLoc);
    shouldBe(gl.checkFramebufferStatus(wgl.WebGL.FRAMEBUFFER), wgl.WebGL.FRAMEBUFFER_COMPLETE);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

    debug("Testing with out-of-range indices");

    var bufferIncomplete = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, bufferIncomplete);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, dataIncomplete, wgl.WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(vertexLoc, 4, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), 0);
    gl.enableVertexAttribArray(vertexLoc);
    gl.disableVertexAttribArray(normalLoc);
    debug("Enable vertices, valid");
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    debug("Enable normals, out-of-range");
    gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
    gl.enableVertexAttribArray(normalLoc);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION);

    debug("Test with enabled attribute that does not belong to current program");

    gl.disableVertexAttribArray(normalLoc);
    var extraLoc = max([vertexLoc, normalLoc]) + 1;
    gl.enableVertexAttribArray(extraLoc);
    debug("Enable an extra attribute with null");
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION);
    debug("Enable an extra attribute with insufficient data buffer");
    gl.vertexAttribPointer(extraLoc, 3, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), 4 * sizeInBytes(wgl.WebGL.FLOAT));
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    debug("Pass large negative index to vertexAttribPointer");
    gl.vertexAttribPointer(normalLoc, 3, wgl.WebGL.FLOAT, false, 7 * sizeInBytes(wgl.WebGL.FLOAT), -2000000000 * sizeInBytes(wgl.WebGL.FLOAT));
    glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);
    gl.drawElements(wgl.WebGL.TRIANGLES, 3, wgl.WebGL.UNSIGNED_INT, 0);
    gl.disableVertexAttribArray(vertexLoc);
  }

  runCopiesIndicesTests() {
    debug("Test that client data is always copied during bufferData and bufferSubData calls");

    var program = loadStandardProgram(gl);

    gl.useProgram(program);
    var vertexObject = gl.createBuffer();
    gl.enableVertexAttribArray(0);
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    // 4 vertices -> 2 triangles
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list([ 0,0,0, 0,1,0, 1,0,0, 1,1,0 ]), wgl.WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    var indexObject = gl.createBuffer();

    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
    var indices = new Uint32List.fromList([ 10000, 0, 1, 2, 3, 10000 ]);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 4));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 0));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 8));
    indices[0] = 2;
    indices[5] = 1;
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 4));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 0));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 8));
  }

  runResizedBufferTests() {
    debug("Test that updating the size of a vertex buffer is properly noticed by the WebGL implementation.");

    var program = wtu.setupProgram(gl, ["vs", "fs"], ["vPosition", "vColor"]);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after initialization");

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list(
          [-1,1,0, 1,1,0, -1,-1,0,
          -1,-1,0, 1,1,0, 1,-1,0]), wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after vertex setup");

    var texCoordObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, texCoordObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list(
          [0,0, 1,0, 0,1,
          0,1, 1,0, 1,1]), wgl.WebGL.STATIC_DRAW);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.WebGL.FLOAT, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after texture coord setup");

    // Now resize these buffers because we want to change what we're drawing.
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list([
          -1,1,0, 1,1,0, -1,-1,0, 1,-1,0,
          -1,1,0, 1,1,0, -1,-1,0, 1,-1,0]), wgl.WebGL.STATIC_DRAW);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after vertex redefinition");
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, texCoordObject);
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Uint8List.fromList([
          255, 0, 0, 255,
          255, 0, 0, 255,
          255, 0, 0, 255,
          255, 0, 0, 255,
          0, 255, 0, 255,
          0, 255, 0, 255,
          0, 255, 0, 255,
          0, 255, 0, 255]), wgl.WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(1, 4, wgl.WebGL.UNSIGNED_BYTE, false, 0, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after texture coordinate / color redefinition");

    var numQuads = 2;
    var indices = new Uint32List(numQuads * 6);
    for (var ii = 0; ii < numQuads; ++ii) {
      var offset = ii * 6;
      var quad = (ii == (numQuads - 1)) ? 4 : 0;
      indices[offset + 0] = quad + 0;
      indices[offset + 1] = quad + 1;
      indices[offset + 2] = quad + 2;
      indices[offset + 3] = quad + 2;
      indices[offset + 4] = quad + 1;
      indices[offset + 5] = quad + 3;
    }
    var indexObject = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after setting up indices");
    gl.drawElements(wgl.WebGL.TRIANGLES, numQuads * 6, wgl.WebGL.UNSIGNED_INT, 0);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "after drawing");
  }

  runVerifiesTooManyIndicesTests() {
    description("Tests that index validation for drawElements does not examine too many indices");

    var program = loadStandardProgram(gl);

    gl.useProgram(program);
    var vertexObject = gl.createBuffer();
    gl.enableVertexAttribArray(0);
    gl.disableVertexAttribArray(1);
    gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
    // 4 vertices -> 2 triangles
    gl.bufferData(wgl.WebGL.ARRAY_BUFFER, float32list([ 0,0,0, 0,1,0, 1,0,0, 1,1,0 ]), wgl.WebGL.STATIC_DRAW);
    gl.vertexAttribPointer(0, 3, wgl.WebGL.FLOAT, false, 0, 0);

    var indexObject = gl.createBuffer();

    debug("Test out of range indices");
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indexObject);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, new Uint32List.fromList([ 10000, 0, 1, 2, 3, 10000 ]), wgl.WebGL.STATIC_DRAW);
    shouldGenerateGLError(gl, wgl.WebGL.NO_ERROR, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 4));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 0));
    shouldGenerateGLError(gl, wgl.WebGL.INVALID_OPERATION, () => gl.drawElements(wgl.WebGL.TRIANGLE_STRIP, 4, wgl.WebGL.UNSIGNED_INT, 8));
  }

  runCrashWithBufferSubDataTests() {
    debug('Verifies that the index validation code which is within bufferSubData does not crash.');

    var elementBuffer = gl.createBuffer();
    gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elementBuffer);
    gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, 256, wgl.WebGL.STATIC_DRAW);
    var data = new Uint32List(127);
    gl.bufferSubData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, 64, data);
    glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE, "after attempting to update a buffer outside of the allocated bounds");
    testPassed("bufferSubData, when buffer object was initialized with null, did not crash");
  }

  if (gl == null) {
    testFailed("WebGL context does not exist");
  } else {
    testPassed("WebGL context exists");

    // Query the extension and store globally so shouldBe can access it
    ext = gl.getExtension("OES_element_index_uint");
    if (ext == null) {
      testPassed("No OES_element_index_uint support -- this is legal");

      runSupportedTest(false);
    } else {
      testPassed("Successfully enabled OES_element_index_uint extension");

      runSupportedTest(true);
      runDrawTests();

      // These tests are tweaked duplicates of the buffers/index-validation* tests
      // using unsigned int indices to ensure that behavior remains consistent
      runIndexValidationTests();
      runCopiesIndicesTests();
      runResizedBufferTests();
      runVerifiesTooManyIndicesTests();
      runCrashWithBufferSubDataTests();

      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "there should be no errors");
    }
  }
}
