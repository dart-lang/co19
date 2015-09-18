/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/ranges/Range-comparePoint-2.html
 *
 * @assertion Range.comparePoint()
 * @description
 * @needsreview in javascript, attributes of detached range are still accessible
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

/* -- extracted into seoarate test Range-comparePoint_t03.dart
test(() {
  var r = document.createRange();
  r.detach();
  assert_equals(r.comparePoint(document.body, 0), 1);
}, "detached");
*/

test(() {
  var r = document.createRange();
  assert_throws("TypeError: Failed to execute 'comparePoint' on 'Range': parameter 1 is not of type 'Node'.", () {
    r.comparePoint(null, 0);
  });
}, "null");

test(() {
  var doc = document.implementation.createHtmlDocument("tralala");
  var r = document.createRange();
  assert_throws("WrongDocumentError", () { r.comparePoint(doc.body, 0); });
}, "zero");

checkTestFailures();
}
