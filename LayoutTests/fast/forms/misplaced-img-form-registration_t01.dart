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
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=34488">bug 34488</a>: Crash in mangleme in WebCore::Element::getAttribute.</p>
      <p>Pass if no crash or assertion failure.</p>
      <FORM><SELECT><IMG>
      ''', treeSanitizer: new NullTreeSanitizer());
}
