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
 * after web-platform-tests/dom/ranges/Range-detach.html
 *
 * @assertion Range.detach()
 * @description
 * @needsreview in javascript, attributes of detached range are still accessible
 */
import 'dart:html';

void main() {
  var r = document.createRange();
  r.detach();
  r.detach();
}
