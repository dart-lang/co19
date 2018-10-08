/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test bufferData/bufferSubData with ArrayBuffer input.
 * Regression test for https://bugs.webkit.org/show_bug.cgi?id=41884 :
 * Implement bufferData and bufferSubData with ArrayBuffer as input
 */
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  var gl = create3DContext();
  shouldBeNonNull(gl);

  var buffer = new Uint8List(128);
  var array = buffer.buffer;
  shouldBeNonNull(array);

  var buf = gl.createBuffer();
  shouldBeNonNull(buf);

  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, array, wgl.WebGL.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_OPERATION);

  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buf);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, -10, wgl.WebGL.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);

  // This should not crash, but the selection of the overload is ambiguous per
  // Web IDL.
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, null, wgl.WebGL.STATIC_DRAW);
  gl.getError();

  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, array, wgl.WebGL.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  buffer = new Uint8List(64);
  array = buffer.buffer;

  gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, -10, array);
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);

  gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, -10, new Float32List(8));
  glErrorShouldBe(gl, wgl.WebGL.INVALID_VALUE);

  gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 10, array);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);

  gl.bufferSubData(wgl.WebGL.ARRAY_BUFFER, 10, null);
  glErrorShouldBe(gl, wgl.WebGL.NO_ERROR);
}
