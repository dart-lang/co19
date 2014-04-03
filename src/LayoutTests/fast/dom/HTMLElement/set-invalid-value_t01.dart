/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is set to invalid string, SYNTAX_ERR 
 * exception (code: 12) must be raised.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div" contenteditable="true"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldThrow(() {
    document.getElementById('div').contentEditable = 'abc';
  }, (e) => e is DomException && e.name == DomException.SYNTAX);
  shouldBe(document.getElementById("div").getAttribute("contentEditable"), "true");
  shouldBe(document.getElementById("div").contentEditable, "true");
  shouldBe(document.getElementById("div").isContentEditable, true);
  var div = document.getElementById('div');
  shouldBe(div.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  shouldThrow(() {
    document.getElementById('div').contentEditable = '';
  }, (e) => e is DomException && e.name == DomException.SYNTAX);
  shouldBe(document.getElementById("div").getAttribute("contentEditable"), "true");
  shouldBe(document.getElementById("div").contentEditable, "true");
  shouldBe(document.getElementById("div").isContentEditable, true);
  shouldBe(div.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  document.getElementById("div").style.display= 'none';
}
