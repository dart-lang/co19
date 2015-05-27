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
  var style = new Element.html('''
      <style>
      div { background: -webkit-canvas(squares); width:600px; height:600px; border:2px solid black }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  draw(w, h) {
    var ctx = document.getCssCanvasContext("4d", "squares", w, h);
    shouldBeNull(ctx);
  }

  asyncStart();
  window.onLoad.listen((_) {
    draw(300, 300);
    asyncEnd();
  });
}
