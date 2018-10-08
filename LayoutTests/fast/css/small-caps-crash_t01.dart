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
  document.body.setInnerHtml('''
This test verifies that using characters not found in the default font along with the small-caps font variant does
not crash the browser.

If successful, this test should not crash, and an odd character below:

ʌ
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.setAttribute("style", "font-variant: small-caps;");
}
