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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="https://bugs.webkit.org/show_bug.cgi?id=9694">https://bugs.webkit.org/show_bug.cgi?id=9694</a>
          resize value not compared</i>.
      </p>
      <p>
          This box should have a working resize corner:
      </p>
      <div id="target" style="width: 50px; height: 50px; overflow: hidden; border: solid;"></div>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var target = document.getElementById("target");
  target.style.resize = "both";
  var computedStyle = getComputedStyle(target);
  shouldBe(computedStyle.resize, "both");
}
