/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is set to a new value, the new value can 
 * be case-insensitive.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div1" contenteditable="false"></div>
    <p id="p1" contenteditable="true"></p>
    <div id="div2" contenteditable="true">
        <p id="p2" contenteditable="false"></p>
    </div>
    <div id="div3" contenteditable="true">
        <p id="p3" contenteditable="false"></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("div1").contentEditable = "TRue";
  document.getElementById("p1").contentEditable = "faLSE";
  document.getElementById("p2").contentEditable = "inHERIT";
  document.getElementById("div3").contentEditable = "PlainText-Only";
  document.getElementById("p3").contentEditable = "Inherit";

  shouldBe(document.getElementById("div1").getAttribute("contentEditable"), "true");
  shouldBe(document.getElementById("div1").contentEditable, "true");
  shouldBe(document.getElementById("div1").isContentEditable, true);
  //debug("FIXME: isContentEditable is not working properly. Related to https://bugs.webkit.org/show_bug.cgi?id=52058");
  var div1 = document.getElementById('div1');
  shouldBe(div1.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  shouldBe(document.getElementById("p1").getAttribute("contentEditable"), "false");
  shouldBe(document.getElementById("p1").contentEditable, "false");
  shouldBe(document.getElementById("p1").isContentEditable, false);
  var p1 = document.getElementById('p1');
  shouldBe(p1.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-only");

  shouldBe(document.getElementById("p2").contentEditable, "inherit");
  shouldBe(document.getElementById("p2").isContentEditable, true);
  var p2 = document.getElementById('p2');
  shouldBe(p2.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  shouldBe(document.getElementById("div3").contentEditable, "plaintext-only");
  shouldBe(document.getElementById("div3").isContentEditable, true);
  var div3 = document.getElementById('div3');
  shouldBe(div3.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write-plaintext-only");

  shouldBe(document.getElementById("p3").contentEditable, "inherit");
  shouldBe(document.getElementById("p3").isContentEditable, true);
  var p3 = document.getElementById('p3');
  shouldBe(p3.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write-plaintext-only");

  document.getElementById("div1").style.display= 'none';
  document.getElementById("p1").style.display= 'none';
  document.getElementById("div2").style.display= 'none';
  document.getElementById("div3").style.display= 'none';
}
