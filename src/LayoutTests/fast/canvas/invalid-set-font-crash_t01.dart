/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test should not crash.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test should not crash.</p>
      <canvas id="canvas" height="300" width="300"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  init() {
    var ctx = getContext2d("canvas");
    ctx.font = "font-family: Helvetica; font-size: 48pt; font-color: #000000";
    ctx.fillText("Hello world", 10, 200);
  }

  init();
}
