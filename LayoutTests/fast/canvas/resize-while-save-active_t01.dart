/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="mycanvas" width="512" height="512"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = "rgb(255,165,0)";
  ctx.fillRect(0, 0, 512, 512);
  ctx.save();
  canvas.width = 256;
  ctx.fillStyle = "rgb(255,165,0)";
  ctx.fillRect(0, 0, 256, 512);
  document.body.append(document.createElement("p"))
    .append(new Text("If we got this far without an assertion, this test passed."));
}
