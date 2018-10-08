/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <object id="object" type="image/svg+xml" />
    ''', treeSanitizer: new NullTreeSanitizer());

  var count = 0;

  setText(_) {
    count++;
    if (count > 100) {
      document.removeEventListener("beforeload", setText, true);
      asyncEnd();
    }
    document.getElementById("object").text = "A";
  }

  asyncStart();

  document.execCommand("SelectAll", false, '');
  document.getElementById("object").text= "A";
  document.addEventListener("beforeload", setText, true);
  var event = new Event("beforeload", canBubble: false);
  document.documentElement.dispatchEvent(event);
}
