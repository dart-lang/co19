/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable attribute is "true" string,
 * element.contentEditable returns "true" and the element is editable.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div" contentEditable="true"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("div").getAttribute("contentEditable"),
      "true");
  shouldBe(document.getElementById("div").contentEditable, "true");
  shouldBe(document.getElementById("div").isContentEditable, true);
  var div = document.getElementById('div');
  shouldBe(div.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  document.getElementById("div").style.display= 'none';
}
