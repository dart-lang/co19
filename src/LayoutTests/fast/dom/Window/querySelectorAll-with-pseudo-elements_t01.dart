/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test verifies that the querySelectorAll() API does not 
 * return any matched elements when querying for pseudo-element selectors.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
    <style type="text/css">
    div:after {
        content:"";
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <div> </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.body.querySelectorAll("div::after").length, 0);
  shouldBe(document.querySelectorAll("html::before").length, 0);
}
