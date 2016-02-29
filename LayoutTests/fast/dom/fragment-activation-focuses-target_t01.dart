/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that if an in-page link is activated, focus control
 * is transferred to the fragment if possible.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <a href="#fragment1" id="link1" tabindex="0">link1</a>
    <a href="#fragment2" id="link2" tabindex="0">link2</a>
    <br><br>
    <div id="fragment1" name="fragment1" tabindex="0">fragment1</div>
    <div id="fragment2" name="fragment2">fragment2</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var link1 = document.getElementById("link1");
  link1.focus();
  debug("Verify that the focus is on the link.");
  shouldBe(document.activeElement, link1);

  link1.click();
  debug("Click the link and verify that focus has moved to the fragment.");
  shouldBe(document.activeElement, document.getElementById('fragment1'));

  debug("Move focus back to the link and verify.");
  link1.focus();
  shouldBe(document.activeElement, link1);

  debug("Activate a link that does not have a focusable fragment and verify focus does not move.");
  var link2 = document.getElementById("link2");
  link2.focus();
  shouldBe(document.activeElement, link2);
  link2.click();
  shouldBe(document.activeElement, document.body);
}
