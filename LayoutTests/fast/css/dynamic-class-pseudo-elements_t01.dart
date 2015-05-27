/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Change classes affecting pseudo elements
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      .a1 .b1::before { background-color: green; content: "X" }
      .a2 .b2::after { background-color: green; content: "X" }
      .a3 .b3::first-line { background-color: green }
      .a4 .b4::first-letter { background-color: green }

      /* workaround for issue 351322 */
      .b3::first-line { background-color: transparent }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <div class="b1" id="r1"> &lt; Background of 'X' should be green</div>
          <span></span><span></span><span></span><span></span><span></span><span></span>
      </div>
      <div id="t2">
          <div class="b2" id="r2">Background of 'X' should be green &gt; </div>
          <span></span><span></span><span></span><span></span><span></span><span></span>
      </div>
      <div id="t3">
          <div class="b3" id="r3">Background should be green</div>
          <span></span><span></span><span></span><span></span><span></span><span></span>
      </div>
      <div id="t4">
          <div class="b4" id="r4">Background of first letter should be green</div>
          <span></span><span></span><span></span><span></span><span></span><span></span>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  forceLayout() {
    document.body.offsetLeft;
  }

  document.body.offsetTop; // force style recalc.

  var transparent = 'rgba(0, 0, 0, 0)';
  var green = 'rgb(0, 128, 0)';

  var t1 = document.getElementById("t1");
  var r1 = document.getElementById("r1");
  shouldBe(getComputedStyle(r1, '::before').backgroundColor, transparent);

  forceLayout();
  t1.className = "a1";

  shouldBe(getComputedStyle(r1, '::before').backgroundColor, green);

  var t2 = document.getElementById("t2");
  var r2 = document.getElementById("r2");
  shouldBe(getComputedStyle(r2, '::after').backgroundColor, transparent);

  forceLayout();
  t2.className = "a2";

  shouldBe(getComputedStyle(r2, '::after').backgroundColor, green);

  var t3 = document.getElementById("t3");
  var r3 = document.getElementById("r3");
  shouldBe(getComputedStyle(r3, '::first-line').backgroundColor, transparent);

  forceLayout();
  t3.className = "a3";

  shouldBe(getComputedStyle(r3, '::first-line').backgroundColor, green);

  var t4 = document.getElementById("t4");
  var r4 = document.getElementById("r4");
  shouldBe(getComputedStyle(r4, '::first-letter').backgroundColor, transparent);

  forceLayout();
  t4.className = "a4";

  document.body.offsetLeft; // workaround for issue 351308
  shouldBe(getComputedStyle(r4, '::first-letter').backgroundColor, green);
}
