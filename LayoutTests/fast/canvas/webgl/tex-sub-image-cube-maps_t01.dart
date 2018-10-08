/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
** Copyright (c) 2012 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/
/** 
 * @description Checks texSubImage2D with cube map textures
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "dart:math" as Math;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;

class _Color {
  var name;
  var color;
  _Color({name,color}) {
    this.name = name;
    this.color = color;
  }
}

class _Rotation {
  var axis;
  var angle;
  _Rotation({axis,angle}) {
    this.axis = axis;
    this.angle = angle;
  }
}

class _HalfRotation {
  var colors;
  var rotations;
  _HalfRotation({colors, rotations}) {
    this.colors = colors;
    this.rotations = rotations;
  }
}

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="256" height="256" style="width: 40px; height: 40px;"></canvas>
      <div id="description"></div>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
      attribute vec4 vPosition;
      uniform mat4 rotation;
      varying vec3 texCoord;
      void main()
      {
          gl_Position = vPosition;
          vec4 direction = vec4(vPosition.x * 0.5, vPosition.y * 0.5, 1, 1);
          texCoord = normalize((rotation * direction).xyz);
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
      precision mediump float;
      uniform samplerCube tex;
      varying vec3 texCoord;
      void main()
      {
          gl_FragColor = textureCube(tex, normalize(texCoord));
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("example");

  var gl = wtu.create3DContext(canvas);
  wtu.setupUnitQuad(gl, 0, 1);
  var program = wtu.setupProgram(
      gl,
      ['vshader', 'fshader'],
      ['vPosition', 'texCoord0'], [0, 1]);
  var rotLoc = gl.getUniformLocation(program, "rotation");

  var size = 16;

  var colors = [
    new _Color(name: 'red',     color: [255,   0,   0, 255]),
    new _Color(name: 'green',   color: [  0, 255,   0, 255]),
    new _Color(name: 'blue',    color: [  0,   0, 255, 255]),
    new _Color(name: 'yellow',  color: [255, 255,   0, 255]),
    new _Color(name: 'cyan',    color: [  0, 255, 255, 255]),
    new _Color(name: 'magenta', color: [255,   0, 255, 255])
  ];

  var targets = [
    wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_X,
    wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_X,
    wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Y,
    wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Y,
    wgl.WebGL.TEXTURE_CUBE_MAP_POSITIVE_Z,
    wgl.WebGL.TEXTURE_CUBE_MAP_NEGATIVE_Z];

  var rotations = [
    new _Rotation(axis: [0, 1, 0], angle:  Math.pi / 2),
    new _Rotation(axis: [0, 1, 0], angle: -Math.pi / 2),
    new _Rotation(axis: [1, 0, 0], angle: -Math.pi / 2),
    new _Rotation(axis: [1, 0, 0], angle:  Math.pi / 2),
    new _Rotation(axis: [0, 1, 0], angle:  0),
    new _Rotation(axis: [0, 1, 0], angle:  Math.pi),
  ];

  var halfRotations = [
    new _HalfRotation(colors: [3, 4], rotations: [new _Rotation(axis: [1, 0, 0], angle:  Math.pi / 4)]),
    new _HalfRotation(colors: [4, 2], rotations: [new _Rotation(axis: [1, 0, 0], angle: -Math.pi / 4)]),
    new _HalfRotation(colors: [5, 3], rotations: [new _Rotation(axis: [1, 0, 0], angle:  Math.pi / 4 * 3)]),
    new _HalfRotation(colors: [2, 5], rotations: [new _Rotation(axis: [1, 0, 0], angle: -Math.pi / 4 * 3)]),
    new _HalfRotation(colors: [3, 0], rotations: [new _Rotation(axis: [0, 1, 0], angle:  Math.pi / 2),
                                                  new _Rotation(axis: [1, 0, 0], angle:  Math.pi / 4)]),
    new _HalfRotation(colors: [0, 2], rotations: [new _Rotation(axis: [0, 1, 0], angle:  Math.pi / 2),
                                                  new _Rotation(axis: [1, 0, 0], angle: -Math.pi / 4)]),
  ];

  var count = 0;

  checkRect(x, y, width, height, color) {
    wtu.checkCanvasRect(
        gl,
        x,
        y,
        width,
        height,
        color.color,
        "$x, $y, $width, $height should be ${color.name}");
  }

  fillLevel(target, level, size, color) {
    var halfPixelRow = new Uint8List(size * 2);
    for (var jj = 0; jj < size~/2; ++jj) {
      var off = jj * 4;
      halfPixelRow[off + 0] = color[0];
      halfPixelRow[off + 1] = color[1];
      halfPixelRow[off + 2] = color[2];
      halfPixelRow[off + 3] = color[3];
    }
    gl.texImage2D(
        target, level, wgl.WebGL.RGBA, size, size, 0, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE,
        null);
    for (var jj = 0; jj < size; ++jj) {
      gl.texSubImage2D(
          target, level, 0, jj, size ~/ 2, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, halfPixelRow);
      gl.texSubImage2D(
          target, level, size ~/ 2, jj, size ~/ 2, 1, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, halfPixelRow);
    }
  }

  axisRotation(axis, angle) {
    var dst = new Float32List(16);
    var x = axis[0];
    var y = axis[1];
    var z = axis[2];
    var n = Math.sqrt(x * x + y * y + z * z);
    x /= n;
    y /= n;
    z /= n;
    var xx = x * x;
    var yy = y * y;
    var zz = z * z;
    var c = Math.cos(angle);
    var s = Math.sin(angle);
    var oneMinusCosine = 1 - c;

    dst[ 0] = xx + (1 - xx) * c;
    dst[ 1] = x * y * oneMinusCosine + z * s;
    dst[ 2] = x * z * oneMinusCosine - y * s;
    dst[ 3] = 0.0;
    dst[ 4] = x * y * oneMinusCosine - z * s;
    dst[ 5] = yy + (1 - yy) * c;
    dst[ 6] = y * z * oneMinusCosine + x * s;
    dst[ 7] = 0.0;
    dst[ 8] = x * z * oneMinusCosine + y * s;
    dst[ 9] = y * z * oneMinusCosine - x * s;
    dst[10] = zz + (1 - zz) * c;
    dst[11] = 0.0;
    dst[12] = 0.0;
    dst[13] = 0.0;
    dst[14] = 0.0;
    dst[15] = 1.0;

    return dst;
  };

  mulMatrix(a, b) {
    var dst = new Float32List(16);
    var a00 = a[0];
    var a01 = a[1];
    var a02 = a[2];
    var a03 = a[3];
    var a10 = a[ 4 + 0];
    var a11 = a[ 4 + 1];
    var a12 = a[ 4 + 2];
    var a13 = a[ 4 + 3];
    var a20 = a[ 8 + 0];
    var a21 = a[ 8 + 1];
    var a22 = a[ 8 + 2];
    var a23 = a[ 8 + 3];
    var a30 = a[12 + 0];
    var a31 = a[12 + 1];
    var a32 = a[12 + 2];
    var a33 = a[12 + 3];
    var b00 = b[0];
    var b01 = b[1];
    var b02 = b[2];
    var b03 = b[3];
    var b10 = b[ 4 + 0];
    var b11 = b[ 4 + 1];
    var b12 = b[ 4 + 2];
    var b13 = b[ 4 + 3];
    var b20 = b[ 8 + 0];
    var b21 = b[ 8 + 1];
    var b22 = b[ 8 + 2];
    var b23 = b[ 8 + 3];
    var b30 = b[12 + 0];
    var b31 = b[12 + 1];
    var b32 = b[12 + 2];
    var b33 = b[12 + 3];
    dst[ 0] = a00 * b00 + a01 * b10 + a02 * b20 + a03 * b30;
    dst[ 1] = a00 * b01 + a01 * b11 + a02 * b21 + a03 * b31;
    dst[ 2] = a00 * b02 + a01 * b12 + a02 * b22 + a03 * b32;
    dst[ 3] = a00 * b03 + a01 * b13 + a02 * b23 + a03 * b33;
    dst[ 4] = a10 * b00 + a11 * b10 + a12 * b20 + a13 * b30;
    dst[ 5] = a10 * b01 + a11 * b11 + a12 * b21 + a13 * b31;
    dst[ 6] = a10 * b02 + a11 * b12 + a12 * b22 + a13 * b32;
    dst[ 7] = a10 * b03 + a11 * b13 + a12 * b23 + a13 * b33;
    dst[ 8] = a20 * b00 + a21 * b10 + a22 * b20 + a23 * b30;
    dst[ 9] = a20 * b01 + a21 * b11 + a22 * b21 + a23 * b31;
    dst[10] = a20 * b02 + a21 * b12 + a22 * b22 + a23 * b32;
    dst[11] = a20 * b03 + a21 * b13 + a22 * b23 + a23 * b33;
    dst[12] = a30 * b00 + a31 * b10 + a32 * b20 + a33 * b30;
    dst[13] = a30 * b01 + a31 * b11 + a32 * b21 + a33 * b31;
    dst[14] = a30 * b02 + a31 * b12 + a32 * b22 + a33 * b32;
    dst[15] = a30 * b03 + a31 * b13 + a32 * b23 + a33 * b33;
    return dst;
  };

  testSize(num size) {
    debug("");
    debug("testing size: $size");
    var canvasSize = Math.max(size ~/ 4, 2);
    canvas.width = canvasSize;
    canvas.height = canvasSize;
    gl.viewport(0, 0, canvasSize, canvasSize);
    var tex = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_CUBE_MAP, tex);

    // Seems like I should be using LINEAR here with some other math
    // to make sure I get more mip coverage but that's easier said
    // than done.

    gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);

    for (var jj = 0; jj < 2; ++jj) {
      for (var tt = 0; tt < targets.length; ++tt) {
        var color = colors[(tt + count) % colors.length];
        fillLevel(targets[tt], 0, size, color.color);
      }
      if (jj == 1) {
        debug("use mipmap");
        gl.texParameteri(
            wgl.WebGL.TEXTURE_CUBE_MAP, wgl.WebGL.TEXTURE_MIN_FILTER,
            wgl.WebGL.NEAREST_MIPMAP_NEAREST);
        gl.generateMipmap(wgl.WebGL.TEXTURE_CUBE_MAP);
      }

      var err = gl.getError();
      if (err == wgl.WebGL.OUT_OF_MEMORY) {
        debug("out of memory");
        return false;
      }
      if (err != wgl.WebGL.NO_ERROR) {
        testFailed("unexpected gl error: " + wtu.glEnumToString(gl, err));
      }

      for (var rr = 0; rr < rotations.length; ++rr) {
        var rot = rotations[rr];
        var color = colors[(rr + count) % colors.length];
        var rotMat = axisRotation(rot.axis, rot.angle);
        gl.uniformMatrix4fv(rotLoc, false, rotMat);
        wtu.drawQuad(gl);
        wtu.checkCanvas(
            gl, color.color,
            wtu.glEnumToString(gl, targets[rr]) + " should be " + color.name);
      }

      for (var rr = 0; rr < halfRotations.length; ++rr) {
        var h = halfRotations[rr];
        var rots = h.rotations;
        var rotMat = axisRotation(rots[0].axis, rots[0].angle);
        for (var ii = 1; ii < rots.length; ++ii) {
          var tmpMat = axisRotation(rots[ii].axis, rots[ii].angle);
          rotMat = mulMatrix(tmpMat, rotMat);
        }
        gl.uniformMatrix4fv(rotLoc, false, rotMat);
        wtu.drawQuad(gl);

        for (var ii = 0; ii < 2; ++ii) {
          checkRect(
              0,
              canvasSize ~/ 2 * ii,
              canvasSize,
              canvasSize ~/ 2,
              colors[(h.colors[ii] + count) % colors.length]);
        }
      }
      ++count;
    }

    gl.deleteTexture(tex);
    return true;
  }

  testSize(size);

  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "Should be no errors.");
}
