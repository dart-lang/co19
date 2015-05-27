/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that an attribute is not removed when set to
 * the initial value of an <input> tag using setAttribute(). 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      <input id="textInput" startval="" style="">
      ''', treeSanitizer: new NullTreeSanitizer());

  var elem = document.getElementById("textInput");

  shouldBe(elem.value, '');

  debug("<br>Before calling setAttribute(\"startval\", elem.value):<br>");
  shouldBe(elem.getAttribute('startval'), '');

  elem.setAttribute("startval", elem.value);

  debug("<br>After calling setAttribute(\"startval\", elem.value):<br>");
  shouldBe(elem.getAttribute('startval'), '');

  debug("<br>Before calling setAttribute(\"style\", elem.value):<br>");
  shouldBe(elem.getAttribute('style'), '');

  elem.setAttribute("style", elem.value);

  debug("<br>After calling setAttribute(\"style\", elem.value):<br>");
  shouldBe(elem.getAttribute('style'), '');

  elem.style.display = "none";
}
