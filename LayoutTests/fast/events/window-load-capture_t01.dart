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
  windowEventHandler(_) {
    document.getElementById("result").innerHtml = "PASS";
    asyncEnd();
  }
  window.addEventListener('load', windowEventHandler, true);

  asyncStart();
  document.body.setInnerHtml('''
      Capturing load event listeners on the window should fire. This test checks if they do.<br>
      <span id="result">FAIL</span>
      ''', treeSanitizer: new NullTreeSanitizer());
}
