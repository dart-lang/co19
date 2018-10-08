/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
        <style>
            div {
              width: 200px;
              height: 200px;
              border: 5px solid black;
              padding: 10px;
          }
          #d1 {
              -moz-box-sizing: border-box;
              -webkit-box-sizing: border-box; 
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This tests that getComputedStyle will take box-sizing into account when computing the width and height of a box. <br>
      <div id="d1"></div>
      <div id="d2"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var d1 = document.getElementById('d1');
    var d2 = document.getElementById('d2');

    var style = getComputedStyle(d1, null);
    var computedWidth = style.getPropertyValue("width");
    var computedHeight = style.getPropertyValue("height");

    var size = "200px";

    shouldBe(computedWidth, size);
    shouldBe(computedHeight, size);

    style = getComputedStyle(d2, null);
    computedWidth = style.getPropertyValue("width");
    computedHeight = style.getPropertyValue("height");

    shouldBe(computedWidth, size);
    shouldBe(computedHeight, size);
  }

  test();
}
