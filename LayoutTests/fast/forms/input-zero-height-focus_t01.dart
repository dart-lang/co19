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
      <p>
          Test for <i><a href="http://bugs.webkit.org/show_bug.cgi?id=13413">http://bugs.webkit.org/show_bug.cgi?id=13413</a>
          Failed assertion in RenderTextControl::setSelectionRange in Google Spreadsheets</i>.
      </p>
      <p>
          This test should not ASSERT.
      </p>
      <textarea id="target" style="height: 0"></textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("target").focus();
}
