/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checks a buffer can only be bound to 1 target.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="40" height="40" style="width: 40px; height: 40px;"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("Canvas.getContext");

  dynamic gl = create3DContext(document.getElementById("canvas"));
  if (gl == null) {
    testFailed("context does not exist");
  } else {
    testPassed("context exists");

    var buf = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, buf);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "should be able to bind buffer.");
    gl.bindBuffer(wgl.ARRAY_BUFFER, null);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "should be able to unbind buffer.");
    gl.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, buf);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "should get INVALID_OPERATION if attempting to bind buffer to different target");

    buf = gl.createBuffer();
    gl.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, buf);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "should be able to bind buffer.");
    gl.bindBuffer(wgl.ELEMENT_ARRAY_BUFFER, null);
    assertMsg(gl.getError() == wgl.NO_ERROR,
        "should be able to unbind buffer.");
    gl.bindBuffer(wgl.ARRAY_BUFFER, buf);
    assertMsg(gl.getError() == wgl.INVALID_OPERATION,
        "should get INVALID_OPERATION if attempting to bind buffer to different target");
  }
}
