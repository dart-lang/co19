/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test passes if DRT doesn't crash.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="can" width=200 height=256 style="-webkit-transform: translateZ(0)"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var can = document.querySelector("#can");
  var ctx = can.getContext("2d");
  ctx.fillStyle = "green";
  ctx.fillRect(0, 0, 300, 300);
  document.body.offsetTop;
  can.width = 300;
}
