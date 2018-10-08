/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works for id selectors.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .a1 #b1 { background-color: green }
      .a2 div + #b2 { background-color: green }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <div></div>
          <div id="b1"></div>
      </div>
      <div id="t2">
          <div></div>
          <div id="b2"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  var b1 = document.getElementById("b1");
  var b2 = document.getElementById("b2");

  shouldBe(getComputedStyle(b1, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(b2, null).backgroundColor, transparent);

  document.body.offsetTop; // Force style recalc.

  document.getElementById("t1").className = "a1";
  shouldBe(getComputedStyle(b1, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t2").className = "a2";
  shouldBe(getComputedStyle(b2, null).backgroundColor, green);
}
