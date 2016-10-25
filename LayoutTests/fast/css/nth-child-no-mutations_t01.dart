/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Not necessary to recalc sibling styles for :nth-child when no
 * mutations have happened.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          #test :nth-child(odd) { color: green; }
          #test :not(.a) { color: rgb(200, 200, 200); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
          <div></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;

  var testElm = document.querySelector("#test div");
  testElm.className = "a";

  var green = "rgb(0, 128, 0)";
  shouldBe(getComputedStyle(testElm, null).color, green);
}
