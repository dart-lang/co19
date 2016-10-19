/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that webkitMaskBoxImageWidth is correctly
 * parsed and returned from getComputedStyle().
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      .test * {
          -webkit-mask-box-image-source: url(resources/dot.png);
          -webkit-mask-box-image-slice: 3 fill;
          width: 100px;
          height: 100px;
          background-color: blue;
          visibility: hidden;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>
        <div class="test"></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var tests = [
    ["auto", "auto"],
    ["1", "1"],
    ["0px", "0px"],
    ["97%", "97%"],
    ["inherit", "auto"],
    ["initial", "auto"]
  ];
  var testElm = document.querySelector('.test');
  shouldBeEqualToString(testElm.getComputedStyle()
      .getPropertyValue('-webkit-mask-box-image-Width'), "auto");
  for (var i in tests) {
    testElm.style.setProperty("-webkit-mask-box-image-Width", i[0]);
    shouldBeEqualToString(testElm.getComputedStyle()
        .getPropertyValue('-webkit-mask-box-image-Width'), i[1]);
  }
}
