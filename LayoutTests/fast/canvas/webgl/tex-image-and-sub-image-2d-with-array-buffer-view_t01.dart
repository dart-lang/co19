/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies texImage2D and texSubImage2D code paths taking
 * ArrayBufferView
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test-utils.dart" as wtu;

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="1px" height="2px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = null;
  var textureLoc = null;

  // These two declarations need to be global for "shouldBe" to see them
  var buf = null;

  generateRGBAData(type, unpackAlignment)
  {
    var sourceData = 
      [ 255,   0,   0, 255,
        0,   255,   0,   0 ];
    switch (type) {
      case wgl.WebGL.UNSIGNED_BYTE:
        var rowWidth = max([unpackAlignment, 4]);
        var data = new Uint8List(2 * rowWidth);
        for (var y = 0; y < 2; ++y) {
          var index = y * rowWidth;
          for (var element = 0; element < 4; ++element) {
            data[index + element] = sourceData[4 * y + element];
          }
        }
        return data;
      case wgl.WebGL.UNSIGNED_SHORT_4_4_4_4:
        var rowWidth = max([unpackAlignment, 2]) ~/ 2;
        var data = new Uint16List(2 * rowWidth);
        for (var y = 0; y < 2; ++y) {
          var index = y * rowWidth;
          data[index] = (((sourceData[4 * y] & 0xF0) << 8)
              | ((sourceData[4 * y + 1] & 0xF0) << 4)
              | (sourceData[4 * y + 2] & 0xF0)
              | (sourceData[4 * y + 3] >> 4));
        }
        return data;
      case wgl.WebGL.UNSIGNED_SHORT_5_5_5_1:
        var rowWidth = max([unpackAlignment, 2]) ~/ 2;
        var data = new Uint16List(2 * rowWidth);
        for (var y = 0; y < 2; ++y) {
          var index = y * rowWidth;
          data[index] = (((sourceData[4 * y] & 0xF8) << 8)
              | ((sourceData[4 * y + 1] & 0xF8) << 3)
              | ((sourceData[4 * y + 2] & 0xF8) >> 2)
              | (sourceData[4 * y + 3] >> 7));
        }
        return data;
    }
  }

  typeToString(type)
  {
    switch (type) {
      case wgl.WebGL.UNSIGNED_BYTE:  return 'UNSIGNED_BYTE';
      case wgl.WebGL.UNSIGNED_SHORT_5_5_5_1:  return 'UNSIGNED_SHORT_5_5_5_1';
      case wgl.WebGL.UNSIGNED_SHORT_4_4_4_4:  return 'UNSIGNED_SHORT_4_4_4_4';
    }
    return 'Unknown type $type';
  }

  runOneIteration(useTexSubImage2D, type, unpackAlignment, flipY, premultiplyAlpha, topColor, bottomColor)
  {
    debug('Testing ' + (useTexSubImage2D ? 'texSubImage2D' : 'texImage2D') +
        ' with type=' + typeToString(type) +
        ', unpackAlignment=$unpackAlignment' +
        ', flipY=$flipY, premultiplyAlpha=$premultiplyAlpha');
    gl.colorMask(true, true, true, true);
    gl.clearColor(0, 0, 0, 1.0);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    // Enable writes to the RGB channels
    gl.colorMask(true, true, true, false);
    var texture = gl.createTexture();
    // Bind the texture to texture unit 0
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    // Set up texture parameters
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
    // Set up pixel store parameters
    gl.pixelStorei(wgl.WebGL.UNPACK_ALIGNMENT, unpackAlignment);
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, flipY ? 1 : 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, premultiplyAlpha ? 1 : 0);
    // Generate the data
    var data = generateRGBAData(type, unpackAlignment);
    if (gl.getError() != wgl.WebGL.NO_ERROR)
      testFailed("GL error before texture upload");
    // Upload the image into the texture
    if (useTexSubImage2D) {
      // Initialize the texture to black first
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 2, 0,
          wgl.WebGL.RGBA, type, null);
      if (gl.getError() != wgl.WebGL.NO_ERROR)
        testFailed("GL error after texImage2D(null)");
      gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, 1, 2, wgl.WebGL.RGBA, type, data);
      if (gl.getError() != wgl.WebGL.NO_ERROR)
        testFailed("GL error after texSubImage2D");
    } else {
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, 1, 2, 0, wgl.WebGL.RGBA, type, data);
      if (gl.getError() != wgl.WebGL.NO_ERROR)
        testFailed("GL error after texImage2D");
    }

    // Point the uniform sampler to texture unit 0
    gl.uniform1i(textureLoc, 0);
    // Draw the triangles
    wtu.drawQuad(gl, [0, 0, 0, 255]);

    // Read back the rendering results
    buf = new Uint8List(1 * 2 * 4);
    gl.readPixels(0, 0, 1, 2, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
    // Check the top pixel and bottom pixel and make sure they have
    // the right color.
    debug("Checking bottom pixel");
    wtu.checkCanvasRect(gl, 0, 0, 1, 1, bottomColor, "shouldBe $bottomColor");
    debug("Checking top pixel");
    wtu.checkCanvasRect(gl, 0, 1, 1, 1, topColor, "shouldBe $topColor");
  }

  runTest()
  {
    var red = [255, 0, 0, 255];
    var green = [0, 255, 0, 255];
    var redPremultiplyAlpha = [255, 0, 0, 255];
    var greenPremultiplyAlpha = [0, 0, 0, 255];

    var types = [ wgl.WebGL.UNSIGNED_BYTE, wgl.WebGL.UNSIGNED_SHORT_5_5_5_1, wgl.WebGL.UNSIGNED_SHORT_4_4_4_4 ];
    var unpackAlignments = [ 1, 2, 4, 8 ];

    for (var i = 0; i < types.length; ++i) {
      var type = types[i];
      for (var j = 0; j < unpackAlignments.length; ++j) {
        var unpackAlignment = unpackAlignments[j];
        runOneIteration(false, type, unpackAlignment, true, false,
            red, green);
        runOneIteration(false, type, unpackAlignment, false, false,
            green, red);
        runOneIteration(false, type, unpackAlignment, true, true,
            redPremultiplyAlpha, greenPremultiplyAlpha);
        runOneIteration(false, type, unpackAlignment, false, true,
            greenPremultiplyAlpha, redPremultiplyAlpha);
        runOneIteration(true, type, unpackAlignment, true, false,
            red, green);
        runOneIteration(true, type, unpackAlignment, false, false,
            green, red);
        runOneIteration(true, type, unpackAlignment, true, true,
            redPremultiplyAlpha, greenPremultiplyAlpha);
        runOneIteration(true, type, unpackAlignment, false, true,
            greenPremultiplyAlpha, redPremultiplyAlpha);
      }
    }
  }

  var canvas = document.getElementById("example");
  gl = wtu.create3DContext(canvas);
  var program = wtu.setupTexturedQuad(gl);
  gl.disable(wgl.WebGL.BLEND);

  gl.clearColor(0,0,0,1);
  gl.clearDepth(1);

  textureLoc = gl.getUniformLocation(program, "tex");

  runTest();
}
