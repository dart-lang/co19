/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that counterIncrement property value is none if no counter
 * specified
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var style = getComputedStyle(document.body, null);
  shouldBe(style.counterIncrement, 'none');
  shouldBe(style.counterReset, 'none');
}
