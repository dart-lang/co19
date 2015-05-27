/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When contentEditable is missing, it maps to "inherit" state 
 * and the element is editable if its parent is.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="div" contentEditable="true">
        <p id="p"></p>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("p").contentEditable, "inherit");
  shouldBe(document.getElementById("p").isContentEditable, true);
  var p = document.getElementById('p');
  shouldBe(p.getComputedStyle().getPropertyValue("-webkit-user-modify"),
      "read-write");

  document.getElementById("div").style.display= 'none';
}
