/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Make sure special case style sharing for readonly and type
 * attributes works
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
        div[readonly="red"] {
          color: red;
        }
        div[type="blue"] {
          color: blue;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div black>Black</div>
      <div readonly="red">Red</div>
      <div type="blue">Blue</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.querySelector("[black]")).color, "rgb(0, 0, 0)");
  shouldBe(getComputedStyle(document.querySelector("[readonly]")).color, "rgb(255, 0, 0)");
  shouldBe(getComputedStyle(document.querySelector("[type]")).color, "rgb(0, 0, 255)");
}
