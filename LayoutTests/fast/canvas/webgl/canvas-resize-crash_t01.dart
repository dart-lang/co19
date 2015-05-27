/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that canvas does not crash on resize.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      #example {
        width: 100%;
        height: 100%;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  start(_)
  {
    var canvas = document.getElementById('example');
    var gl = wtu.create3DContext(canvas);

    // Change the size of the canvas's backing store to match the size it is displayed.
    canvas.width = canvas.clientWidth;
    canvas.height = canvas.clientHeight;

    testPassed('PASS');
    asyncEnd();
  }

  window.onLoad.listen(start);

  asyncStart();

  document.body.setInnerHtml('''
      <canvas id="example"></canvas>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
