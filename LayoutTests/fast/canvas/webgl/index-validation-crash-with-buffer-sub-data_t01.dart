/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verifies that the index validation code which is within
 * bufferSubData does not crash.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var gl = create3DContext();

  var elementBuffer = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, elementBuffer);
  gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, 256, wgl.WebGL.STATIC_DRAW);
  var data = new Uint8List(127);
  gl.bufferSubData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, 63, data);
  testPassed("bufferSubData, when buffer object was initialized with null, did not crash");
}
