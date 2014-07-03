/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test passes by not crashing.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>Regression test for bug <a href="http://webkit.org/b/106244">106244</a></p>
      <p>Test passes by not crashing.</p>
      <canvas id="test"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("test");
  var context = canvas.getContext("2d");
  for (var x = 0; x < 100; x++) {
    context.restore();
    context.save();
    context.save();
    //context.measureText("a", 0, 0, 0);
    context.measureText("a");
  }
}
