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
 * after web-platform-tests/dom/events/Event-constructors.html
 */

import 'dart:html';
import "../../../../Utils/expect.dart";

void check(String t) {
  Event ev=new Event(t);
  Expect.equals(ev.type, t);
  Expect.equals(ev.target, null);
  Expect.equals(ev.currentTarget, null);
  Expect.equals(ev.eventPhase, 0);
//  Expect.equals(ev.bubbles, false); -- originally
  Expect.equals(ev.bubbles, true);
//  Expect.equals(ev.cancelable, false);-- originally
  Expect.equals(ev.cancelable, true);
  Expect.equals(ev.defaultPrevented, false);
  //Expect.equals(ev.isTrusted, false);
  Expect.isTrue(ev.timeStamp > 0);
}

void main() {
  check("");
  check("test");
}
