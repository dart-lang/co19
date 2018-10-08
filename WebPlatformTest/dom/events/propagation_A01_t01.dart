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
 * after web-platform-tests/dom/events/Event-propagation.html
 *
 * @description
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void testPropagationFlag(Event ev, bool expected, String desc) {
   var called = false;
   var callback = (Event ev) { called = true; };
   document.head.addEventListener("foo", callback);
   document.head.dispatchEvent(ev);
   Expect.equals(called, expected, desc);
   document.head.removeEventListener("foo", callback);
}

void main() {
  var ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Newly-created Event");

  ev.stopPropagation();
  testPropagationFlag(ev, false, "After stopPropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Reinitialized after stopPropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  ev.stopImmediatePropagation();
  testPropagationFlag(ev, false, "After stopImmediatePropagation()");

  ev = new Event("foo", canBubble:true, cancelable:false);
  testPropagationFlag(ev, true, "Reinitialized after stopImmediatePropagation()");
}
