/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          #styled { color: green }
          @media all and(min-width: 2px) { #styled { color: red; } }
          @media all and(max-width: 1px) { #styled { color: red; } }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="styled">This should be green</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest() {
    var element = document.getElementById('styled');
    var computedColor = getComputedStyle(element).color;
    shouldBe(computedColor, "rgb(0, 128, 0)");
  }

  runTest();
}
