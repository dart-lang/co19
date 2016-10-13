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
 * after web-platform-tests/dom/events/Event-constants.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void main() {
  Expect.equals(Event.CAPTURING_PHASE, 1);
  Expect.equals(Event.AT_TARGET, 2);
  Expect.equals(Event.BUBBLING_PHASE, 3);
}
