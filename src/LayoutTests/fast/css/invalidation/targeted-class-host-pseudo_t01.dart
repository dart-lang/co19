/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check that targeted class invalidation works with the :host
 * pseudo class.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="host1"></div>
      <div id="host2"></div>
      <div id="host3" class="c3"></div>
      <div id="host4"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  // Create shadow trees

  var host1 = document.getElementById("host1");
  host1.createShadowRoot().innerHtml = "<style>:host(.c1) { background-color: green }</style><div></div><div></div><div></div><div></div><div></div>";

  var host2 = document.getElementById("host2");
  host2.createShadowRoot().innerHtml = '<style>:host(.c2) .inner { background-color: green }</style><div></div><div></div><div></div><div><span id="inner" class="inner"></span></div>';

  var host3 = document.getElementById("host3");
  host3.createShadowRoot().innerHtml = "<style>:host(#host3:not(.c3)) { background-color: green }</style><div></div><div></div><div></div><div></div>";

  var host4 = document.getElementById("host4");
  host4.createShadowRoot().innerHtml = "<style>:host(.nomatch, .c4) { background-color: green }</style><div></div><div></div><div></div><div></div>";

  var transparent = "rgba(0, 0, 0, 0)";
  var green = "rgb(0, 128, 0)";

  var inner = host2.shadowRoot.getElementById("inner");

  shouldBe(getComputedStyle(host1, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(inner, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(host3, null).backgroundColor, transparent);
  shouldBe(getComputedStyle(host4, null).backgroundColor, transparent);

  document.body.offsetLeft; // force style recalc.

  host1.className = "c1";
  shouldBe(getComputedStyle(host1, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  host2.className = "c2";
  shouldBe(getComputedStyle(inner, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  host3.className = "";
  shouldBe(getComputedStyle(host3, null).backgroundColor, green);

  document.body.offsetLeft; // force style recalc.

  host4.className = "c4";
  shouldBe(getComputedStyle(host4, null).backgroundColor, green);
}
