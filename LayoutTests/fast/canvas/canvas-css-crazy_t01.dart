/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      canvas { width:600px; height:600px; border:2px solid black }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <canvas id="canvas"></canvas>
      ''', treeSanitizer: new NullTreeSanitizer());

  draw(w, h) {
    dynamic canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("4d");
    shouldBeNull(ctx);
  }

  asyncStart();
  window.onLoad.listen((_) {
    draw(300, 300);
    asyncEnd();
  });
}
