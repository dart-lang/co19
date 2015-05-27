/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that numbers in border-image-{width,outset} are returned
 * correctly
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
        .test {
            border-image-width: 0 5.5 4.4 3.3;
            border-image-outset: 2.5 0 1.4 1.9;
            border-style: solid;
            visibility: hidden;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var elm = document.querySelector('.test').getComputedStyle();
  shouldBeEqualToString(elm.borderImageWidth, "0 5.5 4.4 3.3");
  shouldBeEqualToString(elm.borderImageOutset, "2.5 0 1.4 1.9");
}

