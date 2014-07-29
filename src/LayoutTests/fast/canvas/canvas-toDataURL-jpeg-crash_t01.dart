/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description anvas.toDataUrl("image/jpeg") should not crash.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=69681">bug 69681</a>,
      canvas.toDataUrl("image/jpeg") should not crash.<br>
      <p id="log"></p>
      <canvas id="canvas" width="2000" height="2000"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  CanvasElement canvas = document.getElementById('canvas');
  var test = canvas.toDataUrl('image/jpeg');
}
