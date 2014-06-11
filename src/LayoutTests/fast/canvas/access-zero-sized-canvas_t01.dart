/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that accessing the context of a zero sized
 * canvas does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas" width="0" height="0"></canvas><br />
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = document.getElementById("canvas").getContext("2d");
  context.fillStyle = "green";
}
