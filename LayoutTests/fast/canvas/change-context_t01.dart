/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test ensures that changing the context does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="canvas"></canvas><br />
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("canvas");
  var ctx1 = canvas.getContext("2d");
  ctx1.save();

  canvas.remove();

  ctx1.save();
}
