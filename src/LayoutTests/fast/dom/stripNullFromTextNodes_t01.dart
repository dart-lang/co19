/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The null characters should be stripped out of the string above
 * and it should have a length of 5.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="num">\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000hell\u0000\u0000\u0000\u0000\u0000o</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById("num");
  var text = div.firstChild;
  shouldBe(text.text.length, 5);
}
