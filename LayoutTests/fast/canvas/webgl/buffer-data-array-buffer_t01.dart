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
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";

main() {
  var gl = create3DContext();
  shouldBeNonNull(gl);

  var buffer = new Uint8List(128);
  var array = buffer.buffer;
  shouldBeNonNull(array);

  var buf = gl.createBuffer();
  shouldBeNonNull(buf);

  gl.bufferData(wgl.ARRAY_BUFFER, array, wgl.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.INVALID_OPERATION);

  gl.bindBuffer(wgl.ARRAY_BUFFER, buf);
  glErrorShouldBe(gl, wgl.NO_ERROR);

  gl.bufferData(wgl.ARRAY_BUFFER, -10, wgl.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.INVALID_VALUE);

  // This should not crash, but the selection of the overload is ambiguous per Web IDL.
  gl.bufferData(wgl.ARRAY_BUFFER, null, wgl.STATIC_DRAW);
  gl.getError();

  gl.bufferData(wgl.ARRAY_BUFFER, array, wgl.STATIC_DRAW);
  glErrorShouldBe(gl, wgl.NO_ERROR);

  buffer = new Uint8List(64);
  array = buffer.buffer;

  gl.bufferSubData(wgl.ARRAY_BUFFER, -10, array);
  glErrorShouldBe(gl, wgl.INVALID_VALUE);

  gl.bufferSubData(wgl.ARRAY_BUFFER, -10, new Float32List(8));
  glErrorShouldBe(gl, wgl.INVALID_VALUE);

  gl.bufferSubData(wgl.ARRAY_BUFFER, 10, array);
  glErrorShouldBe(gl, wgl.NO_ERROR);

  gl.bufferSubData(wgl.ARRAY_BUFFER, 10, null);
  glErrorShouldBe(gl, wgl.NO_ERROR);
}
