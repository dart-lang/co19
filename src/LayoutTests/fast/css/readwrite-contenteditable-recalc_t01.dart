/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          div:read-only, span:read-only { background-color: rgb(204, 255, 255); }
          div:read-write, span:read-write { background-color: rgb(255, 204, 204); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="p1" contenteditable>Some parent text. <span id="c1a">Some <span id="c1b">child text.</span></span></div>
      <div id="p2">Some parent text. <span id="c2a">Some <span id="c2b">child text.</span></span></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var readOnlyColor = "rgb(204, 255, 255)";
  var readWriteColor = "rgb(255, 204, 204)";

  var p1 = document.getElementById('p1');
  var c1a = document.getElementById('c1a');
  var c1b = document.getElementById('c1b');

  var p2 = document.getElementById('p2');
  var c2a = document.getElementById('c2a');
  var c2b = document.getElementById('c2b');

  var backgroundColorOf = (elmName) {
    return getComputedStyle(elmName).getPropertyValue("background-color");
  };

  // Check initial computed style.

  shouldBe(backgroundColorOf(p1), readWriteColor);
  shouldBe(backgroundColorOf(c1a), readWriteColor);
  shouldBe(backgroundColorOf(c1b), readWriteColor);

  shouldBe(backgroundColorOf(p2), readOnlyColor);
  shouldBe(backgroundColorOf(c2a), readOnlyColor);
  shouldBe(backgroundColorOf(c2b), readOnlyColor);

  p1.setAttribute("contenteditable", "false");
  p2.setAttribute("contenteditable", "true");

  // Check computed style after changing attribute.

  shouldBe(backgroundColorOf(p1), readOnlyColor);
  shouldBe(backgroundColorOf(c1a), readOnlyColor);
  shouldBe(backgroundColorOf(c1b), readOnlyColor);

  shouldBe(backgroundColorOf(p2), readWriteColor);
  shouldBe(backgroundColorOf(c2a), readWriteColor);
  shouldBe(backgroundColorOf(c2b), readWriteColor);
}
