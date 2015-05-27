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
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=18681">bug 18681</a>:
      BOM characters should not be removed from input stream.<p>
      <div id=BOMs>﻿</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById("BOMs").innerHtml.length, 1);
}
