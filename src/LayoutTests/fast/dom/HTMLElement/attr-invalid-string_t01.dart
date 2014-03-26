/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable attribute is invalid string,
 * element.contentEditable returns "inherit".
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="d" contentEditable="abc"></div>
    <div id="d2" contentEditable="inherit"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("d").getAttribute("contentEditable"), "abc");
  shouldBe(document.getElementById("d").contentEditable, "inherit");
  shouldBe(document.getElementById("d").isContentEditable, false);
  var d = document.getElementById('d');
  shouldBe(d.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-only");

  shouldBe(document.getElementById("d2").getAttribute("contentEditable"),
      "inherit");
  shouldBe(document.getElementById("d2").contentEditable, "inherit");
  shouldBe(document.getElementById("d2").isContentEditable, false);
  var d2 = document.getElementById('d2');
  shouldBe(d2.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-only");

  document.getElementById("d").style.display= 'none';
  document.getElementById("d2").style.display= 'none';
}
