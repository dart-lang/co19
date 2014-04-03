/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is set to "true" string from "false" or 
 * inherit, element.contentEditable returns "true" and the element is editable.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div1" contenteditable="false"></div>
    <div id="div2" contenteditable="false">
        <p id="p2"></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("div1").contentEditable = "true";
  document.getElementById("p2").contentEditable = "true";

  shouldBe(document.getElementById("div1").getAttribute("contentEditable"), "true");
  shouldBe(document.getElementById("div1").contentEditable, "true");
  shouldBe(document.getElementById("div1").isContentEditable, true);
  //debug("FIXME: setContentEditable with true/false/inherit string is not working properly. https://bugs.webkit.org/show_bug.cgi?id=52058");
  var div1 = document.getElementById('div1');
  shouldBe(div1.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  shouldBe(document.getElementById("p2").getAttribute("contentEditable"), "true");
  shouldBe(document.getElementById("p2").contentEditable, "true");
  shouldBe(document.getElementById("p2").isContentEditable, true);
  var p2 = document.getElementById('p2');
  shouldBe(p2.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  document.getElementById("div1").style.display= 'none';
  document.getElementById("div2").style.display= 'none';
}
