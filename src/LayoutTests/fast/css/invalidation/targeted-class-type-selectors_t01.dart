/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works for type
 * selectors.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .a1 span { background-color: green }
      .a2 span + div { background-color: green }
      .a3 * { background-color: green }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <span></span>
          <span></span>
          <div></div>
          <div></div>
      </div>
      <div id="t2">
          <span></span>
          <span></span>
          <div></div>
          <div></div>
      </div>
      <div id="t3">
          <span></span>
          <span></span>
          <span></span>
          <span></span>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  var children = [
    document.querySelectorAll("#t1 *"),
    document.querySelectorAll("#t2 *"),
    document.querySelectorAll("#t3 *")
  ];

  document.body.offsetTop; // Force style recalc.

  for (var i=0; i<children.length; i++) {
    for (var j=0; j<children[i].length; j++) {
      shouldBe(getComputedStyle(children[i][j], null).backgroundColor, transparent);
    }
  }

  document.body.offsetTop; // Force style recalc.

  document.getElementById("t1").className = "a1";
  shouldBe(getComputedStyle(children[0][0], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[0][1], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[0][2], null).backgroundColor, transparent);
  shouldBe(getComputedStyle(children[0][3], null).backgroundColor, transparent);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t2").className = "a2";
  shouldBe(getComputedStyle(children[1][0], null).backgroundColor, transparent);
  shouldBe(getComputedStyle(children[1][1], null).backgroundColor, transparent);
  shouldBe(getComputedStyle(children[1][2], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[1][3], null).backgroundColor, transparent);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t3").className = "a3";
  shouldBe(getComputedStyle(children[2][0], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[2][1], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[2][2], null).backgroundColor, green);
  shouldBe(getComputedStyle(children[2][3], null).backgroundColor, green);
}
