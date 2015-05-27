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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=22161">Bug 22161: Assertion failure in RenderThemeWin::systemColor when loading microsoftpdc.com</a></p>
      <p>There should be no assertions when loading this page.</p>

      <span style="outline-color: invert"></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}

