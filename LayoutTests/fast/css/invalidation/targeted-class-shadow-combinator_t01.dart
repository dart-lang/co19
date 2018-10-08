/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works for ::shadow and
 * /deep/ combinators.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .t1 #host1::shadow .match { background-color: green; }
      .t2 /deep/ .match { background-color: green; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="t1">
          <div id="host1"></div>
          <div></div>
      </div>
      <div id="t2">
          <div id="host2"></div>
          <div></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Create shadow trees

  dynamic host1 = document.getElementById("host1");
  var match1 = host1.createShadowRoot().append(document.createElement("div"));
  match1.className = "match";

  dynamic host2 = document.getElementById("host2");
  var innerHost = host2.createShadowRoot().append(document.createElement("div"));
  var match2 = innerHost.createShadowRoot().append(document.createElement("div"));
  match2.className = "match";

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  shouldBe(getComputedStyle(match1, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(match2, null).backgroundColor, transparent);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t1").className = "t1";
  shouldBe(getComputedStyle(match1, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  document.getElementById("t2").className = "t2";
  shouldBe(getComputedStyle(match2, null).backgroundColor, green);
}
