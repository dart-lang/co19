/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=28697">bug 28697</a>.</p>
    <div id="div"><p id="one"></p><p id="two">FAIL, the test did not start.</p></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  gc() {
    gcRec(n, i) {
      if (n < 1)
        return {};
      var temp = {i: "ab" + (i + (i / 100000)).toString()};
      gcRec(n-1, i);
    }
    for (var i = 0; i < 1000; i++)
      gcRec(10, i);
  }

  var div = document.getElementById("div");
  var two = document.getElementById("two");
  var range = document.createRange();
  range.setStart(two, 0);
  range.setEnd(two, 0);

  div.innerHtml = "FAIL, the test did not complete.";

  gc();

  range.startOffset;
  div.innerHtml = "PASS, the test did not crash.";
}
