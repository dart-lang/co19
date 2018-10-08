/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * Test for http://bugs.webkit.org/show_bug.cgi?id=12353 REGRESSION: 
 * Crash on load (mutation event dispatch under the image element constructor
 * deletes the element).
 * No crash means test PASS.
 */
import "dart:html";

main() {
  document.addEventListener("DOMSubtreeModified", (_) {}, true);
  var img = new Element.html('<img width="1" height="1">');
}
