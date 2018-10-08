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
      This tests for a regression against
      <i><a href="https://bugs.webkit.org/show_bug.cgi?id=6942">https://bugs.webkit.org/show_bug.cgi?id=6942</a>
      Assertion failure in HTMLSelectElementImpl::selectedIndex (m_multiple)</i>
      <hr>
      No assertion failure (on a debug build) means test PASS.
      <select id="t">
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement t = document.getElementById('t');
  t.selectedIndex;
}
