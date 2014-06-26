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
import "../../resources/run-after-display.dart";

main() {
  var style = new Element.html('''
      <style>
        div {
          width:600px;
          height:500px;
          border:2px solid black;
          content: -webkit-canvas(squares);
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  repaintTest()
  {
    var ctx = document.getCssCanvasContext("2d", "squares", 300, 300);

    ctx.fillStyle = "rgb(200,0,0)";
    ctx.fillRect (10, 10, 100, 100);

    ctx.fillStyle = "rgba(0, 0, 200, 0.5)";
    ctx.fillRect (50, 50, 100, 100);
    asyncEnd();
  }

  asyncStart();
  runAfterDisplay(repaintTest);
}
