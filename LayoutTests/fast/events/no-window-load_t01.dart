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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div>
      This test ensures that "load" events for images do not trigger bubble
      or capture handlers on the window object. We need this quirk to be
      compatible with a variety of web sites.
      </div>
      Bubble for load event hit at most once: <span id="bubble">PASS</span>.<br>
      Capture for load event hit at most once: <span id="capture">PASS</span>.<br>

      <img src="$root/resources/greenbox.png">
      <img src="$root/resources/greenbox.png">
      ''', treeSanitizer: new NullTreeSanitizer());

  var bubbleCount = 0;

  checkBubble(_)
  {
    bubbleCount++;
    if (bubbleCount > 1) {
      document.getElementById("bubble").innerHtml = "FAIL (hit $bubbleCount times)";
    }
    asyncEnd();
  }

  var captureCount = 0;

  checkCapture(_)
  {
    captureCount++;
    if (captureCount > 1) {
      document.getElementById("capture").innerHtml = "FAIL (hit $captureCount times)";
    }
    asyncEnd();
  }

  asyncMultiStart(2);
  window.addEventListener("load", checkBubble, false);
  window.addEventListener("load", checkCapture, true);
}
