/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test PASSED if it did not crash
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <fieldset><legend style="display: inline">foo</legend></fieldset>
    <p>Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=23753">23753</a>: Assertion failure in RenderBlock::createLineBoxes() when a legend has display: inline</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
