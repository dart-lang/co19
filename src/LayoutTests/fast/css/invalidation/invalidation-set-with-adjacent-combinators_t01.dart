/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works with when adjacent
 * combinators are present.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .c5 > .c4 ~ .c3 .c2 + .c1 { background-color: green }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <!--
      Expected sets

      .c1 { }
      .c2 { subtree }
      .c3 { c1 }
      .c4 { subtree }
      .c5 { c1 }

      -->
      <div id="i5">
          <div id="i4"></div>
          <div></div>
          <div></div>
          <div></div>
          <div id="i3">
              <div>
                  <div id="i2"></div>
                  <div id="i1">
                      <div>This text should have a green background.</div>
                      <span></span>
                      <span></span>
                  </div>
              </div>
          </div>
      </div>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  var i1 = document.getElementById("i1");
  var i2 = document.getElementById("i2");
  var i3 = document.getElementById("i3");
  var i4 = document.getElementById("i4");
  var i5 = document.getElementById("i5");

  shouldBe(getComputedStyle(i1, null).backgroundColor, transparent);

  i1.className = "c1";
  i2.className = "c2";
  i3.className = "c3";
  i4.className = "c4";
  i5.className = "c5";
  document.body.offsetTop; // Force style recalc.

  shouldBe(getComputedStyle(i1, null).backgroundColor, green);
}

