/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works with :-webkit-any
 * selectors.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      :-webkit-any(.a1) { background-color: green }
      .a2 :-webkit-any(.b2) { background-color: green }
      .a3 :-webkit-any(.b3, .c3) { background-color: green }
      .a4 :-webkit-any(:not(.b4), .c4) { background-color: green }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
      </div>
      <div id="t2">
          <span></span>
          <span></span>
          <span></span>
          <span class="b2"></span>
      </div>
      <div id="t3">
          <span></span>
          <span></span>
          <span class="b3"></span>
          <span class="c3"></span>
      </div>
      <div id="t4">
          <span></span>
          <span class="b4"></span>
          <span class="b4"></span>
          <span class="c4"></span>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  var t1 = document.getElementById("t1");
  var b2 = document.querySelector("#t2 .b2");
  var b3 = document.querySelector("#t3 .b3");
  var c3 = document.querySelector("#t3 .c3");
  var spans4 = document.querySelectorAll("#t4 span");

  shouldBe(getComputedStyle(t1, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(b2, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(b3, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(c3, null).backgroundColor, transparent);

  for (var i=0; i<4; i++)
    shouldBe(getComputedStyle(spans4[i], null).backgroundColor, transparent);

  document.body.offsetLeft; // force style recalc.

  t1.className = "a1";
  shouldBe(getComputedStyle(t1, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t2").className = "a2";
  shouldBe(getComputedStyle(b2, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t3").className = "a3";
  shouldBe(getComputedStyle(b3, null).backgroundColor, green);
  shouldBe(getComputedStyle(c3, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t4").className = "a4";
  shouldBe(getComputedStyle(spans4[0], null).backgroundColor, green);
  shouldBe(getComputedStyle(spans4[1], null).backgroundColor, transparent);
  shouldBe(getComputedStyle(spans4[2], null).backgroundColor, transparent);
  shouldBe(getComputedStyle(spans4[3], null).backgroundColor, green);
}
