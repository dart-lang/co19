/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify readPixels() works fine with various PACK_ALIGNMENT
 * values.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec3 pos;
      attribute vec4 colorIn;
      varying vec4 color;

      void main()
      {
          color = colorIn;
          gl_Position = vec4(pos.xyz, 1.0);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision mediump float;
#endif
      varying vec4 color;

      void main()
      {
          gl_FragColor = color;
      }
      </script>
      <canvas id="example" width="32px" height="32px"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // The below declarations need to be global for "shouldBe" to see them
  var gl = null;
  var array = null;
  var pixel = [ 0, 0, 0, 0 ];
  var expectedColor = [ 0, 0, 0, 0 ];

  calculatePixelBytes(format, type)
  {
    var size = 0;
    switch (format) {
      case wgl.WebGL.ALPHA:
        size = 1;
        break;
      case wgl.WebGL.RGB:
        size = 3;
        break;
      case wgl.WebGL.RGBA:
        size = 4;
        break;
      default:
        return -1;
    }
    switch (type) {
      case wgl.WebGL.UNSIGNED_BYTE:
        break;
      case wgl.WebGL.UNSIGNED_SHORT_5_6_5:
        if (format != wgl.WebGL.RGB)
          return -1;
        size = 2;
        break;
      case wgl.WebGL.UNSIGNED_SHORT_4_4_4_4:
      case wgl.WebGL.UNSIGNED_SHORT_5_5_5_1:
        if (format != wgl.WebGL.RGBA)
          return -1;
        size = 2;
        break;
      default:
        return -1;
    }
    return size;
  }

  calculatePaddingBytes(bytesPerPixel, packAlignment, width)
  {
    var padding = 0;
    switch (packAlignment) {
      case 1:
      case 2:
      case 4:
      case 8:
        padding = (bytesPerPixel * width) % packAlignment;
        if (padding > 0)
          padding = packAlignment - padding;
        break;
      default:
        return -1;
    }
    return padding;
  }

  packColor(format, type, r, g, b, a)
  {
    // FIXME: not sure if the color packing is correct for UNSIGNED_SHORT_*.
    var color = [ 0, 0, 0, 0 ];
    switch (type) {
      case wgl.WebGL.UNSIGNED_BYTE:
        switch (format) {
          case wgl.WebGL.ALPHA:
            color[0] = a;
            break;
          case wgl.WebGL.RGB:
            color[0] = r;
            color[1] = g;
            color[2] = b;
            break;
          case wgl.WebGL.RGBA:
            color[0] = r;
            color[1] = g;
            color[2] = b;
            color[3] = a;
            break;
          default:
            return null;
        }
        break;
      case wgl.WebGL.UNSIGNED_SHORT_5_6_5:
        if (format != wgl.WebGL.RGB)
          return null;
        r >>= 3;
        g >>= 2;
        b >>= 3;
        color[0] = (r << 11) + (g << 5) + b;
        break;
      case wgl.WebGL.UNSIGNED_SHORT_4_4_4_4:
        if (format != wgl.WebGL.RGBA)
          return null;
        r >>= 4;
        g >>= 4;
        b >>= 4;
        a >>= 4;
        color[0] = (r << 12) + (g << 8) + (b << 4) + a;
        break;
      case wgl.WebGL.UNSIGNED_SHORT_5_5_5_1:
        if (format != wgl.WebGL.RGBA)
          return null;
        r >>= 3;
        g >>= 3;
        b >>= 3;
        a >>= 7;
        color[0] = (r << 11) + (g << 6) + (b << 1) + a;
        break;
        Default:
          return null;
    }
    return color;
  }

  runTestIteration(format, type, packAlignment, width, height)
  {
    debug("Testing PACK_ALIGNMENT = $packAlignment, width = $width, height = $height");
    gl.clearColor(1, 0.4, 0, 1);
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT);
    gl.pixelStorei(wgl.WebGL.PACK_ALIGNMENT, packAlignment);
    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
    var bytesPerPixel = calculatePixelBytes(format, type);
    var padding = calculatePaddingBytes(bytesPerPixel, packAlignment, width);
    var size = bytesPerPixel * width * height + padding * (height - 1);
    var isShort = false;
    switch (type) {
      case wgl.WebGL.UNSIGNED_SHORT_5_6_5:
      case wgl.WebGL.UNSIGNED_SHORT_4_4_4_4:
      case wgl.WebGL.UNSIGNED_SHORT_5_5_5_1:
        isShort = true;
    }
    if (isShort)
      size ~/= 2;
    if (size < 0)
      size = 0;
    if (type == wgl.WebGL.UNSIGNED_BYTE)
      array = new Uint8List(size);
    else
      array = new Uint16List(size);
    gl.readPixels(0, 0, width, height, format, type, array);
    if (width < 0 || height < 0) {
      glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);
      return;
    } else {
      glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
      if (array.length == 0)
        return;
    }
    // Check the last pixel of the last row.
    var bytesPerRow = width * bytesPerPixel + padding;
    var pos = bytesPerRow * (height - 1) + (width - 1) * bytesPerPixel;
    var numComponents = bytesPerPixel;
    if (isShort) {
      pos ~/= 2;
      numComponents ~/= 2;
    }
    for (var i = 0; i < numComponents; ++i)
      pixel[i] = array[pos + i];
    for (var i = numComponents; i < 4; ++i)
      pixel[i] = 0;
    expectedColor = packColor(format, type, 255, 102, 0, 255);
    shouldBeNonNull(expectedColor);
    shouldBeList(pixel, expectedColor);
  }


  shouldBeNonNull(gl = initWebGL('example', 'vshader', 'fshader', [ 'pos', 'colorIn' ], [ 0, 0, 0, 1 ], 1));
  gl.disable(wgl.WebGL.BLEND);

  debug("Testing format = RGBA and type = UNSIGNED_BYTE");
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 1, 1, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 2, 1, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 1, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 1, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 2, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 2, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 3, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 3, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 4, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 4, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 5, 1);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 5, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 5, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 6, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 7, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 8, 2);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 1, 0, 0);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 2, 0, 0);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 0, 0);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, 0, 0);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 1, -1, 1);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 2, 1, -1);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 4, 0, -1);
  runTestIteration(wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, 8, -1, -1);
}
