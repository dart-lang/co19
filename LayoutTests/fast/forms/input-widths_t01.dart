/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Text field types should have the same default widths.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id=parent>
      <input type=text id=text>

      <input type=email id=email>
      <input type=number id=number>
      <input type=password id=password>
      <input type=tel id=tel>
      <input type=url id=url>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var baseWidth = document.getElementById('text').offsetWidth;

  shouldBe(document.getElementById("email").offsetWidth, baseWidth);
  shouldBe(document.getElementById("number").offsetWidth, baseWidth);
  shouldBe(document.getElementById("password").offsetWidth, baseWidth);
  shouldBe(document.getElementById("tel").offsetWidth, baseWidth);
  shouldBe(document.getElementById("url").offsetWidth, baseWidth);

  // type=search is not tested intentionally.
}

