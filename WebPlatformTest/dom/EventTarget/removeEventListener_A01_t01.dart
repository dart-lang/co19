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
/**
 * after web-platform-tests/dom/events/EventTarget-addEventListener.html
 *
 * @assertion  http://dom.spec.whatwg.org/#dom-eventtarget-removeeventlistener
 * @description removing a null event listener should succeed
 * @needsreview dom.spec.whatwg.org spec differs from the dart's one
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  document.removeEventListener("x", null, false);
  document.removeEventListener("x", null, true);
  document.removeEventListener("x", null);
}
