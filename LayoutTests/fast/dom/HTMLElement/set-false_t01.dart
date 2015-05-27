/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is set to "false" string from "true" or
 * inherit, element.contentEditable returns "false" and the element is NOT 
 * editable.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div1" contenteditable="true"></div>
    <div id="div2" contenteditable="true">
        <p id="p2"></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("div1").contentEditable = "false";
  document.getElementById("p2").contentEditable = "false";

  shouldBe(document.getElementById("div1").getAttribute("contentEditable"),
      "false");
  shouldBe(document.getElementById("div1").contentEditable, "false");
  shouldBe(document.getElementById("div1").isContentEditable, false);
  var div1 = document.getElementById('div1');
  shouldBe(div1.getComputedStyle().getPropertyValue("-webkit-user-modify"),
     "read-only");

  shouldBe(document.getElementById("p2").contentEditable, "false");
  shouldBe(document.getElementById("p2").isContentEditable, false);
  var p2 = document.getElementById('p2');
  shouldBe(p2.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-only");

  document.getElementById("div1").style.display= 'none';
  document.getElementById("div2").style.display= 'none';
}
