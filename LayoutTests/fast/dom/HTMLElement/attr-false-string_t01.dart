/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable attribute is "false" string,
 * element.contentEditable returns "false" and the element is NOT editable.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div" contentEditable="false"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("div").getAttribute("contentEditable"),
      "false");
  shouldBe(document.getElementById("div").contentEditable, "false");
  shouldBe(document.getElementById("div").isContentEditable, false);
  var div = document.getElementById('div');
  shouldBe(div.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-only");
  document.getElementById("div").style.display= 'none';
}
