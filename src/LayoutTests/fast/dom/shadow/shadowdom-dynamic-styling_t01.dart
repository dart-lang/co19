/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=92899.
 * Dynamically styling ShadowDom content on a node distributed to another 
 * shadow insertion point fails.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="box" style="border: 1px solid black;">
      <div id="item"><div>Content required here to reproduce bug.</div></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var box = document.querySelector("#box");
  var oldestShadowRoot = box.createShadowRoot();
  oldestShadowRoot.innerHtml = "<content></content>";

  var youngestShadowRoot = document.querySelector("#item").createShadowRoot();
  youngestShadowRoot.innerHtml = "<style>" +
    ".selected {background: red;}" +
    "</style>" +
    "<div id='target'>Content</div>";

  document.body.offsetLeft;

  var target = youngestShadowRoot.querySelector("div");
  target.classes.add("selected");
  shouldBe(target.getComputedStyle().backgroundColor, "rgb(255, 0, 0)");
}
