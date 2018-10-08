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
      <link rel="stylesheet" href="about:blank" type="text/css">
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>If the canvas below is black, then we managed to draw before loading stylesheets. Hooray!</p>
      <canvas id="mycanvas" width="400" height="200"></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    dynamic canvas = document.getElementById("mycanvas");
    canvas.getContext("2d").fillRect(0, 0, canvas.width, canvas.height);
    var imgData1 = canvas.getContext("2d").getImageData(0, 0, 1, 1);
    shouldBeList(imgData1.data, [0,0,0,255]);
    asyncEnd();
  });
}
