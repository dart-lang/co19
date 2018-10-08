/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Checking API, no asserts
 * This test is only useful as a pixel test. You should see red canvas of size
 * 100x100.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";

runAfterDisplay(callback) {
    window.requestAnimationFrame((_) {
        // At this point, only the animate has happened, but no compositing
        // or layout.  Use a timeout for the callback so that notifyDone
        // can be called inside of it.
        setTimeout(callback, 0);
    });
}

main() {
  var style = new Element.html('''
      <style>
      canvas {
          outline: 1px solid blue;
      }
      body {
          background-color: darkblue;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  dynamic can = document.createElement('canvas');
  can.width = can.height = 100;
  can.style.position = "absolute";
  can.style.left = "40px";
  can.style.top = "40px";
  document.body.append(can);
  var ctx = glContext(can);
  print(ctx.runtimeType);
  ctx.clearColor(1, 0, 0, 1);
  ctx.clear(wgl.WebGL.COLOR_BUFFER_BIT);

  asyncStart();
  runAfterDisplay(() {
    CanvasElement canvas = document.getElementsByTagName('canvas')[0];
    canvas.style.top = "60px";
    asyncEnd();
  });
}
