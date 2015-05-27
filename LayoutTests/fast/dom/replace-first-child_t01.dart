/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests for a bug in replaceChild where it would fail to
 * replace an element if it was the first child of its container.
 * See <a href="https://bugs.webkit.org/show_bug.cgi?id=6782">bug 6782</a>
 * for details.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div><div id="replace"></div></div>
      <div id="result"></div></body>
      ''', treeSanitizer: new NullTreeSanitizer());

  var expected = document.body.querySelector('div');
  var node = document.createElement("div");
  document.getElementById("replace").replaceWith(node);
  shouldBe(node.parentNode, expected);
}
