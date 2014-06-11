/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that negative border image width values are ignored
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      .test {
          border-image-width: 2 3 4 5;
          border-image-width: -1;
          border-image-width: -1 2;
          border-image-width: 1 2 -0.1;
          border-image-width: 1 2 3 -0.1;

          border-image-outset: 6 7 8 9;
          border-image-outset: -1;
          border-image-outset: -1 2;
          border-image-outset: 1 2 -0.1;
          border-image-outset: 1 2 3 -0.1;

          border-style: solid;
          visibility: hidden;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var elm = document.querySelector('.test');
  shouldBeEqualToString(elm.getComputedStyle().borderImageWidth, "2 3 4 5");
  shouldBeEqualToString(elm.getComputedStyle().borderImageOutset, "6 7 8 9");
}
