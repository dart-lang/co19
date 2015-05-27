/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks to see whether setting a CSS value including
 * !important on an inline style property fails (as it should).
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style type="text/css">
    #e { color:red; visibility: hidden;}
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p id="e">This is the test element.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('e');
  e.style.color = "green !important";

  shouldBe(e.getComputedStyle().color, "rgb(255, 0, 0)");
}
