/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is set to "inherit", the attribute must 
 * be removed and element.contentEditable should return "inherit".
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div" contenteditable="true">
        <p id="p" contenteditable="false"></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("p").contentEditable = "inherit";

  shouldBe(document.getElementById("p").contentEditable, "inherit");
  shouldBe(document.getElementById("p").isContentEditable, true);
  debug("FIXME: setContentEditable with true/false/inherit string is not working properly. https://bugs.webkit.org/show_bug.cgi?id=52058");
  var p = document.getElementById('p');
  shouldBe(p.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  document.getElementById("div").style.display= 'none';
}
